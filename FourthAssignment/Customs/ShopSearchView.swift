//
//  ShopSearchView.swift
//  FourthAssignment
//
//  Created by 구현 on 1/16/25.
//

import UIKit
import SnapKit

class ShopSearchView: BaseUIView {
    
    //MARK: - UI Property
    let searchBar = UISearchBar()
    let statusLabel = UILabel()
    
    //MARK: - Configure Method
    override func configureHierarchy() {
        addSubview(searchBar)
        addSubview(statusLabel)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom).offset(100)
        }
    }
    
    override func configureView() {
        backgroundColor = UIColor.systemBackground
        statusLabel.text = SearchStatus.normal.text
        
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = UIColor.label
    }
    
}
