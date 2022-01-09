//
//  MoreSignViewController.swift
//  horoscope
//
//  Created by Александр Панин on 08.01.2022.
//

import UIKit

class MoreSignViewController: UIViewController {
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var forecastLabel: UILabel!
    
    var signModel: SignModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = signModel.sign
        
        signImageView.image = UIImage(named: signModel.signImg)
        signImageView.alpha = 0.2
        
        forecastLabel.text = signModel.titleForecast
    }
}
