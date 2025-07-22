//
//  DateFormatter+Extension.swift
//  TravelTalk
//
//  Created by Lee on 7/23/25.
//

import Foundation

enum DateFormat: String {
    case totalDate = "YYYY.MM.dd HH:mm"
    case shortDate = "YY. MM. dd"
    case hypenYearMonthDate = "YYYY-MM-dd"
    case time = "HH:mm a"
}

extension DateFormatter {
    static let totalDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.totalDate.rawValue
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()

    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.shortDate.rawValue
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()

    static let hypenDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.hypenYearMonthDate.rawValue
        formatter.locale = Locale(identifier: "Ko_KR")
        return formatter
    }()

    static let onlyTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormat.time.rawValue
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter
    }()
}
