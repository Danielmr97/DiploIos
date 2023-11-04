//
//  TabbarViewController.swift
//  TabbarControllerProgramatic
//
//  Created by Daniel Mayo on 03/11/23.
//

import UIKit

class TabbarViewController: UITabBarController {
    
    //Paso 1 borrar todos los main expto @main
    //Paso 2 Ir al SCENEDelagte poner el
    //      guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let firstView = FirstViewController()
    let seconView = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([firstView,seconView], animated: false)
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .blue

    }
    
}
