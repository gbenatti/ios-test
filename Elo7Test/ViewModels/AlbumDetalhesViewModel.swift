//
//  AlbumDetalhesViewModel.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation

class AlbumDetalhesViewModel
{
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(model: Album) {
        title = model.title
        url = model.url
        thumbnailUrl = model.thumbnailUrl
    }
}
