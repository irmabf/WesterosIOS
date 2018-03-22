//
//  MemberListViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 20/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Properties
    let model: [Person]
    
    //Initialization
    
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Asignamos delegado
        tableView.delegate = self
        //Asignamos la fuente de datos
        tableView.dataSource = self
    }
}

// Mark: - UITableViewDataSource

extension MemberListViewController: UITableViewDataSource{
    //Requisites for protocol UITableViewDataSource -> numberOfRows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    //Requisites for protocol UITableViewDataSource -> cellForRowAt indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        //Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        //Preguntar por una celda (a un cache) o crearla
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        /*
         let cellId = "MemberCell"
        let person = model[indexPath.row]
         
         let cell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
         
         */
        
        //Sincronizar celda y persona
        cell?.textLabel?.text = person.fullName
        //Devolver la celda
        return cell!
        
    
    }
    
}
// Mark: - UITableViewDelegate
extension MemberListViewController: UITableViewDelegate {
    
}




























