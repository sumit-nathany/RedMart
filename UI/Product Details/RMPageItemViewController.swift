//
//  RMPageItemViewController.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMPageItemViewController: UIViewController
{
	var itemIndex: Int = 0
	var totalSlides: Int = 0
	var contentImageURL: String!

	@IBOutlet var contentImageView: UIImageView?

    override func viewDidLoad()
	{
        super.viewDidLoad()
		RMImageCache.sharedInstance.getImageFor(url: URL(string: self.contentImageURL!)!) { (image: UIImage?, error: Error?) in
			self.contentImageView?.image = image
		}
    }
}
