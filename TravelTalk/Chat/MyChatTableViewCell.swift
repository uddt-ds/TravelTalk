//
//  MyChatTableViewCell.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    @IBOutlet var myMessageLabel: BaseLabel!
    
    @IBOutlet var myMessageStackView: UIStackView!

    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupStackView()
        setupLabel()
    }

    private func setupStackView() {
        myMessageStackView.axis = .horizontal
        myMessageStackView.distribution = .fill
        myMessageStackView.spacing = 8
        myMessageStackView.alignment = .bottom
    }

    private func setupLabel() {
        myMessageLabel.setupLabel(title: "", font: .boldSystemFont(ofSize: 12), txtColor: .black, lines: 0)
        myMessageLabel.backgroundColor = .systemGray5
        myMessageLabel.layer.borderWidth = 1
        myMessageLabel.layer.borderColor = UIColor.gray.cgColor
        myMessageLabel.layer.cornerRadius = 8
        myMessageLabel.clipsToBounds = true

        timeLabel.setupLabel(title: "", font: .systemFont(ofSize: 8), txtColor: .gray)
        timeLabel.textAlignment = .right
    }

    func configureCell(data: Chat) {
        myMessageLabel.text = data.message
        timeLabel.text = data.shortDate
    }

}
