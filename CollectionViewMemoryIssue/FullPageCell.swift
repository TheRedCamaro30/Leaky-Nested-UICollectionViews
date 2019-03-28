//
//  FullPageCell.swift
//  CollectionViewOfCollectionViewsMemory
//
//  Created by 123456 on 3/25/19.
//  Copyright © 2019 123456. All rights reserved.
//

import Foundation
import UIKit

class FullPageCell:UICollectionViewCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    static var reuseIdentifier: String = "FullPageCell"
    
    private var collectionView: UICollectionView!

    weak var cellTappedDelegate:CellTappedDelegate?
    var image:UIImage  = #imageLiteral(resourceName: "DJI_0014")
    
    override init(frame: CGRect) {
//        super.init(frame:frame)
        
//        let view = self.contentView
        print("made it to full page cell")
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
      
        
        collectionView = UICollectionView(frame:CGRect.zero, collectionViewLayout: layout)
        super.init(frame: frame)
        
        let view = self.contentView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
        collectionView.backgroundColor = UIColor.white
        
        self.collectionView.isPagingEnabled = true
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

//      self.setUpCollectionView()
    }
    
//    func setUpCollectionView(){
//        let view = self.contentView
//
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: (view.bounds.width - 2)/3, height: (view.bounds.width - 2)/3)
//
//        collectionView = UICollectionView(frame:view.bounds, collectionViewLayout: layout)
//
//
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(SmallCell.self, forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
//        collectionView.backgroundColor = UIColor.white
//
//        self.collectionView.isPagingEnabled = true
//
//        view.addSubview(collectionView)
//
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCell.reuseIdentifier, for: indexPath) as? SmallCell else{
            assertionFailure("Fatal Error FullPageCell not dequed")
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.yellow
        cell.imageView.image = self.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("delegate tapped")
        if indexPath.item == 0{
             cellTappedDelegate?.removeCell()
        }else{
            cellTappedDelegate?.addCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: (contentView.bounds.width - 2)/3, height: (contentView.bounds.width - 2)/3)
    }
    
}
