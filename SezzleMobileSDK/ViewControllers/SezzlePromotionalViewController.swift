//
//  SezzlePromotionalViewController.swift
//  SezzleMobileSDK
//
//  Created by Charlie Sarano on 8/27/20.
//

import Foundation
import UIKit
import WebKit

public class SezzlePromotionalViewController: SezzleBaseViewController {
    
    
    private var language: String
    private var version: String
    
    public init(language: Constants.Static.Languages, version: String) {
        self.language = language.rawValue
        self.version = version
        super.init(nibName: nil, bundle: nil)
        self.webView?.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
        self.modalPresentationStyle = .currentContext
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var htmlBody =
        """
        <html>
            <body>
                <script>
                    var modalNode = document.createElement('div');
                    var httpRequest = new XMLHttpRequest();
                    httpRequest.onreadystatechange = function () {
                      if (httpRequest.readyState === XMLHttpRequest.DONE || httpRequest.readyState === 4) {
                        if (httpRequest.status === 200) {
                          // append the html to the modal node
                          modalNode.innerHTML = httpRequest.response;
                          document.getElementsByTagName('html')[0].appendChild(modalNode);
                          Array.prototype.forEach.call(document.getElementsByClassName('close-sezzle-modal'), (el) => {
                            el.addEventListener('click', () => {
                              window.location.href = "{{CANCEL_URL}}"
                            });
                          });
                        }
                        else {
                          return console.warn("Can't load the modal because the link provided is not found");
                        }
                      }
                    }.bind(this);
                    var url = 'https://media.sezzle.com/shopify-app/assets/sezzle-modal-{{MODAL_VERSION}}-{{LANGUAGE}}.html';
                    httpRequest.open('GET', url, true);
                    httpRequest.send();
                </script>
            </body>
        </html>
        """
        
        
        htmlBody = htmlBody.replacingOccurrences(of: "{{MODAL_VERSION}}", with: self.version)
        htmlBody = htmlBody.replacingOccurrences(of: "{{LANGUAGE}}", with: self.language)
        htmlBody = htmlBody.replacingOccurrences(of: "{{CANCEL_URL}}", with: Constants.Static.SEZZLE_CHECKOUT_CANCELLATION_URL)
        
        self.webView?.loadHTMLString(htmlBody, baseURL: Bundle.main.bundleURL)
        
    }
    
    
    required init?(coder: NSCoder) {
        self.language = ""
        self.version = ""
        super.init(coder: coder)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let newURLString = navigationAction.request.url?.absoluteString
        
        if (newURLString == Constants.Static.SEZZLE_CHECKOUT_CANCELLATION_URL) {
            decisionHandler(.cancel)
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        decisionHandler(.allow)
    }
    
}
