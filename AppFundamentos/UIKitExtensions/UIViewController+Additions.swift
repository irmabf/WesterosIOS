//
//  UIViewController+Additions.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 08/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
