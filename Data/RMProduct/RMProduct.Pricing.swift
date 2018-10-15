//
//  RMProduct.Pricing.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

extension RMProduct
{
	class Pricing
	{
		let price: Double
		let promoPrice: Double?

		let onSale: Bool
		let savings: Double?
		let savingsText: String?

		init(data: [String: Any])
		{
			// Price has to be present all the time
			self.price = data["price"] as! Double

			self.onSale = data["on_sale"] as? Bool ?? false
			if self.onSale {
				// Force wrapping to make sure promo data is available when item is on sale
				self.promoPrice = data["promo_price"] as? Double
				self.savings = data["savings"] as? Double
				self.savingsText = data["savings_text"] as? String
			} else {
				self.promoPrice = nil
				self.savings = nil
				self.savingsText = nil
			}
		}
	}
}
