//
//  Shop.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import Foundation

struct Shop: Decodable {
    let total: Int
    let items: [ShopItem]
}

struct ShopItem: Decodable {
    let image: String
    let mallName: String
    let title: String
    let lprice: String
}
