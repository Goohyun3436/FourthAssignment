//
//  ShopSearchViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import SnapKit

class ShopSearchViewController: UIViewController, ViewConfiguration {
    
    //MARK: - UI Property
    let searchBar = UISearchBar()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton(color: UIColor.label)
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        configureSearchBar()
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(searchBar)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "도봉러의 쇼핑쇼핑"
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
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
        
        print(#function)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
}
