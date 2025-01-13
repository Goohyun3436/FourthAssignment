//
//  SearchCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    let indexLabel = UILabel()
    let contentLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configureDesign()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

//MARK: - Method
extension SearchCollectionViewCell {
    func configureData(_ row: Movie) {
        indexLabel.text = "\(row.id + 1)"
        contentLabel.text = row.name
        dateLabel.text = row.created_at
    }
    
    func configureLayout() {
        indexLabelLayout()
        contentLabelLayout()
        dateLabelLayout()
    }
    
    func configureDesign() {
        indexLabelDesign()
        contentLabelDesign()
        dateLabelDesign()
    }
}

//MARK: - Layout
extension SearchCollectionViewCell {
    func indexLabelLayout() {
        contentView.addSubview(indexLabel)
        
        indexLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(40)
        }
    }
    
    func contentLabelLayout() {
        contentView.addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { make in
            make.leading.equalTo(indexLabel.snp.trailing).offset(16)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func dateLabelLayout() {
        contentView.addSubview(dateLabel)
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide)
            make.leading.greaterThanOrEqualTo(contentLabel.snp.trailing).offset(32)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
}

//MARK: - Design
extension SearchCollectionViewCell {
    func indexLabelDesign() {
        indexLabel.textAlignment = .center
        indexLabel.backgroundColor = UIColor.white
        indexLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        indexLabel.textColor = UIColor.black
    }
    
    func contentLabelDesign() {
        contentLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        contentLabel.textColor = UIColor.white
    }
    
    func dateLabelDesign() {
        dateLabel.font = UIFont.systemFont(ofSize: 14)
        dateLabel.textColor = UIColor.systemGray
    }
}
