//
//  MainViewController.swift
//  CollectionViewOfCollectionViewsMemory
//
//  Created by 123456 on 3/25/19.
//  Copyright © 2019 123456. All rights reserved.
//

import Foundation
import UIKit

class MainViewController:UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{
    
    var collectionView:UICollectionView!
    
    var arr = [1,2,3,4]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.bounds.width - 2, height: self.view.bounds.height)
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(FullPageCell.self, forCellWithReuseIdentifier: FullPageCell.reuseIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        
        self.collectionView.isPagingEnabled = true
        
        self.view.addSubview(collectionView)
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullPageCell.reuseIdentifier, for: indexPath) as? FullPageCell else{
            assertionFailure("Fatal Error FullPageCell not dequed")
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.green
        cell.cellTappedDelegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? FullPageCell{
//                    let contentView = cell.contentView
//                    let layout = UICollectionViewFlowLayout()
//                    layout.minimumLineSpacing = 1
//                    layout.minimumInteritemSpacing = 1
//                    layout.scrollDirection = .vertical
//                    layout.itemSize = CGSize(width: (contentView.bounds.width - 2)/3, height: (contentView.bounds.width - 2)/3)
//            
//                    let cellCollectionView = UICollectionView(frame:contentView.bounds, collectionViewLayout: layout)
//                    cellCollectionView.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
//                    cellCollectionView.dataSource = cell
//                    cellCollectionView.delegate = cell
//                    cell.collectionView = cellCollectionView
//                    contentView.addSubview(cellCollectionView)
//            cell.setUpCollectionView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? FullPageCell{
//            cell.collectionView?.removeFromSuperview()
//            cell.collectionView?.dataSource = nil
//            cell.collectionView?.delegate = nil
//            cell.collectionView = nil
        }
    }
}
