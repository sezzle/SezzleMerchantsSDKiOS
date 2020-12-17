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
    @IBOutlet weak var promotionalContiner: UIView!
    

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
        let promotionalView = PromotionalView(frame: CGRect(x: 0, y: 0, width: promotionalContiner.bounds.width, height: promotionalContiner.bounds.height), viewController: self, amount: 10.0, language: .French, shadow: true)
        promotionalView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        promotionalContiner.addSubview(promotionalView)
        
    }
    
    func showPromotionalContent() {
        
    }
    
    @IBAction func startCheckout(_ sender: Any) {
        let configuration = SezzleConfiguration(publicKey: "sz_pub_t5iAKWJEFv9ZBV1F4fc7e6Hs7nPssL32", location: .US, environment: .SANDBOX)
        
        let address = SezzleAddress(name: "Charlie Sarano", streetAddress: "1834 Ulysses St NE", city: "Minneapolis", state: "MN", postalCode: "55418", countryCode: "US", phoneNumber: "5072617662")
        let customer = SezzleCustomer(tokenize: true, email: "charlie.enriquez-sarano@sezzle.com", firstName: "Charlie", lastName: "Sarano", phone: "5072617662", dob: "", billingAddress: address, shippingAddress: address)
        

        
        let price = SezzlePrice(amountInCents: 2711, currency: "USD")
        let itemPrice = SezzlePrice(amountInCents: 2499, currency: "USD")
        let shippingPrice = SezzlePrice(amountInCents: 0, currency: "USD")
        let taxAmount = SezzlePrice(amountInCents: 212, currency: "USD")
        let item = SezzleItem(name: "Supernova Pro", sku: "KB188LBWC", quantity: 1, price: itemPrice)
        let order = SezzleOrder(intent: "CAPTURE", referenceId: "O5240000787", description: "Touch of Modern Order", orderAmount: price, items: [item], discounts: [], shippingAmount: shippingPrice, taxAmount: taxAmount, checkoutExpiration: "2021-04-23T16:13:44Z")
         
        
        let checkoutVC = SezzleCheckoutViewController(customer: customer, order: order, delegate: self, configuration: configuration)
        
        self.present(checkoutVC, animated: true, completion: nil)
    }
    
    @IBAction func showPromotionalContent(_ sender: Any) {
        let promotionalVC = SezzlePromotionalViewController(language: .English, version: "2.0.0")
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

