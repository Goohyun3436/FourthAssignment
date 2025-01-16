//
//  ShopDetailCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import Kingfisher
import SnapKit

class ShopDetailCollectionViewCell: BaseCollectionViewCell, ViewConfiguration {
    
    //MARK: - Property
    static let identifier = "ShopDetailCollectionViewCell"
    
    //MARK: - UI Property
    let wrapView = UIStackView()
    let imageView = UIImageView()
    let mallNameLabel = UILabel()
    let titleLabel = UILabel()
    let lpriceLabel = UILabel()
    
    //MARK: - init Method
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    //MARK: - Configure Method
    func configureData(_ row: ShopItem) {
        let url = URL(string: row.image)
        imageView.kf.setImage(with: url)
        
        mallNameLabel.text = row.mallName
        
        titleLabel.text = row.titleToPainText
        
        lpriceLabel.text = Int(row.lprice)?.formatted()
    }
    
    internal func configureHierarchy() {
        contentView.addSubview(wrapView)
        wrapView.addArrangedSubview(imageView)
        wrapView.addArrangedSubview(mallNameLabel)
        wrapView.addArrangedSubview(titleLabel)
        wrapView.addArrangedSubview(lpriceLabel)
    }
    
    internal func configureLayout() {
        wrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(contentView)
        }
        wrapView.axis = .vertical
        wrapView.spacing = 4
        wrapView.alignment = .center
        wrapView.distribution = .fill
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(wrapView.snp.width).multipliedBy(1.0 / 1.0)
        }
        
        let inset = 8
        
        mallNameLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
        }
        
        lpriceLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(inset)
            make.height.equalTo(24)
        }
    }
    
    internal func configureView() {
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        
        mallNameLabel.textColor = UIColor.gray
        mallNameLabel.font = UIFont.systemFont(ofSize: 12)
        
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        titleLabel.textColor = UIColor.secondaryLabel
        
        lpriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    }
}
