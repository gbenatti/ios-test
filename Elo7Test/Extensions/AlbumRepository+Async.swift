//
//  AlbumRepository+Async.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import RxSwift

extension AlbumRepository {
    
    class func loadAllAsync() -> Observable<Element> {
        return Observable.create { observer in
            loadAll {
                switch $0 {
                case .success(let element):
                    observer.onNext(element)
                    observer.onCompleted()
                    
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
