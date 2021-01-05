# SezzleMerchantsSDKiOS
A Sezzle SDK for ios apps

## Installation

Add the SDK to your project via [Cocoapods](https://cocoapods.org/):
```
pod 'SezzleMobileSDK', '~> 1.2'
```
Add the SDK to your project via [Carthage](https://github.com/Carthage/Carthage):
```
github "sezzle/SezzleMerchantsSDKiOS" ~> 1.2
```
Or drag the source files under the SezzleMobileSDK into your project.

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

### Checkout Version

Our checkout SDK uses version 2 of the Sezzle checkout referenced in the [Sezzle docs](https://docs.sezzle.com/#introduction). After testing compatibility with our previous version, we have confirmed that the CAPTURE flow is not compatible across version numbers. To use the CAPTURE flow, please be sure your backend is using v2 of the checkout system as well. 

### Checkout Delegate

The checkout viewController requires a delegate be passed to its initializer. There are four functions required in the delegate protocol:

```
func completedCheckoutWithToken(token: String)
    
func checkoutCancelled()
    
func checkoutCancelledWithReason(reasonCode: String)
    
func checkoutFailedWithError(error: Error)
```

The functions will be called after the view controller has been dismissed, and the user has returned to your app. 

In both the AUTH and CAPTURE flow, the completedCheckout function will be called and return the token that was used for capture, and that will be used for capture.

All other function refer to failed checkouts, with the first checkoutCancelled referring to a user closing out the SezzleCheckout before the process could be finished, and the latter two referring to issues with displaying the SezzleCheckout. A checkout will fail when the app cannot complete the URLSession task to get the url necessary for making the checkout, or be cancelled when the response to the task isn't in the 200 range. 

## Promotion

To promote the use of Sezzle, and explain the core concept of Buy Now Pay Later, we provide the SezzlePromotionalViewController, which can be initialized with the version of the modal you would like to use, and the language you would like to use. Currently, two languages are available, English and French. For reference of what modal versions are available, please refer to the [Sezzle Modal repository](https://github.com/sezzle/sezzle-js). The initliazation of the promotional view controller is as follows:

```
let promotionalVC = SezzlePromotionalViewController(language: .English, version: "2.0.0")
```

In addition to the SezzlePromotionalViewController, we also provide the PromotionalView, which can be initialized programmatically with the following code:
```
let promotionalView = PromotionalView(frame: CGRect(x: 0, y: 0, width: width, height: height), viewController: self, amount: 10.0, language: .English, modalVersion: "2.0.0")
```
This view will initialize a PromotionalViewController and present it to the ViewController that was passed to the view when the view is pressed. Currently, as it is with the PromotionalViewController, the PromotionalView supports two languages, English and French. In addition to the parameters that are displayed above, the user can also set the font they wish to use to display the promotional messaging and the fontColor. By default, these will be set to the system default and Sezzle's default color for text respectively. Set to true by default, the optional shadow parameter refers to a shadow placed around the view itself, as well as a corner radius that is applied to the view. If you wish to handle these yourself, pass a false value, and these additions will not be made. 

