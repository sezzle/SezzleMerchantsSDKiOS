//
//  SezzleDiscount.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleDiscount: Codable {
    var name : String         // The description of the discount
    var amount : SezzlePrice  // A price object
    
    public init(name: String, amount: SezzlePrice) {
        self.name = name;
        self.amount = amount;
    }
}
