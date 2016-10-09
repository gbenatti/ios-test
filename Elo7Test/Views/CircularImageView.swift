//
//  CircularImageView.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import UIKit

class CircularImageView : UIImageView
{
    var withBorder: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        let radius = frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        
        if withBorder {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.black.cgColor
        }
        
        super.layoutSubviews()
    }
}
