//
//  NetworkManager.swift
//  FourthAssignment
//
//  Created by 구현 on 1/16/25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func naverSearchShop(query: String, display: Int, start: Int, sort: String) {
        let url = APIUrl.naverShop + "?query=\(query)&display=\(display)&start=\(start)&sort=\(sort)"
        
        let header: HTTPHeaders = [
            "X-Naver-Client-Id": APIKey.naverClientId,
            "X-Naver-Client-Secret": APIKey.naverClientSecret
        ]
        
        AF.request(url, method: .get, headers: header)
            .responseDecodable(of: Shop.self) { response in
                
                switch response.result {
                case .success(let data):
                    dump(data)
                        
                case .failure(_):
                    print("err")
                        
                }
            }
        
        
    }
    
}
