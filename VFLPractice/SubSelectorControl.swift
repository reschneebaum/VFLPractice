//
//  SubSelectorControl.swift
//  VFLPractice
//
//  Created by Rachel Schneebaum on 12/16/15.
//  Copyright © 2015 Rachel Schneebaum. All rights reserved.
//

import UIKit

class SubSelectorControl: SelectorControl {

    override func createLayout() {
        for i in 1...3 {

            let cell = SelectorCell()
            cell.translatesAutoresizingMaskIntoConstraints = false
            cell.backgroundColor = UIColor.blackColor()

            cell.tag = i * 10
            cell.userInteractionEnabled = true
            cell.delegate = self
            vflIndex["L\(i)"] = cell
            addSubview(cell)
        }

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-1-[L1]-1-[L2(==L1)]-1-[L3(==L1)]-1-|", options: [], metrics: nil, views: vflIndex))

        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L1]-1-|", options: [], metrics: nil, views: vflIndex))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L2]-1-|", options: [], metrics: nil, views: vflIndex))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-1-[L3]-1-|", options: [], metrics: nil, views: vflIndex))
    }

    override func cellTapped(cell: SelectorCell) {
        print("tapped")
        switch cell.tag {
        case 10:
            print("do sub with 10")
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
