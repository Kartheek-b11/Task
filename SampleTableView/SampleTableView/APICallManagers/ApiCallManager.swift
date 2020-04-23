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
class ApiCallManager {
	
	class func getAllCategories(success:@escaping ([String: Any]) -> Void, failure:@escaping (Error) -> Void){
		
		
		var request = URLRequest(url: URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!,timeoutInterval: Double.infinity)
		request.httpMethod = "GET"
		let task = URLSession.shared.dataTask(with: request) { data, response, error in
		  guard let data = data else {
			print(String(describing: error))
			return
		  }
			do {
				let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
				print("response \(json)")
				success(json!)
			} catch {
				print("JSON error: \(error.localizedDescription)")
			}
		}

		task.resume()
}
}
