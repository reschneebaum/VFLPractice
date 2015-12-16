//
//  SelectorCell.swift
//  VFLPractice
//
//  Created by Rachel Schneebaum on 12/16/15.
//  Copyright © 2015 Rachel Schneebaum. All rights reserved.
//

import UIKit

protocol SelectorCellDelegate {
    func cellTapped(cell: SelectorCell)
}

class SelectorCell: UIView {

    var delegate: SelectorCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }


    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }

    func setupCell() {

        var vflIndex = [String: UIView]()

        translatesAutoresizingMaskIntoConstraints = false
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTap:"))

        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.textColor = UIColor.whiteColor()
        header.font = UIFont(name: "GillSans", size: 16.0)
        header.textAlignment = NSTextAlignment.Center
//        header.backgroundColor = UIColor.grayColor()
        header.text = "\(arc4random_uniform(1000) + arc4random_uniform(100))"
        vflIndex["header"] = header
        addSubview(header)

        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = UIColor.whiteColor()
        subtitle.font = UIFont(name: "GillSans", size: 12.0)
        subtitle.textAlignment = NSTextAlignment.Center
        subtitle.text = "subtitle(s)"
        vflIndex["subtitle"] = subtitle
        addSubview(subtitle)

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[header]-0-|", options: [], metrics: nil, views: vflIndex))

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subtitle]-0-|", options: [], metrics: nil, views: vflIndex))

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-4-[header]-4-[subtitle]-4-|", options: [], metrics: nil, views: vflIndex))
    }

    func onTap(recognizer: UITapGestureRecognizer) {
        if let d = delegate {
            d.cellTapped(self)
        }
    }

}
