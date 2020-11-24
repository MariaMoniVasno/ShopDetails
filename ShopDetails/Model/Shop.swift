/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Shop : Codable {
	let id : Int?
	let name : String?
	let email : String?
	let phone : String?
	let avatar : String?
	let default_banner : String?
	let description : String?
	let offer_min_amount : Int?
	let offer_percent : Int?
	let estimated_delivery_time : Int?
	let otp : String?
	let address : String?
	let maps_address : String?
	let latitude : Double?
	let longitude : Double?
	let pure_veg : Int?
	let popular : Int?
	let rating : Int?
	let rating_status : Int?
	let status : String?
	let device_type : String?
	let device_token : String?
	let device_id : String?
	let created_at : String?
	let updated_at : String?
	let deleted_at : String?
	let timings : [Timings]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case email = "email"
		case phone = "phone"
		case avatar = "avatar"
		case default_banner = "default_banner"
		case description = "description"
		case offer_min_amount = "offer_min_amount"
		case offer_percent = "offer_percent"
		case estimated_delivery_time = "estimated_delivery_time"
		case otp = "otp"
		case address = "address"
		case maps_address = "maps_address"
		case latitude = "latitude"
		case longitude = "longitude"
		case pure_veg = "pure_veg"
		case popular = "popular"
		case rating = "rating"
		case rating_status = "rating_status"
		case status = "status"
		case device_type = "device_type"
		case device_token = "device_token"
		case device_id = "device_id"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case deleted_at = "deleted_at"
		case timings = "timings"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
		default_banner = try values.decodeIfPresent(String.self, forKey: .default_banner)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		offer_min_amount = try values.decodeIfPresent(Int.self, forKey: .offer_min_amount)
		offer_percent = try values.decodeIfPresent(Int.self, forKey: .offer_percent)
		estimated_delivery_time = try values.decodeIfPresent(Int.self, forKey: .estimated_delivery_time)
		otp = try values.decodeIfPresent(String.self, forKey: .otp)
		address = try values.decodeIfPresent(String.self, forKey: .address)
		maps_address = try values.decodeIfPresent(String.self, forKey: .maps_address)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
		pure_veg = try values.decodeIfPresent(Int.self, forKey: .pure_veg)
		popular = try values.decodeIfPresent(Int.self, forKey: .popular)
		rating = try values.decodeIfPresent(Int.self, forKey: .rating)
		rating_status = try values.decodeIfPresent(Int.self, forKey: .rating_status)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		device_type = try values.decodeIfPresent(String.self, forKey: .device_type)
		device_token = try values.decodeIfPresent(String.self, forKey: .device_token)
		device_id = try values.decodeIfPresent(String.self, forKey: .device_id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		deleted_at = try values.decodeIfPresent(String.self, forKey: .deleted_at)
		timings = try values.decodeIfPresent([Timings].self, forKey: .timings)
	}

}