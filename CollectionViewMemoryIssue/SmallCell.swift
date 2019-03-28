//
//  SmallCell.swift
//  CollectionViewOfCollectionViewsMemory
//
//  Created by 123456 on 3/25/19.
//  Copyright © 2019 123456. All rights reserved.
//

import Foundation
import UIKit

class SmallCell:UICollectionViewCell{
    
    static var reuseIdentifier: String = "FullPageCell"
    
    var imageView:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        imageView.contentMode = .scaleAspectFill
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
