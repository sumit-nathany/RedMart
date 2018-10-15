//
//  RMProducrOtherDetailsCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 16/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProducrOtherDetailsCell: UITableViewCell, RMUITableViewCellProtocol
{
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?

	internal final func setValuesBasedOn(product: RMProduct)
	{
		self.titleLabel!.text = "Country of Origin"
		self.valueLabel!.text = product.details!.countryOfOrigin!
	}
}
