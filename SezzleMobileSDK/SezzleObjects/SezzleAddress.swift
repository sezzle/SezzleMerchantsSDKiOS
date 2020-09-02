//
//  SezzleAddress.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleAddress: Codable {
    var name : String    // The name on the address
    var street : String    // The street and number of the address
    var street2 : String   // The apt or unit
    var city : String  // The city
    var state : String    // The 2 character state code
    var postal_code : String   // The postal delivery code
    var country_code : String //   The 2 character country code
    var phone_number : String   // The phone number at the delivery location
    
    public init(name: String, streetAddress: String, aptNumber: String = "", city: String, state: String, postalCode: String, countryCode: String, phoneNumber: String) {
        self.name = name;
        self.street = streetAddress;
        self.street2 = aptNumber;
        self.city = city;
        self.state = state;
        self.postal_code = postalCode;
        self.country_code = countryCode;
        self.phone_number = phoneNumber;
    }
}
