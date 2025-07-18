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
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var messageStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setImageView()
        setupLabel()
        setupStackView()
    }

    private func setImageView() {
        chatImageView.layer.cornerRadius = 20
        chatImageView.clipsToBounds = true
    }

    private func setupStackView() {
        messageStackView.axis = .horizontal
        messageStackView.distribution = .fillProportionally
        messageStackView.spacing = 8
        messageStackView.alignment = .bottom
    }

    private func setupLabel() {
        nameLabel.text = "임시"
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 12)

        let testArray = ["테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트", "테스트\n테스트\n테스트\n테스트"]

        messageLabel.text = testArray[1]
        messageLabel.textColor = .black
        messageLabel.font = .boldSystemFont(ofSize: 12)
        messageLabel.numberOfLines = 0
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.borderColor = UIColor.lightGray.cgColor
        messageLabel.layer.cornerRadius = 8
        messageLabel.clipsToBounds = true

        timeLabel.text = "88:88 오전"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 8)
    }
}
