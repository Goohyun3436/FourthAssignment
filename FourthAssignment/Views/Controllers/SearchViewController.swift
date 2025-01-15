//
//  SearchViewController.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import Alamofire
import SnapKit

class SearchViewController: UIViewController {
    //MARK: - Property
    let backgroundImageView = UIImageView()
    let searchWrapView = UIStackView()
    let searchTextField = UITextField()
    let searchButton = UIButton()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    var movie = [DailyBoxOffice]() {
        didSet {
            collectionView.reloadData()
        }
    }

    //MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviewBackButton()
        configureCollectionView()
        configureSearchTextField()
        configureSearchButton()
        configureLayout()
        configureDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let yesterDay = getYesterday()
        getDailyBoxOffice(yesterDay)
        searchTextField.text = yesterDay
    }
    
    override func viewDidLayoutSubviews() {
        searchTextField.configureBorderBottom(width: 3, color: UIColor.white)
    }
}

//MARK: - Method
extension SearchViewController {
    func getDailyBoxOffice(_ targetDt: String) {
        let url = APIUrl.kofic + "?key=\(APIKey.kofic)&targetDt=\(targetDt)&itemPerPage=10"
        
        AF.request(url, method: .get).responseDecodable(of: Movie.self) { response in
            switch response.result {
            case .success(let res):
                self.movie = res.boxOfficeResult.dailyBoxOfficeList
            case .failure(_):
                self.movie = []
            }
        }
    }
    
    @objc func searchButtonTapped() {
        guard let targetDt = searchTextField.text else {
            movie = []
            return
        }
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        
        guard format.date(from: targetDt) != nil else {
            movie = []
            return
        }
        
        getDailyBoxOffice(targetDt)
        
        view.endEditing(true)
    }
    
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
        
        collectionView.keyboardDismissMode = .onDrag
        collectionView.alwaysBounceVertical = true
    }
    
    func configureSearchTextField() {
        searchTextField.delegate = self
    }
    
    func configureSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
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
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as! SearchCollectionViewCell
        
        let row = movie[indexPath.item]
        cell.configureData(row)
        
        return cell
    }
}

//MARK: - UITextField
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchButtonTapped()
        return true
    }
}

