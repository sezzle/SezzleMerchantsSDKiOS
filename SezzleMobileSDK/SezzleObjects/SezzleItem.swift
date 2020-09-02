//
//  SezzleItem.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleItem: Codable {
    var name: String   // The name of the item
    var sku: String    // The sku identifier
    var quantity: Int  // The quantity purchased
    var price: SezzlePrice   // The price object
    
    public init(name: String, sku: String, quantity: Int, price: SezzlePrice) {
        self.name = name;
        self.sku = sku;
        self.quantity = quantity;
        self.price = price;
    }
}
