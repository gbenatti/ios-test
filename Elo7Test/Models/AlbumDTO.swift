//
//  AlbumDTO.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class AlbumDTO : Mappable
{
    var id: Int?
    var albumId: Int?
    var title: String = ""
    var url: String = ""
    var thumbnailUrl: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        albumId         <- map["albumId"]
        title           <- map["title"]
        url             <- map["url"]
        thumbnailUrl    <- map["thumbnailUrl"]
    }
}
