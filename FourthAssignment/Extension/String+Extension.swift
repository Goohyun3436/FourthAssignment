//
//  String+Extension.swift
//  FourthAssignment
//
//  Created by 구현 on 1/15/25.
//

import Foundation

extension String {
    func toPlainText() -> String {
        self.replacingOccurrences(of: #"<[^>]+>"#, with: "", options: .regularExpression)
    }
}
