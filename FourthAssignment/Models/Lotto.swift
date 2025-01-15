//
//  Lotto.swift
//  FourthAssignment
//
//  Created by 구현 on 1/14/25.
//

import Foundation

struct Lotto: Decodable {
    static let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo="  // 디코딩에 영향을 주지 않는 이유? -> 찾아보기 -> 인스턴스가 아니라서. 정도로 이해
    let returnValue: String  // succes or fail
    let drwNo: Int
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}
