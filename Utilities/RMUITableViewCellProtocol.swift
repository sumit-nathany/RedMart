//
//  RMUITableViewCellProtocol.swift
//  RedMart
//
//  Created by Nathany, Sumit on 10/15/18.
//  Copyright © 2018 RedMart. All rights reserved.
//

import Foundation
import UIKit

protocol RMUITableViewCellProtocol
{
	static var nib: UINib { get }
	static var identifier: String { get }
}

extension RMUITableViewCellProtocol
{
	static var identifier: String
	{
		return String(describing: self)
	}

	static var nib: UINib
	{
		return UINib(nibName: self.identifier, bundle: nil)
	}
}

