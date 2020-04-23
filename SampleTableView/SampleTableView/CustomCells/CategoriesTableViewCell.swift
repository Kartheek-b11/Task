//
//  CategoriesTableViewCell.swift
//  SampleTableView
//
//  Created by Vebbler Technologies on 22/04/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

	let categoryImage = UIImageView()
    let categoryName = UILabel()
    let categoryDescription = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
		
    }
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		categoryImage.backgroundColor = UIColor.red
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryDescription.translatesAutoresizingMaskIntoConstraints = false
        
       contentView.addSubview(categoryImage)
        contentView.addSubview(categoryName)
        contentView.addSubview(categoryDescription)
		
		
//		let marginGuide = contentView.layoutMarginsGuide
//
//		categoryName.translatesAutoresizingMaskIntoConstraints = false
//		categoryName.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
//		categoryName.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
//		categoryName.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
//
//		categoryDescription.translatesAutoresizingMaskIntoConstraints = false
//		categoryDescription.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
//		categoryDescription.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
//		categoryDescription.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
//		categoryDescription.topAnchor.constraint(equalTo: categoryName.bottomAnchor).isActive = true
//		categoryDescription.numberOfLines = 0

        
        let views = [
            "image" : categoryImage,
            "name"  : categoryName,
            "description" : categoryDescription,
            ]

        var allConstraints: [NSLayoutConstraint] = []
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[image(50)]", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[description]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image(50)]-[name]-|", options: [], metrics: nil, views: views)
        allConstraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-[image]-[description]-|", options: [], metrics: nil, views: views)

         NSLayoutConstraint.activate(allConstraints)
		categoryDescription.numberOfLines = 0
        
    }
//	func populateData(categories : data){
//		
//	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
