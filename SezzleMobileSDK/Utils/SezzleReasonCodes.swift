//
//  SezzleReasonCodes.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 8/19/20.
//

import Foundation

public class ErrorHandler {
    
    public enum ReasonCodes: String {

        case noConnectionError = "noConnectionError"
        case authorizationError =  "authError"
        case webViewError = "webViewError"
        
    }
}
