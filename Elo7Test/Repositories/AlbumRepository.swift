//
//  AlbumRepository.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import Alamofire

class AlbumRepository
{
    typealias Element = [Album]

    class func loadAll(callback:@escaping (Result<Element>) -> Void)
    {
        AlbumService().getAlbums {
            switch $0 {
            case .success(let value):
                let result = value.map(Album.fromDTO)
                callback(Result.success(result))
                break;
            case .failure(let error):
                callback(Result.failure(error))
            }
        }
    }
}
