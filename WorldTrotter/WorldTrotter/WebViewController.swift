//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Derek Yu on 2/16/16.
//  Copyright © 2016 nyu.edu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController:UIViewController{
    var webview:WKWebView!
    
    override func loadView() {
        view = webview
        webview = WKWebView.init()
        let url = NSURL(string:"https://www.bignerdranch.com")
        
        webview.loadRequest(NSURLRequest(URL:url!))
        
    }
    
    
    
    
}