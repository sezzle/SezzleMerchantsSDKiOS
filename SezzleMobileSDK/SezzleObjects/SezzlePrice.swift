//
//  SezzlePrice.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzlePrice: Codable {
    var amount_in_cents: Int  //  The amount of the item in cents
    var currency: String    //  The 3 character currency code as defined by ISO 4217
    
    public init(amountInCents: Int, currency: String) {
        self.amount_in_cents = amountInCents;
        self.currency = currency;
    }
}
