//
//  PromotionalView.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 9/1/20.
//

import Foundation
import UIKit

@IBDesignable public class PromotionalView: UIView {
    var view: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        xibSetup()
    }
    
    func xibSetup() {
        view = loadViewFromNib()

        // use bounds not frame or it'll be offset
        view.frame = bounds

        // Make the view stretch with containing view
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sezzleTapped(gesture:)))
        self.addGestureRecognizer(tapGesture)
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        
        let bundleIdentifer = "com.framework.SezzleMobileSDK"
        let bundle = Bundle(for: PromotionalView.self)
        print("Bundle is \(bundle)")
        //let bundle2 = Bundle(identifier: bundleIdentifer)
        
       // let view2 = bundle2!.loadNibNamed("PromotionalView", owner: self, options: nil)?[0] as! UIView
        let nib = UINib(nibName: "PromotionalView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView

        return view
    }
    
    @objc func sezzleTapped(gesture: UITapGestureRecognizer) {
        // create promotional view, and then present to the view controller that owns the view
        print("we tapped the promotional view")
        
    }
}
