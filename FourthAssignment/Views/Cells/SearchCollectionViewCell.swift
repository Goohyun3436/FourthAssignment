//
//  SearchCollectionViewCell.swift
//  FourthAssignment
//
//  Created by 구현 on 1/13/25.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchCollectionViewCell"
    let rankLabel = UILabel()
    let movieNmLabel = UILabel()
    let openDtLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureLayout()
        configureDesign()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}

//MARK: - Method
extension SearchCollectionViewCell {
    func configureData(_ row: DailyBoxOffice) {
        rankLabel.text = row.rank
        movieNmLabel.text = row.movieNm
        openDtLabel.text = row.openDt
    }
    
    func configureLayout() {
        rankLabelLayout()
        movieNmLabelLayout()
        openDtLabelLayout()
    }
    
    func configureDesign() {
        rankLabelDesign()
        movieNmLabelDesign()
        openDtLabelDesign()
    }
}

//MARK: - Layout
extension SearchCollectionViewCell {
    func rankLabelLayout() {
        contentView.addSubview(rankLabel)
        
        rankLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView.safeAreaLayoutGuide)
            make.verticalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalTo(40)
        }
    }
    
    func movieNmLabelLayout() {
        contentView.addSubview(movieNmLabel)
        
        movieNmLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(16)
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func openDtLabelLayout() {
        contentView.addSubview(openDtLabel)
        
        openDtLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).priority(.required)
            
            // 컬렉션 뷰가 리로드 되면서 아래 제약 조건이 풀리는? 이슈 있음 -> 찾아보기
            make.leading.greaterThanOrEqualTo(movieNmLabel.snp.trailing).offset(32)
            
            make.centerY.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
}

//MARK: - Design
extension SearchCollectionViewCell {
    func rankLabelDesign() {
        rankLabel.textAlignment = .center
        rankLabel.backgroundColor = UIColor.white
        rankLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        rankLabel.textColor = UIColor.black
    }
    
    func movieNmLabelDesign() {
        movieNmLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        movieNmLabel.textColor = UIColor.white
    }
    
    func openDtLabelDesign() {
        openDtLabel.font = UIFont.systemFont(ofSize: 14)
        openDtLabel.textColor = UIColor.systemGray
    }
}
