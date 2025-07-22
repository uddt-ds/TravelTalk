//
//  Chat.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/18/25.
//

import Foundation
//채팅 화면에서 사용할 데이터 구조체
struct Chat {
    let user: User
    let date: String
    let message: String

    var shortDate: String {
        guard let rawDate = DateFormatter.totalDate.date(from: date) else {
            return ""
        }
        return DateFormatter.onlyTime.string(from: rawDate)
    }

    var compareDate: String {
        return String(date.prefix(10))
    }

    func isDateChanged(previousChat: Chat?) -> Bool {
        guard let previousChat else { return true }
        return self.compareDate != previousChat.compareDate
    }
}
