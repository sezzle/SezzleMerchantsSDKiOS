//
//  SezzleURLSession.swift
//  SezzleSDK
//
//  Created by Charlie Sarano on 8/13/20.
//  Copyright © 2020 Charlie Sarano. All rights reserved.
//

import Foundation
import SwiftyJSON

extension SezzleCheckoutViewController: URLSessionDataDelegate {
    
    func getSezzleURL(sezzleSession: SezzleSession) {
        print("started the getSezzleURL function")
        let apiProtocol = Constants.Static.HTTPS_PROTOCOL
        let domain = self.sezzleConfiguration.environment
        let urlPath = apiProtocol + domain + Constants.Static.CHECKOUT_PATH
        let url: URL = URL(string: urlPath)!
        var request1: URLRequest = URLRequest(url: url)

        request1.httpMethod = "POST"
        
        do {
            let jsonEncoder = JSONEncoder()
            let sezzleSessionJSON = try jsonEncoder.encode(sezzleSession)

            request1.timeoutInterval = 60
            let publicKey = self.sezzleConfiguration.publicKey
            let publicKeyUTF8 = publicKey.data(using: .utf8)
            if let publicKeyBase64 = publicKeyUTF8?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)) {
                request1.addValue("Basic " + publicKeyBase64, forHTTPHeaderField: "Authorization")
                request1.setValue(Constants.Static.CONTENT_TYPE, forHTTPHeaderField: "Content-Type")
                request1.setValue("Accept", forHTTPHeaderField: "application/json")
                request1.httpBody=sezzleSessionJSON

                let defaultSession = URLSession(configuration: .default)
                let getURLTask = defaultSession.dataTask(with: request1) { (data, response, error) in
                    // here is where we handle the response, once the app has passed us order information
                    // we'll want to test this and see
                    guard let data = data,
                        let response = response as? HTTPURLResponse,
                        error == nil else {                                              // check for fundamental networking error
                            print("error", error ?? "Unknown error")
                            if let error = error {
                                self.checkoutDelegate?.checkoutFailedWithError(error: error)
                            } else {
                                self.checkoutDelegate?.checkoutCancelledWithReason(reasonCode: ErrorHandler.ReasonCodes.noConnectionError.rawValue)
                            }
                            
                            DispatchQueue.main.async {
                                self.dismiss(animated: true, completion: nil)
                            }
                            return
                    }

                    guard (200 ... 299) ~= response.statusCode else {                    // check for http errors
                        print("statusCode should be 2xx, but is \(response.statusCode)")
                        print("response = \(response)")
                        if response.statusCode == 401 {
                            self.checkoutDelegate?.checkoutCancelledWithReason(reasonCode: ErrorHandler.ReasonCodes.noConnectionError.rawValue)
                        } else if response.statusCode == 500 {
                            self.checkoutDelegate?.checkoutCancelledWithReason(reasonCode: ErrorHandler.ReasonCodes.authorizationError.rawValue)
                        } else {
                            self.checkoutDelegate?.checkoutCancelled()
                        }
                        DispatchQueue.main.async {
                           self.dismiss(animated: true, completion: nil)
                       }
                        return
                    }
                    
                    // now we need to use swiftyJSON to access the uuid to pass back to the
                    // app, and then get the URL to send to the webview
                    print(response)
                    let json = JSON(data)
                    let orderUUID = json["order"]["uuid"].string
                    let checkoutURL = json["order"]["checkout_url"].string
                    self.displayURL(checkoutURLString: checkoutURL!, checkoutUUID: orderUUID!)
                }
                print("and now we started the getURLTask")
                getURLTask.resume()
            }
        }
        catch {
            loadErrorPage(error: error)
        }
    
    }
}
