//
//  ShopItemCollectionView.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

class ShopItemCollectionView: BaseCollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            
            let inset: CGFloat = 16
            let spacing: CGFloat = 16
            let cellPerRow: CGFloat = 2
            let width: CGFloat = (UIScreen.main.bounds.width - inset * 2 - spacing * (cellPerRow - 1)) / cellPerRow
            let height: CGFloat = width * 1.6
            
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: width, height: height)
            layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            
            return layout
        }())
    }
    
}
