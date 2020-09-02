//
//  ViewController.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 08/17/2020.
//  Copyright (c) 2020 Charlie Sarano. All rights reserved.
//

import UIKit
import SezzleMobileSDK

class ViewController: UIViewController, SezzleCheckoutDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func showPromotionalContent() {
        
    }
    
    @IBAction func startCheckout(_ sender: Any) {
        let configuration = SezzleConfiguration(publicKey: "qxorvmr7zbww7yw8vvhlxi8s3uko18q7", location: .US, environment: .PRODUCTION)
        
        let address = SezzleAddress(name: "Charlie Sarano", streetAddress: "1834 Ulysses St NE", city: "Minneapolis", state: "MN", postalCode: "55418", countryCode: "US", phoneNumber: "5072617662")
        let customer = SezzleCustomer(tokenize: true, email: "charlie.enriquez-sarano@sezzle.com", firstName: "Charlie", lastName: "Sarano", phone: "5072617662", dob: "1995-02-01", billingAddress: address, shippingAddress: address)
        
        let price = SezzlePrice(amountInCents: 1000, currency: "USD")
        let item = SezzleItem(name: "widget", sku: "sku123456", quantity: 1, price: price)
        let order = SezzleOrder(intent: "CAPTURE", referenceId: "ord_charlie_1", description: "sezzle-store - #12749253509255", orderAmount: price, items: [item], discounts: [], shippingAmount: price, taxAmount: price, checkoutExpiration: "2021-04-23T16:13:44Z")
         
        
        let checkoutVC = SezzleCheckoutViewController(customer: customer, order: order, delegate: self, configuration: configuration)
        
        self.present(checkoutVC, animated: true, completion: nil)
    }
    
    @IBAction func showPromotionalContent(_ sender: Any) {
        let promotionalVC = SezzlePromotionalViewController(language: "en", version: "2.0.0")
        self.present(promotionalVC, animated: true)
    }
    
    func completedCheckoutWithToken(token: String) {
        
    }
    
    func checkoutCancelled() {
        
    }
    
    func checkoutCancelledWithReason(reasonCode: String) {
        
    }
    
    func checkoutFailedWithError(error: Error) {
        
    }

}

