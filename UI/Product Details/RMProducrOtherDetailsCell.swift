//
//  RMProducrOtherDetailsCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProducrOtherDetailsCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
//    var item: Attribute?  {
//        didSet {
//            titleLabel?.text = item?.key
//            valueLabel?.text = item?.value
//        }
//    }

    static var nib: UINib
	{
        return UINib(nibName: self.identifier, bundle: nil)
    }

    static var identifier: String
	{
        return String(describing: self)
    }
}
