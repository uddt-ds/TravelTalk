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
        setupLabel()
        setupStackView()
    }

    private func setupStackView() {
        myMessageStackView.axis = .horizontal
        myMessageStackView.distribution = .fillProportionally
        myMessageStackView.spacing = 8
        myMessageStackView.alignment = .bottom
    }

    private func setupLabel() {
        let testArray = ["테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트", "테스트\n테스트\n테스트\n테스트"]

        myMessageLabel.text = testArray[1]
        myMessageLabel.textColor = .black
        myMessageLabel.font = .boldSystemFont(ofSize: 12)
        myMessageLabel.numberOfLines = 0
        myMessageLabel.layer.borderWidth = 1
        myMessageLabel.layer.borderColor = UIColor.gray.cgColor
        myMessageLabel.layer.cornerRadius = 8
        myMessageLabel.clipsToBounds = true
        myMessageLabel.backgroundColor = .lightGray

        timeLabel.text = "88:88 오전"
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 8)
        timeLabel.textAlignment = .right
    }

}
