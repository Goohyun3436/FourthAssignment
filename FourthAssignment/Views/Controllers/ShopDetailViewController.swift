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
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
    
    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = searchText
        
        if let searchText {
            callRequest(query: searchText)
        }
        
        configureHierarchy()
        configureLayout()
        configureView()
        configureCollectionView()
    }
    
    //MARK: - Method
    func callRequest(query: String) {
        let url = APIUrl.naverShop + "?query=\(query)&display=100"
        
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
                        
                case .failure(let err):
                    self.total = 0
                    self.list = []
                    print(err)
                        
                }
            }
    }
    
    //MARK: - Configure Method
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(totalLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    func configureView() {
        view.backgroundColor = UIColor.systemBackground
        
        totalLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        totalLabel.textColor = UIColor.systemGreen
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(ShopDetailCollectionViewCell.self, forCellWithReuseIdentifier: ShopDetailCollectionViewCell.identifier)
    }
    
    func makeCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let inset: CGFloat = 16
        let spacing: CGFloat = 16
        let cellPerRow: CGFloat = 2
        let width: CGFloat = (UIScreen.main.bounds.width - inset * 2 - spacing * (cellPerRow - 1)) / cellPerRow
        let height: CGFloat = width * 1.6
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width, height: height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        return layout
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
