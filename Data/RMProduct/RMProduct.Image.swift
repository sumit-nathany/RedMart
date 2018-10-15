//
//  RMProduct.Image.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

extension RMProduct
{
	class Image
	{
		let name: String

		let height: Int?
		let width: Int?
		let position: Int?

		var url: URL {
			get {
				// Again, force unwrapping since we want to crash as early as possible rather than gracefully handle such errors
				return URL(string: RMAPIService.sharedInstance.baseURL + name)!
			}
		}

		init(data: [String: Any])
		{
			self.name = data["name"] as! String

			self.height = data["h"] as? Int
			self.width = data["w"] as? Int
			self.position = data["position"] as? Int
		}
	}
}
