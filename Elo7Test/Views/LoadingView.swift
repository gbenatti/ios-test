//
//  LoadingView.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoadingView : UIView
{
    var indicator: UIActivityIndicatorView!
    var label: UILabel!

    let distance = 8
    let halfDistance = 4

    required init?(coder aDecoder: NSCoder) {
        indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.startAnimating()
        
        label = UILabel()
        label.text = "Carregando..."

        super.init(coder: aDecoder)

        addSubview(indicator)
        addSubview(label)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        indicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-halfDistance)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(indicator.snp.bottom).offset(distance)
        }
    }
}
