//
//  SezzleCustomer.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleCustomer: Codable {
    var tokenize : Bool        // Determines whether or not this customer will be tokenized
    var email : String         // The customer’s email address
    var first_name  : String    // The customer’s first name
    var last_name : String      // The customer’s last name
    var phone : String   // The customer’s phone number
    var dob : String     // The customer’s date of birth in YYYY-MM-DD format
    var billing_address : SezzleAddress  // The customer’s billing address
    var shipping_address : SezzleAddress // The customer’s shipping address
    
    public init(tokenize: Bool, email: String, firstName: String, lastName: String, phone: String, dob: String, billingAddress: SezzleAddress, shippingAddress: SezzleAddress) {
        self.tokenize = tokenize;
        self.email = email;
        self.first_name = firstName;
        self.last_name = lastName;
        self.phone = phone;
        self.dob = dob;
        self.billing_address = billingAddress;
        self.shipping_address = shippingAddress;
    }
}
