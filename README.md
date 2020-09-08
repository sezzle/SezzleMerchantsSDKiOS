# SezzleMerchantsSDKiOS
A Sezzle SDK for ios apps

## Installation

Add the SDK to your project via cocoapods:
```
pod 'SezzleMobileSDK', '~> 1.0'
```

## Usage

To access the Sezzle's checkout, you'll need to use your public key from your Merchant Dashboard.

Use the Sezzle Configuration object to pass your public key, what environment you like to use in your development, and what region your app is in for its checkout process. Currently, only Canada and the United States are supported. 

```
let configuration = SezzleConfiguration(publicKey: "your public key", location: .US, environment: .PRODUCTION)
```

Initalize a SezzleCheckoutViewController with the following parameters to start a checkout:

```
let checkoutVC = SezzleCheckoutViewController(customer: customer, order: order, delegate: self, configuration: configuration)
```

The SezzleOrder object will accept two types of intent for the checkout, "CAPTURE" or "AUTH", mirroring the existing checkout for Sezzle's web product. We recommend using the "AUTH" capture flow, as the "CAPTURE" flow may become deprecated for security purposes in the future.

Present this view controller with a delegate to show the customer the Sezzle Webview which will finalize their checkout. When a checkout is complete, whether successfully or not, a delegate function will be called to indicate the results of the attempted checkout. When the checkout is successful, use the token passed back to complete the order from your backend.

## Promotion

To promote the use of Sezzle, and explain the core concept of Buy Now Pay Later, we provide the SezzlePromotionalViewController, which can be initialized with the version of the modal you would like to use, and the language you would like to use. Currently, two languages are available, English and French. For reference of what modal versions are available, please refer to the Sezzle Modal repository. The initliazation of the promotional view controller is as follows:

```
let promotionalVC = SezzlePromotionalViewController(language: "en", version: "2.0.0")
```

