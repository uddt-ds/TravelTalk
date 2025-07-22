//
//  UILabel+Extension.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

extension UILabel {
    func setupLabel(title: String, font: UIFont, txtColor: UIColor, lines: Int = 1) {
        text = title
        self.font = font
        textColor = txtColor
        numberOfLines = lines
    }
}
