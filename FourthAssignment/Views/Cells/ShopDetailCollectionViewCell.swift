//
//  ShopDetailCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit

class ShopDetailCollectionViewCell: UICollectionViewCell, ViewConfiguration {
    
    //MARK: - Property
    static let identifier = "ShopDetailCollectionViewCell"
    
    //MARK: - init Method
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure Method
    func configureData(_ row: ShopItem) {
        print(row)
    }
    
    internal func configureHierarchy() {
        
    }
    
    internal func configureLayout() {
        
    }
    
    internal func configureView() {
        
    }
}
