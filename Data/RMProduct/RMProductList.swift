//
//  RMProductList.swift
//  RedMart
//
//  Created by Sumit Nathany on 14/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

internal final class RMProductList
{
	let products : [RMProduct]
	// Other values can be kept here

	init(json: [String: Any])
	{
		var productArray = [RMProduct]()

		let productListArray = json["products"] as! [[String: Any]]
		for product in productListArray {
			productArray.append(RMProduct(data: product))
		}

		self.products = productArray
	}
}
