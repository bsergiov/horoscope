//
//  MoreViewController.swift
//  horoscope
//
//  Created by Александр Панин on 07.01.2022.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var forecastLabel: UILabel!
    
    var signModel: SignModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = signModel.sign

        signImage.image = UIImage(named: signModel.signImg)
        signImage.alpha = 0.2
        
        forecastLabel.text = signModel.titleForecast
    }
}
