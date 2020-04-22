//
//  ApiCallManager.swift
//  SampleTableView
//
//  Created by Vebbler Technologies on 22/04/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ApiCallmanager {
	func getAllCategories(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
		 let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
				Alamofire.request(urlString).validate().responseJSON { (data) in
//					print("get Cart Request  \(data.request)")
//					print("get Cart RESPONSE Value\(data.result.value)")
//					print("get Cart RESPONSE result\(data.result)")
//					print("get Cart RESPONSE \(data)")
					switch data.result {
					case .success(let json):
						let resJson = JSON(json)
						success(resJson)
					case .failure( _): break
//						debug_log.error("\(Log.stats()) \(error.localizedDescription)")/
//						FIRAnalytics.eventTracking(eventName: "Cart_API_Failure", parameters: ["error":"\(error.localizedDescription)"])
//						failure(error)
//						self.showBanner("\(error.localizedDescription)")
					}
				}
	}
}
