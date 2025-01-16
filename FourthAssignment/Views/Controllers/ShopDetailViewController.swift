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
    var query: String? {
        didSet {
            if let query {
                callShopRequest(query)
                navigationItem.title = query
            }
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
    var sort = Sort.sim {
        didSet {
            if let query {
                callShopRequest(query)
                sortButtonStackView.changeButtonColors(selected: sort)
                collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
            }
        }
    }
    
    //MARK: - UI Property
    let totalLabel = UILabel()
    let sortButtonStackView = ShopSortButtonStackView()
    let collectionView = ShopItemCollectionView()
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureView()
        configureSortButtons()
        configureCollectionView()
    }
    
    //MARK: - Method
    func callShopRequest(_ query: String) {
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
        
        guard sort != button.sort else {
            return
        }
        
        sort = button.sort
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
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
    }
    
    func configureSortButtons() {
        for item in sortButtonStackView.buttons {
            item.addTarget(self, action: #selector(sortButtonTapped(_:)), for: .touchUpInside)
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
