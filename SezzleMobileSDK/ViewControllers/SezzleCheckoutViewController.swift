//
//  SezzleCheckoutViewController.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/11/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class SezzleCheckoutViewController: SezzleBaseViewController {
    
    
    private let cancelURL = SezzleURL(href: Constants.Static.SEZZLE_CHECKOUT_CANCELLATION_URL, method: "GET")
    private let confirmURL = SezzleURL(href: Constants.Static.SEZZLE_CHECKOUT_CONFIRMATION_URL, method: "GET")
    var checkoutDelegate: SezzleCheckoutDelegate?
    
    var sezzleConfiguration: SezzleConfiguration!
    
    private var checkoutToken: String = ""
    // this class will create a delegate class for the entire SDK
    // and then call those delegate methods to update the app according to progress
    // we need to return the view controller from here to the app
    // when we initialize the view controller, we want to initialize it with a delegate?
    // or we could handle it as a optional that we call conditionally
    
    
    
    public init(customer: SezzleCustomer, order: SezzleOrder, delegate: SezzleCheckoutDelegate, configuration: SezzleConfiguration) {
        super.init(nibName: nil, bundle: nil)
        let session = SezzleSession(cancelURL: cancelURL, completeURL: confirmURL, customer: customer, order: order)
        self.checkoutDelegate = delegate
        self.sezzleConfiguration = configuration
        self.getSezzleURL(sezzleSession: session)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func displayURL(checkoutURLString: String, checkoutUUID: String) {
        let checkoutURL = URL(string: checkoutURLString)!
        DispatchQueue.main.async {
            self.webView?.load(URLRequest(url: checkoutURL))
        }
        checkoutToken = checkoutUUID
        // checkoutDelegate?.completedCheckoutWithToken(token: checkoutUUID)
        // okay, 
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let newURLString = navigationAction.request.url?.absoluteString
        
        if (newURLString == cancelURL.href) {
            print("We cancelled the order!")
            checkoutDelegate?.checkoutCancelled()
            decisionHandler(.cancel)
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        if (newURLString == confirmURL.href) {
            print("The order has been confirmed!")
            checkoutDelegate?.completedCheckoutWithToken(token: checkoutToken)
            decisionHandler(.cancel)
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("suck it trebek again")
        checkoutDelegate?.checkoutCancelledWithReason(reasonCode: ErrorHandler.ReasonCodes.webViewError.rawValue)
    }
}
