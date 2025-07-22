//
//  ChatRoom.swift
//  SeSAC7Step1Remind
//
//  Created by Jack on 7/18/25.
//

import Foundation

//트래블톡 화면에서 사용할 데이터 구조체
struct ChatRoom {
    let chatroomId: Int //채팅방 고유 ID
    let chatroomImage: String //채팅방 이미지
    let chatroomName: String //채팅방 이름
    var chatList: [Chat] = [] //채팅 화면에서 사용할 데이터

    var lastMessage: String {
        return chatList.last?.message ?? ""
    }

    // DateFormatter의 format이 다르면 2개를 써야하는건지?
    var shortDate: String {
        let dateFormatter = DateManager.shared.formatter
        dateFormatter.dateFormat = "YYYY. MM. dd HH:mm"
        let convertData = dateFormatter.date(from: chatList.last?.date ?? "")

        let dateFormatter2 = DateManager.shared.formatter2
        dateFormatter2.dateFormat = "YY. MM. dd"
        dateFormatter2.locale = Locale(identifier: "ko_KR")
        let convertStr = dateFormatter2.string(from: convertData ?? Date())
        return convertStr
    }

    var clearRoomName: String {
        if chatroomName.last == "방" {
            return String(chatroomName.dropLast())
        } else {
            return chatroomName
        }
    }
}
