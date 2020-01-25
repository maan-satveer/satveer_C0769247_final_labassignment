//
//  Products.swift
//  satveer_C0769247_final_labassignment
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation
class Products{
     init(name: String, id: String, detail: String, price: Int) {
        self.name = name
        self.id = id
        self.detail = detail
        self.price = price
    }
    
    var name: String
    var id: String
    var detail: String
    var price: Int
}
