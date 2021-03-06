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
import AlamofireImage

class AlbumsView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: LoadingView!
    
    let viewModel = AlbumsViewModel()

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }

    private func bindUI()
    {
        navigationItem.title = viewModel.title
        
        viewModel.albums
            .bindTo(tableView.rx.items(cellIdentifier: "AlbumCellId")) { index, model, cell in
                if let albumCell = cell as? AlbumTableViewCell {
                    let corner = albumCell.circularImageView.frame.width / 2
                    let filter = RoundedCornersFilter(radius: corner)
                    
                    let placeholderImage = filter.filter(UIImage(named: "default")!)
                    
                    albumCell.circularImageView
                        .af_setImage(withURL: URL(string: model.thumbnailUrl)!,
                                     placeholderImage: placeholderImage,
                                     filter: filter,
                                     imageTransition: .crossDissolve(0.2))
                    
                    albumCell.titleLabel?.text = model.title
                }
        }.addDisposableTo(bag)

        viewModel.loaded
            .asObservable()
            .subscribe(onNext: { [unowned self] state in
                self.loadingView.isHidden = state
                self.tableView.isHidden = !state
                })
            .addDisposableTo(bag)
        
        tableView.rx
            .modelSelected(Album.self)
            .subscribe(onNext: {album in
                if let detalhesVC = self.storyboard!
                    .instantiateViewController(withIdentifier: "DetalhesViewControllerId")
                    as? DetalhesView {
                    detalhesVC.viewModel = AlbumDetalhesViewModel(model: album)
                    self.navigationController?.pushViewController(detalhesVC, animated: true)
                }
            
            })
            .addDisposableTo(bag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

