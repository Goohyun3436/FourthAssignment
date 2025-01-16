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

class ShopSearchViewController: UIViewController {
    
    //MARK: - UI Property
    let mainView = ShopSearchView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.searchBar.delegate = self
        
        navigationItem.title = "도봉러의 쇼핑쇼핑"
        addBackButton(color: UIColor.label)
        configureBackButton(title: "")
    }
    
    //MARK: - Method
    func presentDetailView() {
        let vc = ShopDetailViewController()
        vc.query = mainView.searchBar.text
        navigationController?.pushViewController(vc, animated: true)
    }

}

//MARK: - UISearchTextField
extension ShopSearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        mainView.statusLabel.text = SearchStatus.normal.text
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard var text = searchBar.text else {
            return
        }
        
        text = text.trimmingCharacters(in: .whitespaces)
        
        guard !text.isEmpty else {
            mainView.statusLabel.text = SearchStatus.short.text
            return
        }
        
        guard text.count >= 2 else {
            mainView.statusLabel.text = SearchStatus.short.text
            return
        }
        
        presentDetailView()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        view.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
}
