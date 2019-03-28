//
//  CellTappedDelegate.swift
//  CollectionViewOfCollectionViewsMemory
//
//  Created by 123456 on 3/25/19.
//  Copyright © 2019 123456. All rights reserved.
//

import Foundation
import UIKit

protocol  CellTappedDelegate:class {
    func addCell()
    func removeCell()
}

extension MainViewController:CellTappedDelegate{
    func addCell() {
        print("cell tapped called")
        self.collectionView.performBatchUpdates({
//            self.collectionView.deleteItems(at: [IndexPath(item: self.arr.count - 2, section: 0), IndexPath(item: arr.count - 1, section: 0)])
            arr.append(arr[arr.count - 1] + 1)
            self.collectionView.insertItems(at: [IndexPath(item: arr.count - 1, section: 0)])
//            self.collectionView.insertItems(at: [IndexPath(item: arr.count -  3, section: 0),IndexPath(item: arr.count -  2, section: 0),IndexPath(item: arr.count - 1, section: 0)])
        }) { (completed) in
            print("Perform batch updates completed")
            if completed == false{
                self.collectionView.reloadData()
            }
            print("remove cell called:\(self.arr.count)")
        }
    }
        
    func removeCell() {
        self.collectionView.performBatchUpdates({
            arr.popLast()
            self.collectionView.deleteItems(at: [IndexPath(item: arr.count - 1, section: 0)])
        }) { (completed) in
            print("Perform batch updates completed")
            if completed == false{
                self.collectionView.reloadData()
            }
            print("remove cell called:\(self.arr.count)")
        }
    }
}
