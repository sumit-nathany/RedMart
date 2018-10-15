//
//  RMProductDetailViewModel.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation
import UIKit

internal final class RMProductDetailViewModel: NSObject
{
	let product: RMProduct

	init(product: RMProduct)
	{
		self.product = product
//		// Title and weight
//		if let weightage = product.measure.wt_or_vol {
//			let item = RMViewModelNamePictureItem(name: product.title, pictureUrl: weightage)
//			items.append(item)
//		}
//
//		//Cost detsils
//		let discountedPrice = product.pricing.promoPrice
//		let savingText = product.pricing.savingsText
//		let item = RMViewModelCostItem(price: product.pricing.price, promoPrice: discountedPrice, discountText: savingText)
//		items.append(item)
//
//		//About : Description
//		let item1 = RMViewModelAboutItem(about: description)
//		items.append(item)
//
//		//Other Details: Storage, Country of origin
//		let storage = product.details?.storageClass
//		let countryOfOrigin = product.details?.countryOfOrigin
//
//		if storage != nil || countryOfOrigin != nil {
//			var attributes = [Attribute]()
//
//			attributes.append(Attribute(json: ["key" : "Country Of Origin", "value": countryOfOrigin! ]))
//			attributes.append(Attribute(json: ["key" : "Storage", "value": storage! ]))
//			let item = RMViewModeAttributeItem(attributes: attributes)
//			items.append(item)
//		}
	}
}

extension RMProductDetailViewModel: UITableViewDataSource
{
	func numberOfSections(in tableView: UITableView) -> Int
	{
		return 1//items.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return 1//items[section].rowCount
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
//		let item = items[indexPath.section]
//
//		switch item.type {
//		case .titleAndWeightage:
//			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductTitleCell.identifier, for: indexPath) as? RMProductTitleCell {
//				cell.item = item
//				return cell
//			}
//		case .about:
//			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductDescriptionCell.identifier, for: indexPath) as? RMProductDescriptionCell {
//				cell.item = item
//				return cell
//			}
//		case .cost:
//			if let cell = tableView.dequeueReusableCell(withIdentifier: RMProductPricingDetailsCell.identifier, for: indexPath) as? RMProductPricingDetailsCell {
//				cell.item = item
//				return cell
//			}
//		case .details:
//			if let item = item as? RMViewModeAttributeItem, let cell = tableView.dequeueReusableCell(withIdentifier: RMProducrOtherDetailsCell.identifier, for: indexPath) as? RMProducrOtherDetailsCell {
//				cell.item = item.attributes[indexPath.row]
//				return cell			}
//		}
		return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
	{
		return ""//items[section].sectionTitle
	}
}
