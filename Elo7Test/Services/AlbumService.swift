//
//  AlbumService.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class AlbumService
{
    typealias resultType    = Result<[AlbumDTO]>

    let ALBUMS_URL = "https://jsonplaceholder.typicode.com/photos"

    func getAlbums(callback: @escaping ((resultType) -> Void))
    {
        Alamofire.request(ALBUMS_URL)
            .validate()
            .responseArray {
                callback($0.result)
        }
    }
}
