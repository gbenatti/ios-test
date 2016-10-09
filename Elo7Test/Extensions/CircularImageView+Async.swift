//
//  CircularImageView+Async.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import Kingfisher

extension CircularImageView
{
    func loadAsync(withImageUrl imageURL: String) {
        let placeHolderImage = UIImage(named: "default.png")
        
        let optionInfo: KingfisherOptionsInfo = [
            .downloadPriority(0.5),
            .transition(ImageTransition.fade(0.5))
        ]
        
        self.kf.setImage(with: URL(string: imageURL),
                         placeholder: placeHolderImage,
                         options: optionInfo,
                                progressBlock: nil,
                                completionHandler: { (image, error, cacheType, imageURL) -> () in
                                    self.setRounded()
                                    
        })
    }
    
    func setRounded(withBorder: Bool = false) {
        let radius = self.frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        if withBorder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
        }
    }
}
