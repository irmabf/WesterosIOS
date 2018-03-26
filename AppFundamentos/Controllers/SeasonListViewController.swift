//
//  SeasonListViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 25/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

let SEASON_KEY = "SeasonKey"
let SEASON_DID_CHANGE_NOTIFICATION_NAME = "SeasonDidChange"

protocol SeasonListViewControllerDelegate {
    //should, will, did
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season)
}

final class SeasonListViewController: UITableViewController {
    
    // Mark: - Properties
    let model: [Season]
    var delegate: SeasonListViewControllerDelegate?
    
    // Mark: - Inicialization
    init(model: [Season]) {
        self.model = model
        super.init(style: .plain)
        title = "Game Of Thrones Seasons"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "SeasonCell"
        // Descubrir cual es la temporada que hay que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        }
        
        // Sincronizar season con cell
        cell?.textLabel?.text = season.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: season.releaseDate)
        cell?.detailTextLabel?.text = "Air date: \(date)"
        
        return cell!
    }
    
    // Mark: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let season = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.seasonListViewController(self, didSelectSeason: season)
        
        // Enviamos la misma información vía notificaciones
        let notificationCenter = NotificationCenter.default
        let notification = Notification(name: Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME), object: self, userInfo: [SEASON_KEY: season])
        notificationCenter.post(notification)
    }
    
}

extension SeasonListViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        let seasonDetailViewController = SeasonDetailViewController(model: season)
        navigationController?.pushViewController(seasonDetailViewController, animated: true)
    }
}
