//
//  DateFormatterUtil.swift
//  ZaraRickYMorty
//
//  Created by Alex Ciprián López on 30/8/23.
//

import Foundation

struct DateFormatterUtil {
    static func format(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: date)
    }
}
