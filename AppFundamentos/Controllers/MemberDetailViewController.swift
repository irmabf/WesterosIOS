//
//  MemberDetailViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 24/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    // Mark: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var aliasLabel: UILabel!
    
    // Mark: - Properties
    private let model: Person
    
    // Mark: - Initialization
    init(model: Person) {
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
      navigationController?.popViewController(animated: true)
        
    }

    
    func syncModelWithView() {
        nameLabel.text = model.fullName
        aliasLabel.text = model.alias
        houseImageView.image = model.house.sigil.image
        title = model.name
    }

}
