//
//  SelectorControl.swift
//  VFLPractice
//
//  Created by Rachel Schneebaum on 12/16/15.
//  Copyright © 2015 Rachel Schneebaum. All rights reserved.
//

import UIKit

class SelectorControl: UIView, SelectorCellDelegate {

    var vflIndex: [String: UIView]!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupControl()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupControl()
    }


    private func setupControl() {
        backgroundColor = UIColor.whiteColor()

        layer.cornerRadius = 5.0
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.whiteColor().CGColor


        /// get bundled UI data from your local cache (plist,

        vflIndex = [String: UIView]()
        createLayout()

    }

    func createLayout() {
        for i in 1...4 {

            let cell = SelectorCell()
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.backgroundColor = UIColor.blackColor()

            cell.tag = i * 10
            cell.userInteractionEnabled = true
            cell.delegate = self
            vflIndex["L\(i)"] = cell
            addSubview(cell)
        }

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-1-[L1]-1-[L2(==L1)]-1-[L3(==L1)]-1-[L4(==L1)]-1-|", options: [], metrics: nil, views: vflIndex))

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L1]-1-|", options: [], metrics: nil, views: vflIndex))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L2]-1-|", options: [], metrics: nil, views: vflIndex))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L3]-1-|", options: [], metrics: nil, views: vflIndex))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L4]-1-|", options: [], metrics: nil, views: vflIndex))
    }

    func cellTapped(cell: SelectorCell) {
        print("tapped")
        switch cell.tag {
        case 10:
            print("do something with 10")
        case 20:
            print("do something with 20")
        case 30:
            print("do something with 30")
        case 40:
            print("do something with 40")
        default:
            print("error - unrecognized tag \(cell.tag)")

        }
    }

}
