//
//  BaseLabel.swift
//  TravelTalk
//
//  Created by Lee on 7/18/25.
//

import UIKit

class BaseLabel: UILabel {
    private var padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }
}
