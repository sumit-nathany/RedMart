//
//  ProductDetailsViewController.swift
//  RedMart
//
//  Created by Sumit Nathany on 16/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class ProductDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
	@IBOutlet weak var tableView: UITableView!
	private let product: RMProduct

	init(product: RMProduct)
	{
		self.product = product
		super.init(nibName: "ProductDetailsViewController", bundle: nil)
	}

	required init?(coder aDecoder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad()
	{
		super.viewDidLoad()
		self.tableView.dataSource = self
		self.tableView.estimatedRowHeight = 120

		self.tableView.register(RMProductDescriptionCell.nib, forCellReuseIdentifier: RMProductDescriptionCell.identifier)
		self.tableView.register(RMProductTitleCell.nib, forCellReuseIdentifier: RMProductTitleCell.identifier)
		self.tableView.register(RMProducrOtherDetailsCell.nib, forCellReuseIdentifier: RMProducrOtherDetailsCell.identifier)
		self.tableView.register(RMProductPricingDetailsCell.nib, forCellReuseIdentifier: RMProductPricingDetailsCell.identifier)
	}

	func numberOfSections(in tableView: UITableView) -> Int
	{
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return 4
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
	{
		let headerView = RMPrductDetailsImageHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
		headerView.createPageViewController(images: self.product.detailImages)
		headerView.backgroundColor = UIColor.white
		return headerView
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 300
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let rowType = RowType(rawValue: indexPath.row)!

		switch rowType {
		case .titleAndQuantity:
			let cell = tableView.dequeueReusableCell(withIdentifier: RMProductTitleCell.identifier, for: indexPath) as! RMProductTitleCell
			cell.setValuesBasedOn(product: self.product)
			return cell
		case .aboutTheProduct:
			let cell = tableView.dequeueReusableCell(withIdentifier: RMProductDescriptionCell.identifier, for: indexPath) as! RMProductDescriptionCell
			cell.setValuesBasedOn(product: self.product)
			return cell
		case .price:
			let cell = tableView.dequeueReusableCell(withIdentifier: RMProductPricingDetailsCell.identifier, for: indexPath) as! RMProductPricingDetailsCell
			cell.setValuesBasedOn(product: self.product)
			return cell
		case .countryOfOrigin:
			let cell = tableView.dequeueReusableCell(withIdentifier: RMProducrOtherDetailsCell.identifier, for: indexPath) as! RMProducrOtherDetailsCell
			cell.setValuesBasedOn(product: self.product)
			return cell
		}
	}

	internal enum RowType: Int
	{
		case titleAndQuantity = 0
		case price = 1
//		case buttons = 2
		case aboutTheProduct = 2
		case countryOfOrigin = 3
	}
}
