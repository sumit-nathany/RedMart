//
//  RMProduct.Details.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

extension RMProduct
{
	class Details
	{
//		let status : Int?
//		let productType : Int?
//		let uri : String?
		let countryOfOrigin : String?
//		let storageClass : String?
		let isNew : Int?

		init(data: [String: Any])
		{
			self.isNew = nil
			self.countryOfOrigin = data["country_of_origin"] as? String
		}
	}
}
