//
//  ShopSearchViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import SnapKit

enum SearchStatus {
    case normal, short
    
    var text: String {
        switch self {
            case .normal:
                return "쇼핑하구팡"
            case .short:
                return "검색어를 2글자 이상 입력해주세요"
        }
    }
}

class ShopSearchViewController: UIViewController, ViewConfiguration {
    
    //MARK: - UI Property
    let searchBar = UISearchBar()
    let statusLabel = UILabel()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        configureSearchBar()
    }
    
    //MARK: - Method
    func presentDetailView() {
        let vc = ShopDetailViewController()
        vc.searchText = searchBar.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(statusLabel)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom).offset(100)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "도봉러의 쇼핑쇼핑"
        addBackButton(color: UIColor.label)
        configureBackButton(title: "")
        statusLabel.text = SearchStatus.normal.text
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.setValue("취소", forKey: "cancelButtonText")
        searchBar.searchBarStyle = .minimal
        searchBar.tintColor = UIColor.label
    }

}

//MARK: - UISearchTextField
extension ShopSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var text = searchBar.text else {
            return
        }
        
        text = text.trimmingCharacters(in: .whitespaces)
        
        guard !text.isEmpty else {
            statusLabel.text = SearchStatus.short.text
            return
        }
        
        guard text.count >= 2 else {
            statusLabel.text = SearchStatus.short.text
            return
        }
        
        presentDetailView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        statusLabel.text = SearchStatus.normal.text
    }
    
}
