//
//  AlbumsViewModel.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AlbumsViewModel
{
    let title = "Elo7"
    
    var loaded = Variable<Bool>(false)

    var albums: Observable<[Album]> {
        return AlbumRepository.loadAllAsync().shareReplay(1)
    }
    
    private let bag = DisposeBag()
    
    init() {
        albums
            .subscribe(onNext: {[unowned self] _ in self.loaded.value = true } )
            .addDisposableTo(bag)
    }
}
