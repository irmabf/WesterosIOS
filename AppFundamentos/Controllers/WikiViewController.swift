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
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // Mark: - Properties
    var model: House
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
        loadingView.isHidden = false
        loadingView.startAnimating()
        webView.navigationDelegate = self
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
       
    }
 
    // Mark: - Sync
    func syncModelWithView() {
        title =  model.name
        webView.load(URLRequest(url: model.wikiURL))
    }
    
    // Mark: - Notifications
    @objc func houseDidChange(notification: Notification) {
        //Extraer el user info de la notificacion
        guard let info = notification.userInfo else {
            return
        }
        //Sacar la casa del userInfo
        let house = info[HOUSE_KEY] as? House
        //Actualizar el modelo
        model = house!
            
        //Sincronizar la vista
        syncModelWithView()
        
    }

}
//Navigation delegate extension
extension WikiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingView.stopAnimating()
        loadingView.isHidden = true
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        //Necesitamos saber el tipo de navigationaction
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
            
        }
    }
    
}




















