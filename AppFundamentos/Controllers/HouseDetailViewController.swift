//
//  HouseDetailViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    // Mark: Outlets
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Mark: Properties
    
    //el model del HouseDetailViewController necesita mostrar una casa, luego:
    
    let model: House
    
    // Mark: - Initialization
    
    init(model: House) {
        //limpio mi propio desorden, es decir, inicializado mi propiedad de la clase hija
        self.model = model
        //llamo al super init
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
         title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Mark: - Life Cycle
    
    //una vez que se han terminado de cargar todas las vistas quiero sincronizar el modelo con las vistas
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
         syncModelWithView()
    }
    

 
    // Mark: - Sync
    func syncModelWithView() {
        //Sincronizamos el modelo con la vista
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = "\(model.words.words)"
       
    }
    
    // Mark: - UI
    func setupUI() {
        //Create Button
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target: self , action: #selector(displayWiki) )
        //Add button to view
        navigationItem.rightBarButtonItem = wikiButton
    }
    //Navegar desde HouseDetailController a WikiViewController
    //Estoy dentro de un HouseDetailVieWController empaquetado dentro de un
    //NavigationViewController
    
    @objc func displayWiki() {
        //Creamos el WikiVC
        let wikiViewController = WikiViewController(model: model)
        //Hacemos push
        navigationController?.pushViewController(wikiViewController, animated: true)
        
    }
    

}
