//
//  Search.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import Foundation

struct Movie: Decodable {
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
