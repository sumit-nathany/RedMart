//
//  Types.swift
//  RedMart
//
//  Created by Sumit Nathany on 10/08/18.
//  Copyright © 2018 Sumit Nathany. All rights reserved.
//

import Foundation

struct Types : Codable {

	let count : Int?
	let name : String?
	let uri : String?

	enum CodingKeys: String, CodingKey {

		case count = "count"
		case name = "name"
		case uri = "uri"
	}

	init(from decoder: Decoder) throws {
		
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try values.decodeIfPresent(Int.self, forKey: .count)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
	}
}
