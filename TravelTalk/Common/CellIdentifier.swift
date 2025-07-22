//
//  CellIdentifier.swift
//  TravelTalk
//
//  Created by Lee on 7/23/25.
//

import Foundation

enum CellIdentifier {
    static let homeCell = String(describing: HomeCollectionViewCell.self)
    static let chatTableViewCell = String(describing: ChatTableViewCell.self)
    static let myChatTableViewCell = String(describing: MyChatTableViewCell.self)
    static let separateChatTableViewCell = String(describing: SeparateChatTableViewCell.self)
    static let separateMyChatTableViewCell = String(describing: SeparateMyChatTableViewCell.self)
}
