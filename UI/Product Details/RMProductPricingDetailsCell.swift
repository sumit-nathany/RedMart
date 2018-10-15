//
//  RMProductPricingDetailsCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProductPricingDetailsCell: UITableViewCell, RMUITableViewCellProtocol
{
	@IBOutlet weak var priceLabel: UILabel?
	@IBOutlet weak var discountedPriceTextDescriptionLabel: UILabel?

	internal final func setValuesBasedOn(product: RMProduct)
	{
		if product.pricing.promoPrice != nil && product.pricing.promoPrice! > 0 {
			self.priceLabel!.attributedText = self.formattedDiscountedPriceWithOrignalPriceSubtitleString("$\(product.pricing.price)", discountedPrice: "$\(product.pricing.promoPrice!)")
			if let percentageText = product.pricing.savingsText {
				self.discountedPriceTextDescriptionLabel!.isHidden = false
				self.discountedPriceTextDescriptionLabel!.text = "  " + percentageText + "  "
			}
		} else {
			self.discountedPriceTextDescriptionLabel?.isHidden = true
			self.priceLabel!.text = "$\(product.pricing.price))"
		}
	}

	override func awakeFromNib()
	{
		super.awakeFromNib()
		self.discountedPriceTextDescriptionLabel?.layer.cornerRadius = 3.0
	}

	private final func formattedDiscountedPriceWithOrignalPriceSubtitleString(_ orignalPrice:String, discountedPrice:String) -> NSAttributedString
	{
		let attrString = NSMutableAttributedString(string: "")
		let discountedPriceFont = UIFont.systemFont(ofSize: 14, weight: .bold)
		let orignalPriceFont = UIFont.systemFont(ofSize: 14, weight: .regular)
		
		let orignalPriceStringPerYear = orignalPrice
		let orignalAttributedString = NSMutableAttributedString(string: orignalPriceStringPerYear)
		_ = orignalAttributedString.strikeOfAttributedString(orignalPriceFont, color: UIColor.black.withAlphaComponent(0.7), stringValue: orignalPriceStringPerYear)
		
		let discountedPriceStringPerYear =  discountedPrice + "  "
		let discountedPriceAttrString = NSAttributedString(string: discountedPriceStringPerYear, attributes: [NSAttributedStringKey.font: discountedPriceFont,NSAttributedStringKey.foregroundColor: UIColor.red.withAlphaComponent(0.7)])
		
		attrString.append(discountedPriceAttrString)
		attrString.append(orignalAttributedString)
		
		return attrString
	}
}
