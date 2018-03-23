//
//  HouseListViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 20/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

let HOUSE_KEY = "HouseKey"
let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"

protocol HouseListViewControllerDelegate {
    //should, will, did
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    
    // Mark: - Properties
    let model: [House]
    var delegate: HouseListViewControllerDelegate?
    
    // Mark: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "HouseCell"
        
        //Descubrir cual es la casa que tenemos que mostrar
        let house  = model[indexPath.row]
        
        //Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        //Sincronizar house (model) con cell /Vista
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // Mark: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Averiguar que casa han pulsado
        let house = model[indexPath.row]
        
        //Avisamos al delegado
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        //Mando la misma info a través de notificaciones
    let notificationCenter = NotificationCenter.default
    let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        
    notificationCenter.post(notification)
        
    }
}
