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
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        guard let myViewControlers = tabBarController?.viewControllers else { return }
        for controler in myViewControlers {
            if let navigationVC = controler as? UINavigationController {
                let allSignsVC = navigationVC.topViewController as! AllSignsTableViewController
                allSignsVC.signsModel = signs
            }
        }
    }
}
//
//
//        guard let homeVC = viewControllers?.first as? HomeViewController else { return }
//        guard let sectionVC = viewControllers?.last as? SectionTableViewController else { return }
//
//        contactListVC.persons = persons
//        sectionVC.persons = persons
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let tabBarController = segue.destination as? UITabBarController else {return}
//        guard let myViewControllers = tabBarController.viewControllers else {return}
//
//        for viewController in myViewControllers {
//            if let homeVC = viewController as? HomeViewController {
//                homeVC.signModel = sign
//            } else if let navigationVC = viewController as? UINavigationController {
//                let homeVC = navigationVC.topViewController as! HomeViewController
//                homeVC.signModel = sign
//            }
//        }
//    }
//}

//extension TabBarViewController: HomeViewControllerDelegate {
//    func setDate(_ date: String) -> SignModel {
//        let sign = SignModel.getSigns()[0]
//        return sign
//    }
//}
