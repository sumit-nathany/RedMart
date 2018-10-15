//
//  RMPrductDetailsImageHeaderView.swift
//  RedMart
//
//  Created by Sumit Nathany on 16/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMPrductDetailsImageHeaderView: UIView, UIPageViewControllerDelegate, UIPageViewControllerDataSource
{
	var slidesArrayInOrder = [RMProduct.Image]()
	var entries: [String] = []

	private var pageViewController: UIPageViewController!

	internal final func createPageViewController(images: [RMProduct.Image])
	{
		let pageController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RMPageController") as! UIPageViewController
		pageController.dataSource = self
		pageController.delegate = self

		self.slidesArrayInOrder = images
		for item in self.slidesArrayInOrder {
			entries.append(item.url.absoluteString)
		}

		let firstController = getItemController(index: 0)!
		let startingViewControllers = [firstController]
		pageController.setViewControllers(startingViewControllers, direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
		pageViewController = pageController
		_ = self.addFittingSubview(subView: pageViewController!.view)
		setupPageControl()
	}

	fileprivate final func setupPageControl()
	{
		var color = UIColor.white
		if slidesArrayInOrder.count > 1 {
			color = UIColor.black
		}
		let appearance = UIPageControl.appearance()
		appearance.pageIndicatorTintColor = color.withAlphaComponent(0.3)
		appearance.currentPageIndicatorTintColor = color.withAlphaComponent(0.9)
		appearance.backgroundColor = UIColor.clear
	}

	fileprivate func getItemController(index:Int) -> RMPageItemViewController?
	{

		if index < slidesArrayInOrder.count {
			let pageItemController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RMPageItemViewController") as! RMPageItemViewController
			pageItemController.itemIndex = index
			pageItemController.contentImageURL = entries[index]
			return pageItemController
		}
		return nil
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

		let itemController = viewController as! RMPageItemViewController
		if itemController.itemIndex > 0 {
			return getItemController(index: itemController.itemIndex-1)
		}
		return nil
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
	{
		let itemController = viewController as! RMPageItemViewController

		if itemController.itemIndex+1 < slidesArrayInOrder.count {
			return getItemController(index: itemController.itemIndex+1)
		}
		return nil
	}

	func presentationCount(for pageViewController: UIPageViewController) -> Int
	{
		return self.slidesArrayInOrder.count
	}

	func presentationIndex(for pageViewController: UIPageViewController) -> Int
	{
		return 0
	}
}

