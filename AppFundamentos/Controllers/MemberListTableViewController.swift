//
//  MemberListTableViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 24/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class MemberListTableViewController: UITableViewController {
    
    // Mark: - Properties
    var model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //Nos damos de alta en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(houseDidChange), name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func houseDidChange(notification: Notification) {
        //Sacar user info
        let info = notification.userInfo!
        //Sacar la casa
        let house = info[HOUSE_KEY] as? House
        //Actualizar el modelo
        model = (house?.sortedMembers)!
        //Sincronizar las vistas
        tableView.reloadData()
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "MemberCell"
        
        //Descubrir cual es el miembro de la casa que tenemos que mostrar
        
        let member = model[indexPath.row]
    
        //Crear una celda
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        //Sincronizar person (model) con cell Vista
        cell?.textLabel?.text = member.name
        
        return cell!
        
    }
    
    // Mark: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

  



   
}
