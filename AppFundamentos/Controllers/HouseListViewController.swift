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
let LAST_HOUSE = "LAST_HOUSE"

import UIKit


protocol HouseListViewControllerDelegate: class {
    // Should, will, did
    func houselistViewController(_ vc: HouseListViewController, didSelectHouse: House)
}


class HouseListViewController: UITableViewController {
    
    // Mark: - Properties
    var model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    // Mark: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
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
        
        let cellID = "HouseCell"
        // Descubrir cual es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Sincronizar house -> cell
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // Mark: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguamos la casa
        let house = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.houselistViewController(self, didSelectHouse: house)
        
        // Enviamos la misma información vía notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [HOUSE_KEY: house])
        notificationCenter.post(notification)
        
        // Guardamos la última casa seleccionada
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController: HouseListViewControllerDelegate {
    func houselistViewController(_ vc: HouseListViewController, didSelectHouse house: House) {
        let houseDetailViewController = HouseDetailViewController(model: house)
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    }
}

// Mark: - User Defaults
extension HouseListViewController {
    
    func saveLastSelectedHouse(at row: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(row, forKey: LAST_HOUSE)
        userDefaults.synchronize() //
    }
    
    func lastSelectedHouse() -> House{
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        return house(at: row)
    }
    
    func house(at index: Int) -> House{
        let house = model[index]
        return house
    }
}













