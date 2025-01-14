//
//  Search.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import Foundation

struct Movie: Decodable {
    static let url = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=ee7a3b7ba216421e17c7cac7539866e9"
    let boxOfficeResult: BoxOffice
}

struct BoxOffice: Decodable {
    let dailyBoxOfficeList: [DailyBoxOffice]
}

struct DailyBoxOffice: Decodable {
    let rank: String
    let movieNm: String
    let openDt: String
}
