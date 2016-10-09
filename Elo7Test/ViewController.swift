//
//  ViewController.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/8/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AlbumRepository
            .loadAllAsync()
            .subscribe(onNext: { print($0) } )
            .addDisposableTo(bag)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

