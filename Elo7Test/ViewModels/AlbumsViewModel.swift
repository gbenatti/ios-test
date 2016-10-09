//
//  AlbumsViewModel.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import RxSwift

class AlbumsViewModel
{
    let title = "Elo7"

    var albums: Observable<[Album]> {
        return AlbumRepository.loadAllAsync().shareReplay(1)
    }
}
