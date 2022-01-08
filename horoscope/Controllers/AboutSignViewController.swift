//
//  AboutSignViewController.swift
//  horoscope
//
//  Created by Александр Панин on 08.01.2022.
//

import UIKit

class AboutSignViewController: UIViewController {
    
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var shortLabel: UILabel!
    @IBOutlet weak var fullLabel: UILabel!
    
    var signModel: SignModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "О знаке"
        navigationItem.hidesBackButton = true
        
        signImageView.layer.cornerRadius = 64
        signImageView.image = UIImage(named: signModel.signImg)
        
        shortLabel.text = signModel.shortDescription
        fullLabel.text = signModel.longDescription
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let moreSignVC = segue.destination as? MoreSignViewController else { return }
        moreSignVC.signModel = signModel
    }
}
