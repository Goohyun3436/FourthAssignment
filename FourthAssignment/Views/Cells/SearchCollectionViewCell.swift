//
//  SearchCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    let indexLabel = UILabel()
    let contentLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.systemRed
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
