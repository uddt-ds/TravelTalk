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

    var shortDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY. MM. dd HH:mm"
        let convertData = dateFormatter.date(from: chatList.last?.date ?? "")

        dateFormatter.dateFormat = "YY. MM. dd"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        let convertStr = dateFormatter.string(from: convertData ?? Date())
        return convertStr
    }

    var clearRoomName: String {
//        return chatroomName.last == "방" ? String(chatroomName.dropLast()) : chatroomName
        if chatroomName.last == "방" {
            return String(chatroomName.dropLast())
        } else {
            return chatroomName
        }
    }
}
