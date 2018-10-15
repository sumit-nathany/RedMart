//
//  RMProductTitleCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProductTitleCell: UITableViewCell, RMUITableViewCellProtocol
{
    @IBOutlet weak var titleLabel: UILabel?
	@IBOutlet weak var weightageLabel: UILabel?

	internal final func setValuesBasedOn(product: RMProduct)
	{
		self.titleLabel!.text = product.title
		self.weightageLabel!.text = product.measure.wt_or_vol
	}
}
