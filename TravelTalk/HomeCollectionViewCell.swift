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
        configureCell()
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

    func configureCell() {
        homeImageView.image = UIImage(systemName: "star")
        nameLabel.text = "임시"
        lastChatLabel.text = "임시2"
        dateLabel.text = "20.00.00"
    }

}
