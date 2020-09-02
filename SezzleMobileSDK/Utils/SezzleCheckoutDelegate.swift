//
//  SezzleCheckoutDelegate.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/11/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation

public protocol SezzleCheckoutDelegate {
    func completedCheckoutWithToken(token: String)
    
    func checkoutCancelled()
    
    func checkoutCancelledWithReason(reasonCode: String)
    
    func checkoutFailedWithError(error: Error)
}
