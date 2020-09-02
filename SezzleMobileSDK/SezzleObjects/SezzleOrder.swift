//
//  SezzleOrder.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/10/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public class SezzleOrder: Codable {
    var intent: String    // Accepted values are “AUTH” or “CAPTURE”. If your checkout flow requires the user to confirm their checkout on your site after being approved by Sezzle, use “AUTH” as your intent. If you prefer the checkout be captured immediately, use “CAPTURE”.
    var reference_id : String // Your reference ID for this order
    var description : String  // Your description for this order
    var order_amount:  SezzlePrice // The amount of the order. Must be at least 100
    var requires_shipping_info: Bool // Optional flag to indicate if you would like us to collect shipping information for this checkout from the customer, defaults to false
    var items: [SezzleItem]    // The items being purchased
    var discounts: [SezzleDiscount] // The discounts applied to this order. Must be included in total
    var metadata: [String : String] // Optional object for any custom data you want to submit with the checkout
    var shipping_amount: SezzlePrice //    The shipping fees applied to this order. Must be included in the total
    var tax_amount: SezzlePrice   // The taxes appied to this order. Must be included in the total
    var checkout_expiration: String   // The expiration for the order checkout. Must be in yyyy-mm-dd format
    
    public init(intent: String, referenceId: String, description: String, orderAmount: SezzlePrice, requiresShippingInfo: Bool = false, items: [SezzleItem], discounts: [SezzleDiscount], metadata: [String:String] = [:], shippingAmount: SezzlePrice, taxAmount: SezzlePrice, checkoutExpiration: String) {
        self.intent = intent;
        self.reference_id = referenceId;
        self.description = description;
        self.order_amount = orderAmount;
        self.requires_shipping_info = requiresShippingInfo;
        self.items = items;
        self.discounts = discounts;
        self.metadata = metadata;
        self.shipping_amount = shippingAmount;
        self.tax_amount = taxAmount;
        self.checkout_expiration = checkoutExpiration;
    }
}
