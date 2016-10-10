//
//  AlbumDetalhesViewModel.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import RxSwift

class AlbumDetalhesViewModel
{
    let title = Variable("")
    let url = Variable("")
    let thumbnailUrl = Variable("")
    
    init(model: Album) {
        title.value = model.title
        url.value = model.url
        thumbnailUrl.value = model.thumbnailUrl
    }
}
