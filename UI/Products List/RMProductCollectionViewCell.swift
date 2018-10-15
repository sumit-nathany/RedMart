//
//  RMProductCollectionViewCell.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import UIKit

internal final class RMProductCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var iconImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!

	override func awakeFromNib()
	{
		super.awakeFromNib()
		self.layer.cornerRadius = 4.0
		self.titleLabel.numberOfLines = 3
		self.layer.backgroundColor = UIColor.white.cgColor
	}

    internal static func registerCellForCollectionView(_ collectionView: UICollectionView)
	{
        collectionView.register(UINib(nibName: "RMProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RMProductCollectionViewCell")
    }
    
    internal static func reusableCellForCollectionView(_ collectionView:UICollectionView, indexPath:IndexPath) -> RMProductCollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RMProductCollectionViewCell", for: indexPath) as! RMProductCollectionViewCell
        return cell
    }
    
	internal final func set(description: String, price: Double)
    {
		let title = description.removeStringsWithinBrackets()

        self.titleLabel.attributedText = NSAttributedString(string: title, attributes: [
			NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14, weight: .regular),
			NSAttributedStringKey.foregroundColor: UIColor.black.withAlphaComponent(0.8)])

		self.priceLabel.attributedText = NSMutableAttributedString(string: "$\(price)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12, weight: .regular), NSAttributedStringKey.foregroundColor: UIColor.black.withAlphaComponent(1.0)])
    }
}
