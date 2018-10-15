//
//  ProductsViewController.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class ProductsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var logoImage: UIImageView!

	private var productList: RMProductList!
	private var cellSize: CGSize!

    override func viewDidLoad()
	{
		super.viewDidLoad()

		// Showing launchscreen like view
		// Ideally I should have created another view controller which is same as launch screen view controller
		// Shown it as rootViewController > Download product list > Created product list view controller >
		// and and then shown the product list view controller
		self.navigationController!.isNavigationBarHidden = true
		self.view.layer.backgroundColor = UIColor(named: "LogoColor")!.cgColor
		self.logoImage.isHidden = false
		self.collectionView.isHidden = true

		RMAPIService.sharedInstance.fetchProductList { [weak self] (productList: RMProductList?, error: Error?) in
			guard let blockSelf = self else {
				return
			}

			guard error == nil else {
				// TODO: Handle error gracefully, show some alert etc.
				return
			}

			blockSelf.productList = productList
			blockSelf.loadProductList()
		}
    }

	private final func loadProductList()
	{
		RMProductCollectionViewCell.registerCellForCollectionView(self.collectionView)
		self.navigationItem.title = "Products List"

		self.collectionView.reloadData()
		DispatchQueue.main.async {
			// Undo showing of launchscreen type view
			self.navigationController?.isNavigationBarHidden = false
			self.navigationController?.navigationBar.barTintColor = UIColor(named: "LogoColor")!
			self.view.layer.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1).cgColor
			self.logoImage.isHidden = true
			self.collectionView.isHidden = false
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		return self.productList?.products.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
	{
		if self.cellSize == nil {
			self.cellSize = self.getCellSize()
		}

		return self.cellSize
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
	{
		let cell = RMProductCollectionViewCell.reusableCellForCollectionView(collectionView, indexPath: indexPath)

		let product = self.productList!.products[indexPath.row]
		RMImageCache.sharedInstance.getImageFor(url: product.mainImage.url) { (image: UIImage?, error: Error?) in
			cell.iconImageView.image = image
		}

		cell.set(description: product.title, price: product.pricing.price)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
	{
		let producDetailsVC = ProductDetailsViewController(product: self.productList!.products[indexPath.row])
		self.navigationController!.pushViewController(producDetailsVC, animated: true)
	}

	private final func getCellSize() -> CGSize
	{
		// Minimum spacing between cells = 6.0
		// Number of cells in one row = 3
		let oneCellWidth = (UIScreen.main.bounds.width - (6.0 * 4)) / 3
		return CGSize(width: oneCellWidth, height: oneCellWidth*1.4)
	}
}
