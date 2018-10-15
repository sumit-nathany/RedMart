//
//  RMProductTitleCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProductTitleCell: UITableViewCell
{
    @IBOutlet weak var titleLabel: UILabel?
	@IBOutlet weak var weightageLabel: UILabel?

//    var item: RMViewModelItem? {
//        didSet {
//            guard let item = item as? RMViewModelNamePictureItem else {
//                return
//            }
//			titleLabel?.text = item.title
//			weightageLabel?.text = item.weightage
//        }
//    }

    static var nib: UINib
	{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String
	{
        return String(describing: self)
    }
}
