//
//  AboutViewController.swift
//  horoscope
//
//  Created by Александр Панин on 07.01.2022.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var signImage: UIImageView!
    @IBOutlet weak var shortLabel: UILabel!
    @IBOutlet weak var fullLabel: UILabel!
    
    var signModel: SignModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "О знаке"
        navigationItem.hidesBackButton = true
        
        signImage.layer.cornerRadius = 64
        signImage.image = UIImage(named: signModel.signImg)
        
        shortLabel.text = signModel.shortDescription
        fullLabel.text = signModel.longDescription
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreVC = segue.destination as? MoreViewController else {return}
        moreVC.signModel = signModel
    }
}

