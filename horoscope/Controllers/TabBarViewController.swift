//
//  TabBarViewController.swift
//  horoscope
//
//  Created by Александр Панин on 06.01.2022.
//

import UIKit

//protocol HomeViewControllerDelegate {
//    func setDate(_ date: String) -> SignModel
//}

class TabBarViewController: UITabBarController {
    
    let signs = SignModel.getSigns()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 //       setupViewControllers()
    }
}
