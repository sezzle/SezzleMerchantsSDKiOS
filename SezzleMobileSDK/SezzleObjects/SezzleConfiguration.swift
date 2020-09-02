//
//  SezzleConfiguration.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 9/2/20.
//

import Foundation

public class SezzleConfiguration {
    
    var publicKey: String // your public key from your merchant Dashboard
    var location: String // the geographical location, either the US or Canada
    var environment: String // this is the production environment, it can point to the sandbox for testing, or to the production environment
    
    public init(publicKey: String, location: Constants.Static.Locations, environment: Constants.Static.Environments) {
        self.publicKey = publicKey
        self.location = location.rawValue
        self.environment = environment.rawValue
    }
}
