//
//  ShopDetailCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

class ShopDetailCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Property
    static let identifier = "ShopDetailCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
