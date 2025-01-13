//
//  Search.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import Foundation

struct Movie {
    let id: Int
    let name: String
    let created_at: String
    
    init(id: Int, name: String, created_at: String) {
        self.id = id
        self.name = name
        self.created_at = created_at
    }
}

class MovieInfo {
    let movie: [Movie] = [
        Movie(id: 0, name: "엽문4:더 파이널", created_at: "2020-04-01"),
        Movie(id: 1, name: "주디", created_at: "2020-03-25"),
        Movie(id: 2, name: "1917", created_at: "2020-02-26"),
        Movie(id: 3, name: "인디저블맨", created_at: "2020-02-26"),
        Movie(id: 4, name: "n번째 이별 중", created_at: "2020-04-01"),
        Movie(id: 5, name: "스케어리 스토리:어둠의 속속속속", created_at: "2020-03-25"),
        Movie(id: 6, name: "날씨의 아이", created_at: "2019-10-030"),
        Movie(id: 7, name: "라라랜드", created_at: "2016-12-07"),
        Movie(id: 8, name: "너의 이름은.", created_at: "2017-01-04"),
        Movie(id: 9, name: "다크 워터스", created_at: "2020-03-11")
    ]
}
