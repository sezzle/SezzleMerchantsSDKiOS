//
//  SezzleURL.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleURL: Codable {
    var href : String    // The URL used when redirecting a customer
    var method : String  // The HTTP request method used when redirecting a customer. Currently only the GET method is supported.
    
    public init(href: String, method: String) {
        self.href = href;
        self.method = method;
    }
}
