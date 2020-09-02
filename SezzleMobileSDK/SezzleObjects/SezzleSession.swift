//
//  SezzleSession.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

class SezzleSession: Codable {
    var cancel_url : SezzleURL   // The HTTP request information used to redirect the customer in the case of a cancellation
    var complete_url : SezzleURL // The HTTP request infromation used to redirect the customer upon completion of the session
    var customer : SezzleCustomer // The customer for this session
    var order : SezzleOrder       // The order for this session
    
    public init(cancelURL: SezzleURL, completeURL: SezzleURL, customer: SezzleCustomer, order: SezzleOrder) {
        self.cancel_url = cancelURL;
        self.complete_url = completeURL;
        self.customer = customer;
        self.order = order;
    }
}
