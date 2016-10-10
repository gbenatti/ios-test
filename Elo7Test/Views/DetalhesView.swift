//
//  DetalhesView.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/9/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

import AlamofireImage

class DetalhesView : UIViewController
{
    var viewModel: AlbumDetalhesViewModel?
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        bindUI()
    }
    
    private func bindUI() {
        viewModel?.title
            .asObservable()
            .map { $0 }
            .bindTo(titleLabel.rx.text)
            .addDisposableTo(bag)
        
        viewModel?.url.asObservable()
            .subscribe(onNext: { [unowned self] url in
                self.topImageView.af_setImage(withURL: URL(string: url)!)
            })
            .addDisposableTo(bag)
    }
}
