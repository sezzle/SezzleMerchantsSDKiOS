//
//  SezzleCheckoutViewcontroller.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/5/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class SezzleBaseViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    
    // needs to be a webview, that covers the phone and then tells us
    // what the progress of the order is
    // The webview will display something when the order is successful
    // Let's just get the webview up and running and set up the delegate class
    // then we present this within a navigation view controller?
    
    
    var webView : WKWebView?
    
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        let webView = WKWebView(frame: self.view.bounds, configuration: configuration)
        webView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        webView.contentMode = .scaleAspectFill
        webView.isMultipleTouchEnabled = false
        webView.uiDelegate = self
        webView.navigationDelegate = self
        //webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        self.view.addSubview(webView)
        self.webView = webView
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
//    public override class func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        if (keyPath == "estimatedProgress") {
//            if (change?[NSKeyValueChangeKey(rawValue: "new")] as! Double > 1.0) {
//                // add some changes to incorporate some progress bar?
//                // not sure why we would need this
//                // this might be to load the order with the customer
//                //
//            }
//        } else {
//            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
//        }
//    }
    
    func loadErrorPage(error: Error) {
        // in the future we log errors with parameters:@{@"error_description": error.localizedDescription}];
        //var errorDescription = error.localizedDescription.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        //var url = SezzleConfiguration.sharedInstance.domain
        //NSString *url = [NSString stringWithFormat:@"https://www.%@/u/#/error?main=Error&sub=%@",
        //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    }
}
