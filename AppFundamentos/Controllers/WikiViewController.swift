//
//  WikiViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 20/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit
import WebKit
class WikiViewController: UIViewController {

    // Mark: - Outlets
      @IBOutlet weak var webView: WKWebView!
    
    // Mark: - Properties
    let model: House
    // Mark: - Inicialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
 
    // Mark: - Sync
    func syncModelWithView() {
        title =  model.name
        webView.load(URLRequest(url: model.wikiURL))
    }


}
