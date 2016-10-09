//
//  Album.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation

struct Album
{
    var id: Int
    var albumId: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    static func fromDTO(dto: AlbumDTO) -> Album
    {
        return Album(id: dto.id!, albumId: dto.albumId!, title: dto.title, url: dto.url, thumbnailUrl: dto.thumbnailUrl)
    }
}
