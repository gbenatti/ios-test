//
//  ViewController.swift
//  Elo7Test
//
//  Created by Georges B Junior on 10/8/16.
//  Copyright © 2016 Georges B Junior. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class AlbumsView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let bag = DisposeBag()
    let viewModel = AlbumsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }

    private func bindUI()
    {
        navigationItem.title = viewModel.title

        viewModel.albums.bindTo(tableView.rx.items(cellIdentifier: "AlbumCellId")) { index, model, cell in
            cell.textLabel?.text = model.title
        }.addDisposableTo(bag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

