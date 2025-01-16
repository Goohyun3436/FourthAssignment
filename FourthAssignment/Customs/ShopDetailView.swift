//
//  ShopDetailView.swift
//  FourthAssignment
//
//  Created by 구현 on 1/16/25.
//

import UIKit
import SnapKit

class ShopDetailView: BaseView {
    
    //MARK: - UI Property
    let totalLabel = UILabel()
    let sortButtonStackView = ShopSortButtonStackView()
    let collectionView = ShopItemCollectionView()
    
    override func configureHierarchy() {
        addSubview(totalLabel)
        addSubview(sortButtonStackView)
        addSubview(collectionView)
    }
    
    override func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        sortButtonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(totalLabel.snp.bottom).offset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(sortButtonStackView.snp.bottom).offset(8)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        backgroundColor = UIColor.systemBackground
        
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
        
        collectionView.register(ShopDetailCollectionViewCell.self, forCellWithReuseIdentifier: ShopDetailCollectionViewCell.identifier)
    }
    
}
