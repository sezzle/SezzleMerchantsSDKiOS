//
//  Sezzlestatic letants.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 8/19/20.
//

import Foundation

public class Constants {
    public struct Static {
        static let SANDBOX_URL = "sandbox.sezzle.com"
        static let PRODUCTION_URL = "staging.gateway.sezzle.com"

        static let CHECKOUT_PATH = "/v2/session"

        static let SEZZLE_CHECKOUT_CONFIRMATION_URL = "sezzle://checkout/confirmed"
        static let SEZZLE_CHECKOUT_CANCELLATION_URL = "sezzle://checkout/cancelled"

        static let TAG_CHECKOUT = "CHECKOUT"
        static let CHECKOUT_TOKEN = "checkout_token"
        static let INVALID_SEZZLE_TOKEN = "invalid_sezzle_token";

        static let HTTPS_PROTOCOL = "https://"
        static let HTTP_PROTOCOL = "http://"
        static let HTTP = "http"
        static let CONTENT_TYPE = "application/json; charset=utf-8"
        static let UTF_8 = "utf-8";
        static let X_SEZZLE_REQUEST_ID = "X-Sezzle-Request-Id"
        static let CUSTOMER_EXTRA = "customer_extra"
        static let ORDER_EXTRA = "order_extra"
        static let CHECKOUT_ERROR = "checkout_error"
        static let RESULT_ERROR = -8575
        
        public static let SEZZLE_TEXT_COLOR = UIColor(red: 57 / 255.0, green: 37 / 255.0, blue: 88 / 255.0, alpha: 1)
        
        public enum Locations: String {
            case US = "US"
            case CAN = "CAN"
        }
        
        public enum Languages: String {
            case English = "en"
            case French = "fr"
        }
        
        public enum Environments: String {
            case SANDBOX = "sandbox.sezzle.com"
            case PRODUCTION = "staging.gateway.sezzle.com"
        }
        
        public enum PromotionalText: String {
            case English = "or 4 interest-free payments of $%.2f with"
            case French = "ou 4 versements de $%.2f sans intérêts avec"
        }
        
    }
}
