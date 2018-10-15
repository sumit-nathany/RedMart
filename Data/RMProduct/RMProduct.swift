//
//  RMProduct.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

internal final class RMProduct
{
	let id: Int

	let title: String
	let description: String

	let pricing: Pricing

	let measure: Measure
	let details: Details?
	let detailImages: [Image]
	let mainImage: Image

	//	let types: [Int]?

	init(data: [String: Any])
	{
		self.id = data["id"] as! Int

		self.title = data["title"] as! String
		self.description = data["desc"] as! String

		self.pricing = Pricing(data: data["pricing"] as! [String: Any])
		self.measure = Measure(data: data["measure"] as! [String: Any])
		self.details = Details(data: data["details"] as! [String: Any])

		self.mainImage = Image(data: data["img"] as! [String: Any])

		var imagesList = [RMProduct.Image]()
		let imageArray = data["images"] as! [[String: Any]]
		for image in imageArray {
			imagesList.append(Image(data: image))
		}
		self.detailImages = imagesList
	}
}
