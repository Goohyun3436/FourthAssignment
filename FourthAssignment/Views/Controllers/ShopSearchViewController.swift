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
    let searchTextField = UISearchTextField()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackButton(color: UIColor.label)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(searchTextField)
    }
    
    func configureLayout() {
        searchTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(34)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.title = "도봉러의 쇼핑쇼핑"
        searchTextField.placeholder = "브랜드, 상품, 프로필, 태그 등"
    }

}
