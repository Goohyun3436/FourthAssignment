//
//  ShopDetailViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import SnapKit

class ShopDetailViewController: UIViewController, ViewConfiguration {
    
    //MARK: - Property
    var searchText: String?
    
    //MARK: - UI Property
    let totalLabel = UILabel()

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = searchText
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(totalLabel)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        
        totalLabel.text = "13,234,448 개의 검색 결과"
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
    }

}
