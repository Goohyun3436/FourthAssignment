//
//  ShopAlert.swift
//  FourthAssignment
//
//  Created by 구현 on 1/17/25.
//

import UIKit

enum SearchError {
    case emptyQuery, shortQuery
    
    var title: String {
        switch self {
        case .emptyQuery:
            return "검색 실패"
        case .shortQuery:
            return "검색 실패"
        }
    }
    
    var message: String {
        switch self {
        case .emptyQuery:
            return "검색어를 입력해주세요"
        case .shortQuery:
            return "검색어를 2글자 이상 입력해주세요"
        }
    }
}

extension UIViewController {
    func SearchAlert(_ err: SearchError) {
        let alert = UIAlertController(title: err.title, message: err.message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
