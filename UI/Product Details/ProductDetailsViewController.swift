//
//  ProductDetailsViewController.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class ProductDetailsViewController: UIViewController
{
	@IBOutlet weak var tableView: UITableView!

	private let product: RMProduct
	private let viewModel: RMProductDetailViewModel

	init(product: RMProduct)
	{
		self.product = product
		self.viewModel = RMProductDetailViewModel(product: product)
		super.init(nibName: "ProductDetailsViewController", bundle: nil)
	}

	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.tableView.dataSource = self.viewModel
		self.tableView.estimatedRowHeight = 100

		self.tableView.register(RMProductDescriptionCell.nib, forCellReuseIdentifier: RMProductDescriptionCell.identifier)
		self.tableView.register(RMProductTitleCell.nib, forCellReuseIdentifier: RMProductTitleCell.identifier)
		self.tableView.register(RMProducrOtherDetailsCell.nib, forCellReuseIdentifier: RMProducrOtherDetailsCell.identifier)
		self.tableView.register(RMProductPricingDetailsCell.nib, forCellReuseIdentifier: RMProductPricingDetailsCell.identifier)

		let headerView = RMPrductDetailsImageHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200))
//		headerView.createPageViewController(images: product.images!)
		headerView.backgroundColor = UIColor.white
		self.tableView.tableHeaderView = headerView
	}
}
