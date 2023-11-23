//
//  TabBar.swift
//  SimpsonProject
//
//  Created by macbook pro on 23.11.2023.
//

import UIKit

class TabBar: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let tabBarController = UITabBarController()
        
       let firstVC = CharacterVC()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let secondVC = EpisodeVC()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let thirdVC = ProductVC()
        thirdVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        tabBarController.viewControllers = [firstVC,secondVC,thirdVC]
        
        addChild(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.didMove(toParent: self)
    }
    

    

}
