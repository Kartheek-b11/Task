//
//  DataModel.swift
//  SampleTableView
//
//  Created by Vebbler Technologies on 22/04/20.
//  Copyright © 2020 Kartheek. All rights reserved.
//

import Foundation
class CanadaDataModel: Codable {
    let title: String?
    let rows: [Row]?

    init(title: String?, rows: [Row]?) {
        self.title = title
        self.rows = rows
    }
}

// MARK: - Row
class Row: Codable {
    let title, rowDescription: String?
    let imageHref: String?

    enum CodingKeys: String, CodingKey {
        case title
        case rowDescription = "description"
        case imageHref
    }

    init(title: String?, rowDescription: String?, imageHref: String?) {
        self.title = title
        self.rowDescription = rowDescription
        self.imageHref = imageHref
    }
}
