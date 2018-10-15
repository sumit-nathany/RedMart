//
//  RMImageCache.swift
//  RedMart
//
//  Created by Nathany, Sumit on 10/15/18.
//  Copyright © 2018 RedMart. All rights reserved.
//

import Foundation
import UIKit

internal final class RMImageCache
{
	static let sharedInstance = RMImageCache()
	private var cache = [String: UIImage]()

	private init()
	{

	}

	// This function assumes that the image behind a URL doesn't change
	internal final func getImageFor(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error?) -> ())
	{
		if let cachedImage = self.cache[url.absoluteString] {
			completion(cachedImage, nil)
			return
		} else {
			RMAPIService.sharedInstance.fetchImageAt(url: url) { (image: UIImage?, error: Error?) in
				if image != nil {
					self.cache[url.absoluteString] = image!
					completion(image, nil)
				}
			}
		}
	}
}
