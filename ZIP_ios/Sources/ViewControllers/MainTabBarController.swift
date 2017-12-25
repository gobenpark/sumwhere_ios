//
//  MainTabBarController.swift
//  ZIP_ios
//
//  Created by park bumwoo on 2017. 11. 4..
//  Copyright © 2017년 park bumwoo. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController{
  
  let mainViewController: UINavigationController = {
    let naviVC = UINavigationController(rootViewController: MainViewController())
    let tabBar = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "icons8-prop_plane"), tag: 0)
    tabBar.imageInsets = UIEdgeInsets(top: 8, left: 0, bottom: -8, right: 0)
    naviVC.tabBarItem = tabBar
    return naviVC
  }()
  
  let writerViewController: UINavigationController = {
    let naviVC = UINavigationController(rootViewController: PlanViewController())
    let tabBar = UITabBarItem(title: "계획", image: #imageLiteral(resourceName: "edit_icon"), tag: 0)
    naviVC.navigationBar.prefersLargeTitles = true
    naviVC.navigationItem.largeTitleDisplayMode = .automatic
    naviVC.tabBarItem = tabBar
    return naviVC
  }()
  
  let chatNVViewController: UINavigationController = {
    let naviVC = UINavigationController(rootViewController: ChatViewController())
    let tabBar = UITabBarItem(title: "수다", image: #imageLiteral(resourceName: "chats_icon"), tag: 0)
    naviVC.navigationBar.prefersLargeTitles = true
    naviVC.navigationItem.largeTitleDisplayMode = .always
    naviVC.tabBarItem = tabBar
    return naviVC
  }()
  
  let settingViewController: UINavigationController = {
    let naviVC = UINavigationController(rootViewController: ConfigureViewController())
    let tabBar = UITabBarItem(title: "설정", image: #imageLiteral(resourceName: "profile_icon"), tag: 0)
    naviVC.navigationBar.prefersLargeTitles = true
    naviVC.navigationItem.largeTitleDisplayMode = .always
    naviVC.tabBarItem = tabBar
    return naviVC
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.viewControllers = [
     mainViewController, writerViewController
      , chatNVViewController, settingViewController
    ]
  }
}
