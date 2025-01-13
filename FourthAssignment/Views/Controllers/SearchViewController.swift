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
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewBackButton()
        configureCollectionView()
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
        collectionViewLayout()
    }
    
    func configureDesign() {
        view.backgroundColor = UIColor.black
        collectionView.backgroundColor = .none
        backgroundImageViewDesign()
        searchTextFieldDesign()
        searchButtonDesign()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
    }
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let inset: CGFloat = 16
        let spacing: CGFloat = 16
        let width: CGFloat = UIScreen.main.bounds.width - inset * 2
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = spacing
        
        return layout
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
            make.height.equalTo(50)
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
    
    func collectionViewLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchWrapView.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
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
        searchTextField.font = UIFont.systemFont(ofSize: 16)
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


//MARK: - UICollectionView
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        return cell
    }
}
