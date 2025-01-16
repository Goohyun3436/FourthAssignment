//
//  ShopDetailViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import Alamofire
import SnapKit

class ShopDetailViewController: UIViewController, ViewConfiguration {
    
    //MARK: - Property
    var searchText: String? {
        didSet {
            navigationItem.title = searchText
        }
    }
    var total: Int = 0 {
        didSet {
            totalLabel.text = "\(total.formatted()) 개의 검색 결과"
        }
    }
    var list = [ShopItem]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: - UI Property
    let totalLabel = UILabel()
    let sortButtonStackView = ShopSortButtonStackView()
    let collectionView = ShopItemCollectionView()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = searchText
        
        if let searchText {
            callShopRequest(query: searchText, sort: Sort.sim)
        }
        
        configureHierarchy()
        configureLayout()
        configureView()
        configureSortButtons()
        configureCollectionView()
    }
    
    //MARK: - Method
    func callShopRequest(query: String, sort: Sort) {
        let url = APIUrl.naverShop + "?query=\(query)&display=100&sort=\(sort.rawValue)"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.naverClientId,
            "X-Naver-Client-Secret": APIKey.naverClientSecret
        ]
        
        AF.request(url, method: .get, headers: header)
            .responseDecodable(of: Shop.self) { response in
                
                switch response.result {
                case .success(let data):
                    self.total = data.total
                    self.list = data.items
                        
                case .failure(_):
                    self.total = 0
                    self.list = []
                        
                }
            }
    }
    
    @objc func sortButtonTapped(_ sender: UIButton) {
        let button = sender as! SortButton
        
        guard let sortType = button.sort else {
            return
        }
        
        guard let searchText else {
            return
        }
        
        callShopRequest(query: searchText, sort: sortType)
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(sortButtonStackView)
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        sortButtonStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(totalLabel.snp.bottom).offset(8)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(sortButtonStackView.snp.bottom).offset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
    }
    
    func configureSortButtons() {
        for item in sortButtonStackView.buttons {
            item.addTarget(self, action: #selector(sortButtonTapped), for: .touchUpInside)
        }
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ShopDetailCollectionViewCell.self, forCellWithReuseIdentifier: ShopDetailCollectionViewCell.identifier)
    }

}

//MARK: - UICollectionView
extension ShopDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopDetailCollectionViewCell.identifier, for: indexPath) as! ShopDetailCollectionViewCell
        
        let row = list[indexPath.item]
        
        cell.configureData(row)
        
        return cell
    }
    
}
