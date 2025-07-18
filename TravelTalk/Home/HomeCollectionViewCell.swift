//
//  HomeCollectionViewCell.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var homeImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }

    private func setupLabel() {
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 12)
        lastChatLabel.textColor = .gray
        lastChatLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 10)
    }

    func configureCell(_ data: ChatRoom) {
        homeImageView.image = UIImage(named: data.chatroomImage)
        nameLabel.text = data.clearRoomName
        lastChatLabel.text = data.chatList.last?.message
        dateLabel.text = data.shortDate
    }
}
