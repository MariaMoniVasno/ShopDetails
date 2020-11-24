/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Banners : Codable {
	let product_id : Int?
	let url : String?
	let position : Int?
	let status : String?
	let shopstatus : String?
	let shopopenstatus : String?
	let shop : Shop?
	let product : Product?

	enum CodingKeys: String, CodingKey {

		case product_id = "product_id"
		case url = "url"
		case position = "position"
		case status = "status"
		case shopstatus = "shopstatus"
		case shopopenstatus = "shopopenstatus"
		case shop = "shop"
		case product = "product"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		position = try values.decodeIfPresent(Int.self, forKey: .position)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		shopstatus = try values.decodeIfPresent(String.self, forKey: .shopstatus)
		shopopenstatus = try values.decodeIfPresent(String.self, forKey: .shopopenstatus)
		shop = try values.decodeIfPresent(Shop.self, forKey: .shop)
		product = try values.decodeIfPresent(Product.self, forKey: .product)
	}

}