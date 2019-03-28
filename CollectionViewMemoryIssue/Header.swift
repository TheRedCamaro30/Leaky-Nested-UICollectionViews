//
//  Header.swift
//  CollectionViewOfCollectionViewsMemory
//
//  Created by 123456 on 3/25/19.
//  Copyright © 2019 123456. All rights reserved.
//

import Foundation
import UIKit

class Header:UICollectionReusableView{
    var label:UILabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
