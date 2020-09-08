//
//  PromotionalView.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 9/1/20.
//

import Foundation
import UIKit

@IBDesignable public class PromotionalView: UIView {
    //var view: UIView!
    var viewController: UIViewController?
    var language: Constants.Static.Languages = .English
    var modalVersion: String = "2.0.0"
    
    public init(frame: CGRect, viewController: UIViewController, amount: Float, language: Constants.Static.Languages, modalVersion: String = "2.0.0", font: UIFont = UIFont.systemFont(ofSize: 15), shadow: Bool = true, fontColor: UIColor = Constants.Static.SEZZLE_TEXT_COLOR) {
        super.init(frame: frame)
        //xibSetup()
        
        // how do we want to set up our promotional view?
        // should it be text on top?
        // so - [ text ]
        //      [ logo ]
        
        // or -  [ text logo ] - my worry is that this view is too long for a lot of phones
        
        // lets do the first, and then present them
        self.viewController = viewController
        self.language = language
        self.modalVersion = modalVersion
        
        setupChildViews(font: font, fontColor: fontColor, amount: amount)
        if (shadow == true) {
            setupCornersAndShadow()
        }
        setupTapGesture()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        //xibSetup()
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sezzleTapped(gesture:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    func setupCornersAndShadow() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }
    
    func setupChildViews(font: UIFont, fontColor: UIColor, amount: Float) {
        // this will be the holder for the text
        let height = self.bounds.height - 16
        let width = self.bounds.width - 8
        
        var text = ""
        if (self.language == .English) {
            text = String(format: Constants.Static.PromotionalText.English.rawValue, amount / 4)
        } else if (language == .French) {
            text = String(format: Constants.Static.PromotionalText.French.rawValue, amount / 4)
        }
        
        let label = UILabel(frame: CGRect(x: 4, y: 4, width: width, height: height * 0.4))
        label.text = text
        
        // label.font = UIFont(name: "Comfortaa-Regular.ttf", size: 12)
        label.adjustsFontSizeToFitWidth = true
        label.font = font
        label.minimumScaleFactor = 0.5
        label.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        label.baselineAdjustment = .none
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.textColor = fontColor
        
        // this will be the imageView that holds the logo
        let image = UIImage(named: "sezzle-logo", in: Bundle(for: type(of: self)), compatibleWith: nil)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 4, y: 8 + height * 0.4, width: width, height: height * 0.6)
        imageView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(imageView)
        self.addSubview(label)
        
        self.autoresizesSubviews = true
        
        
    }
    
    @objc func sezzleTapped(gesture: UITapGestureRecognizer) {
        // create promotional view, and then present to the view controller that owns the view
        print("we tapped the promotional view")
        let promotionalViewController = SezzlePromotionalViewController(language: language, version: self.modalVersion)
        viewController?.present(promotionalViewController, animated: true, completion: nil)
        
    }
}
