//
//  RMProduct.Measure.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

extension RMProduct
{
	class Measure
	{
		//	let volMetricAlt: String?
		//	let wtMetric: String?
		//	let volMetric: String?
		//	let vol: Double?
		//	let wt: Double?
		//	let w: Double?
		//	let l: Double?
		//	let h: Double?

		let wt_or_vol: String?
		let size: Double?

		init(data: [String: Any])
		{
			//		self.volMetricAlt = data["vol_metric_alt"] as? String
			//		self.wtMetric = data[""] as? String
			//		self.volMetric = data[""] as? String
			//		self.vol = data[""] as? String
			//		self.wt = data[""] as? String
			//		self.w = data[""] as? String

			self.wt_or_vol = data["wt_or_vol"] as? String
			self.size = data["size"] as? Double
		}
	}
}
