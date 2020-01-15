//
//  UICollectionView.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerNibFrom(cellClass: UICollectionViewCell.Type) {
        let cellInfo = cellClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forCellWithReuseIdentifier: cellInfo)
    }
    
    func registerNibFrom(headerClass: UICollectionReusableView.Type) {

        let cellInfo = headerClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellInfo)
    }

    func registerNibFrom(footerClass: UICollectionReusableView.Type) {
        
        let cellInfo = footerClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: cellInfo)
    }
}
