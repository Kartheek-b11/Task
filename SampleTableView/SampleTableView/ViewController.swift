//
//  ViewController.swift
//  SampleTableView
//
//  Created by Vebbler Technologies on 21/04/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var categoriesTableVeiw = UITableView()
		override func viewDidLoad() {
			super.viewDidLoad()
			// Do any additional setup after loading the view.
			self.setTableView()
		}
		func setTableView(){
			categoriesTableVeiw.frame = self.view.frame
			categoriesTableVeiw.backgroundColor = UIColor.clear
			categoriesTableVeiw.delegate = self
			categoriesTableVeiw.dataSource = self
			let refreshContoller = UIRefreshControl()
//			refresher.addTarget(self, action: #selector(refreshData), for: .valueChanged)
			categoriesTableVeiw.addSubview(refreshContoller)
			self.view.addSubview(categoriesTableVeiw)
			categoriesTableVeiw.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
			
		}

	}
	extension ViewController : UITableViewDelegate,UITableViewDataSource{
		func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
			return 10
		}
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
			let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
			cell.textLabel!.text = "\(indexPath.row)"
			return cell
		}

}

