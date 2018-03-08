//
//  AppDelegate.swift
//  AppFundamentos
//
//  Created by Irma Blanco on 07/03/2018.
//  Copyright © 2018 Irma Blanco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
      
        window?.makeKeyAndVisible()
        
        //Creamos unos modelos
        
        let starkWords = Words(words: "Winter is coming")
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Grey Direwolf")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: starkWords)
        
        let lannisterWords = Words(words: "Hear me roar")
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: lannisterWords)
        
       
        //Creamos los controladores
        
        let starkHouseViewController = HouseDetailViewController(model: starkHouse)
        let lannisterHouseViewController = HouseDetailViewController(model: lannisterHouse)
    
        
        //Creamos los navigations
        
        //let starkNavigationController = starkHouseViewController.wrappedInNavigation()
        //let lannisterNavigationController = lannisterHouseViewController.wrappedInNavigation()
        
        /*
         Creamos los combinadores
         1. Usaremos como combinador un stack de UINavigationControllers dentro de un TabBar
         2. El UINavigation controller se crea con
         let starkNavigationController = UINavigationController(rootViewController: elrootcontrollerRaiz)
         3. Asignamos a nuestra window como raiz el tabBarViewController
         4. Creo un starkNavigationController y lo meto dentro del Tabbar para dar un estilo como el de la aplicacion de las alarmas y el reloj
         */
        
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [
            starkHouseViewController.wrappedInNavigation(),
            lannisterHouseViewController.wrappedInNavigation()
        ]
        
    
        
        /*let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [
            starkHouseViewController,
            lannisterHouseViewController]*/
        
        //Asignamos el  combinador al rootvc
        window?.rootViewController = tabBarViewController
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

