//
//  WebsiteViewController.swift
//  BfastBowlBldr
//
//  Created by James Slusser on 9/15/17.
//  Copyright © 2017 James Slusser. All rights reserved.
//

import UIKit
import WebKit

class WebsiteViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    var webSite: String?
    var spinner: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: spinner)
        webView.navigationDelegate = self
        if let address = webSite {
            let webURL = URL(string: address)
            let urlRequest = URLRequest(url: webURL!)
            webView.load(urlRequest)
        }
    }
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
