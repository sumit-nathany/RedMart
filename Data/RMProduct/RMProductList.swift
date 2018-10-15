//
//  RMProductList.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

internal final class RMProductList
{
	let products : [RMProduct]
//	let facets : Facets?
//	let filters : Filters?
//	let on_sale_count : Int?
//	let status : Status?
//	let total : Int?
//	let page : Int?
//	let page_size : Int?
//	let meta : Meta?
//	let title : String?
//	let images : Images?

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
