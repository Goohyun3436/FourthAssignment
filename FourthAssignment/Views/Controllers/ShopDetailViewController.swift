//
//  ShopDetailViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import UIKit
import Alamofire
import SnapKit

class ShopDetailViewController: UIViewController {
    
    //MARK: - Property
    var query: String? {
        didSet {
            if let query {
                callRequest(query)
                navigationItem.title = query
            }
        }
    }
    var sort = Sort.sim {
        didSet {
            guard sort != oldValue else {
                return
            }
            
            if let query {
                start = 1
                callRequest(query)
                mainView.sortButtonStackView.changeButtonColors(selected: sort)
            }
        }
    }
    var start: Int = 1 {
        didSet {
            if let query {
                callRequest(query)
            }
        }
    }
    var total: Int = 0 {
        didSet {
            mainView.totalLabel.text = "\(total.formatted()) 개의 검색 결과"
        }
    }
    var list = [ShopItem]() {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    //MARK: - UI Property
    let mainView = ShopDetailView()
    
    //MARK: - Override Method
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSortButtons()
        configureCollectionView()
    }
    
    //MARK: - Method
    func callRequest(_ query: String) {
        let url = APIUrl.naverShop + "?query=\(query)&display=30&start=\(start)&sort=\(sort.rawValue)"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.naverClientId,
            "X-Naver-Client-Secret": APIKey.naverClientSecret
        ]
        
        AF.request(url, method: .get, headers: header)
            .responseDecodable(of: Shop.self) { response in
                
                switch response.result {
                case .success(let data):
                    if self.start == 1 {
                        self.total = data.total
                        self.list = data.items
                        self.mainView.collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                    } else {
                        self.list.append(contentsOf: data.items)
                    }
                        
                case .failure(_):
                    self.total = 0
                    self.list = []
                        
                }
            }
    }
    
    @objc func sortButtonTapped(_ sender: UIButton) {
        let button = sender as! SortButton
        sort = button.sort
    }
    
    //MARK: - Configure Method
    func configureSortButtons() {
        for item in mainView.sortButtonStackView.buttons {
            item.addTarget(self, action: #selector(sortButtonTapped(_:)), for: .touchUpInside)
        }
    }
    
    func configureCollectionView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.prefetchDataSource = self
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

extension ShopDetailViewController: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        for item in indexPaths {
            if list.count - 2 == item.row {
                start += 1
            }
        }
    }
    
}
