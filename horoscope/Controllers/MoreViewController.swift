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
        signImage.alpha = 0.3
        
        forecastLabel.text = signModel.titleForecast
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
