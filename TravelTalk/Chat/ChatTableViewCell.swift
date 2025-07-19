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
        messageStackView.distribution = .fill
        messageStackView.spacing = 8
        messageStackView.alignment = .bottom
    }

    private func setupLabel() {
        nameLabel.setupLabel(title: "", font: .boldSystemFont(ofSize: 12), txtColor: .black)

        messageLabel.setupLabel(title: "", font: .boldSystemFont(ofSize: 12), txtColor: .black)
        messageLabel.numberOfLines = 0
        messageLabel.layer.borderWidth = 1
        messageLabel.layer.borderColor = UIColor.lightGray.cgColor
        messageLabel.layer.cornerRadius = 8
        messageLabel.clipsToBounds = true

        timeLabel.setupLabel(title: "", font: .systemFont(ofSize: 8), txtColor: .gray)
    }

    func configureCell(data: Chat) {
        chatImageView.image = UIImage(named: data.user.image)
        nameLabel.text = data.user.name
        messageLabel.text = data.message
        timeLabel.text = data.shortDate
    }

}
