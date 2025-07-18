//
//  ChatTableViewCell.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet var chatImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageBgView: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setImageView()
        setupLabel()
    }

    private func setImageView() {
        chatImageView.layer.cornerRadius = 20
        chatImageView.clipsToBounds = true
    }

    private func setupLabel() {
        nameLabel.text = "임시"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 12)

        let testArray = ["테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트", "테스트\n테스트\n테스트\n테스트"]

        messageLabel.text = testArray[0]
        messageLabel.textColor = .black
        messageLabel.font = .boldSystemFont(ofSize: 12)
        messageLabel.numberOfLines = 0

        messageBgView.layer.borderColor = UIColor.gray.cgColor
        messageBgView.layer.cornerRadius = 8
        messageBgView.layer.borderWidth = 1

        timeLabel.text = "88:88 오전"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 8)
    }
}
