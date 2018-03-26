//
//  SeasonDetailViewController.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 25/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {
    // Mark: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var episodesCountLabel: UILabel!
    
    // Mark: - Properties
    var model: Season
    
    // Mark: - Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: nil )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    func syncModelWithView() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        title = "Season"
        nameLabel.text = model.name
        let date = dateFormatter.string(from: model.releaseDate)
        releaseLabel.text = "Air date: \(date)"
        episodesCountLabel.text = "Number of Episodes: \(model.count)"
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        //ahora self.model es igual a la season que se ha seleccionado
        self.model = season
        syncModelWithView()
    }
    
}

