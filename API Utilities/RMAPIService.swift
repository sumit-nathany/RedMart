//
//  RMAPIService.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation
import UIKit

internal final class RMAPIService
{
	internal static let sharedInstance = RMAPIService()

	private let productListURL = URL(string: "https://api.redmart.com/v1.6.0/catalog/search?theme=all-sales&pageSize=30&page=0")!
	internal let baseURL = "http://media.redmart.com/newmedia/200p"

	private init()
	{

	}

	internal final func fetchProductList(completion: @escaping (_ productList: RMProductList?, _ error: Error?) -> ())
	{
		DispatchQueue.global(qos: .userInitiated).async {
			URLSession.shared.dataTask(with: self.productListURL) { (data, response, error) in
				guard let data = data else {
					// TODO: Throw a valid error here
					completion(nil, nil)
					return
				}

				// There is no point in gracefully handling the error if server response is not a valid JSON
				// Just go ahead and crash
				// Ideally we should have shown an alert displaying the error message, but we are keeping things simple here
				let jsonResponse = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
				let productList = RMProductList(json: jsonResponse)
				DispatchQueue.main.async {
					completion(productList, nil)
				}
			}.resume()
		}
	}

	internal final func fetchImageAt(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> ())
	{
		DispatchQueue.global(qos: .userInitiated).async {
			URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
				DispatchQueue.main.async {
					guard error == nil, data != nil else {
						// TODO: Throw a valid error here
						completion(nil, nil)
						return
					}

					guard let image = UIImage(data: data!) else {
						// TODO: Throw a valid error here
						completion(nil, nil)
						return
					}

					completion(image, nil)
				}
			}).resume()
		}
	}
}
