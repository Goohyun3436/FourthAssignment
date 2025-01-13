//
//  SearchViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    //MARK: - Property
    let backgroundImageView = UIImageView()
    let searchWrapView = UIStackView()
    let searchTextField = UITextField()
    let searchButton = UIButton()

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewBackButton()
        configureLayout()
        configureDesign()
    }
    
    override func viewDidLayoutSubviews() {
        searchTextField.configureBorderBottom(width: 3, color: UIColor.white)
    }
}

//MARK: - Method
extension SearchViewController {
    func configureLayout() {
        backgroundImageViewLayout()
        searchWrapViewLayout()
        searchTextFieldLayout()
        searchButtonLayout()
    }
    
    func configureDesign() {
        view.backgroundColor = UIColor.black
        backgroundImageViewDesign()
        searchTextFieldDesign()
        searchButtonDesign()
    }
}

//MARK: - Layout
extension SearchViewController {
    func backgroundImageViewLayout() {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    
    func searchWrapViewLayout() {
        view.addSubview(searchWrapView)
        
        searchWrapView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
        }
        
        searchWrapView.axis = .horizontal
        searchWrapView.spacing = 16
    }
    
    func searchTextFieldLayout() {
        searchWrapView.addArrangedSubview(searchTextField)
        
        searchTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
        }
    }
    
    func searchButtonLayout() {
        searchWrapView.addArrangedSubview(searchButton)
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
    }
}

//MARK: - Design
extension SearchViewController {
    func backgroundImageViewDesign() {
        backgroundImageView.image = UIImage(named: "searchBackground")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 0.3
    }
    
    func searchTextFieldDesign() {
        searchTextField.placeholder = "작품을 검색하세요"
        searchTextField.font = UIFont.systemFont(ofSize: 14)
        searchTextField.textColor = UIColor.white
        searchTextField.configurePlaceholderColor(UIColor.lightGray)
    }
    
    func searchButtonDesign() {
        searchButton.setTitle("검색", for: .normal)
        searchButton.backgroundColor = UIColor.white
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        searchButton.setTitleColor(UIColor.black, for: .normal)
    }
}
