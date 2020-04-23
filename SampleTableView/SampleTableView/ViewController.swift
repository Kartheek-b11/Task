//
//  ViewController.swift
//  SampleTableView
//
//  Created by Vebbler Technologies on 21/04/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	let refreshContoller = UIRefreshControl()
	var categoriesTableVeiw = UITableView()
	 var categories: [CanadaDataModel] = []
		override func viewDidLoad() {
			super.viewDidLoad()
			// Do any additional setup after loading the view.
			self.setTableView()
			getCategoryData()
		}
	func setTableView(){
//		categoriesTableVeiw.frame = self.view.frame
		categoriesTableVeiw.backgroundColor = UIColor.clear
		categoriesTableVeiw.delegate = self
		categoriesTableVeiw.dataSource = self
		
		refreshContoller.addTarget(self, action: #selector(refreshCategoryData), for: .valueChanged)
		categoriesTableVeiw.addSubview(refreshContoller)
		categoriesTableVeiw.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(categoriesTableVeiw)
		categoriesTableVeiw.rowHeight = UITableView.automaticDimension
		categoriesTableVeiw.estimatedRowHeight = 44.0
		
		categoriesTableVeiw.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "Cell")
		
	}
	override func viewWillLayoutSubviews() {
		let views = ["view": view!, "tableView" : categoriesTableVeiw]
		var allConstraints: [NSLayoutConstraint] = []
		allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: views as [String : Any])
		allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views as [String : Any])
		NSLayoutConstraint.activate(allConstraints)
	}
	 func getCategoryData(){
		ApiCallManager.getAllCategories(success: { (response) in
			let dataDictioanry = response 
		let asData = try? JSONSerialization.data(withJSONObject: dataDictioanry as Any, options: [])
			if let categoriesData = try? JSONDecoder().decode(CanadaDataModel.self, from: asData!){
				self.title = categoriesData.title
//				self.categories = categoriesData.rows
			}
			self.refreshContoller.endRefreshing()
		}) { (Error) in
			self.refreshContoller.endRefreshing()
		}
	}
	@objc func refreshCategoryData(){
		getCategoryData()
	}

}
extension ViewController : UITableViewDelegate,UITableViewDataSource{
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return categories.count
		}
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoriesTableViewCell
//			cell.textLabel!.text = "\(indexPath.row)"
			cell.categoryName.text = "test"
			cell.categoryDescription.text = "jdnjksfsdjfmsfjixadflasmfljskdfksdmflsad jAhdkaSH hkfhKSfkkjs kahfkjhfhs kfs"
		cell.categoryImage.image = UIImage(named: "")
			return cell
		}

}

