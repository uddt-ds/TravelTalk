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
        let dateFormatter = DateManager.shared.formatter
        dateFormatter.dateFormat = "YYYY. MM. dd HH:mm"
        let convertData = dateFormatter.date(from: date)

        let dateFormatter2 = DateManager.shared.formatter2
        dateFormatter2.dateFormat = "HH:mm a"
        dateFormatter2.locale = Locale(identifier: "ko_KR")
        dump("chat, \(dateFormatter)")
        dump("chat, \(dateFormatter2)")
        let convertStr = dateFormatter2.string(from: convertData ?? Date())
        return convertStr
    }
}
