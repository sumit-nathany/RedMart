//
//  RMProductDescriptionCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProductDescriptionCell: UITableViewCell, RMUITableViewCellProtocol
{
    @IBOutlet weak var aboutLabel: UILabel?

	internal final func setValuesBasedOn(product: RMProduct)
	{
		self.aboutLabel!.text = product.description
	}
}
