//
//  HomeViewController.swift
//  horoscope
//
//  Created by Александр Панин on 06.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    
    var datePerson: Int = 0
    var signModel: SignModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Введите\nДень и Месяц рождения:"
        
        dayTextField.delegate = self
        monthTextField.delegate = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutVC = segue.destination as? AboutViewController else {return}
        aboutVC.signModel = signModel
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {}
    
    @IBAction func doneButton(_ sender: UIButton) {
        if chekDate() { signModel = PersonModel.getPersonModel(from: datePerson) } else { return }
        dayTextField.text = ""
        monthTextField.text = ""
    }
}


extension HomeViewController {
    
    private func chekDate() -> Bool {
        guard let chekDay = dayTextField.text else { return falseChek(dayTextField) }
        guard let day = Int(chekDay) else { return falseChek(dayTextField)}
        guard let chekMonth = monthTextField.text else { return falseChek(monthTextField) }
        guard let month = Int(chekMonth) else { return falseChek(monthTextField) }
        
        switch month {
        case 2:
            if day > 0 && day <= 28 { datePerson = month * 100 + day } else { return falseChek(dayTextField) }
        case 4, 6, 9, 11:
            if day > 0 && day <= 30 { datePerson = month * 100 + day } else { return falseChek(dayTextField) }
        case 1, 3, 5, 7, 8, 10, 12:
            if day > 0 && day <= 31 { datePerson = month * 100 + day } else { return falseChek(dayTextField) }
        default:
            return falseChek(monthTextField)
        }
        return true
    }
    
    private func falseChek(_ textField: UITextField) -> Bool {
        showAlert(title: "Please", message: "Enter correct number of Months or Days", field: textField)
        return false
    }
    
    // MARK: - Alert controller
    
    private func showAlert(title: String, message: String, field: UITextField ) {
        let alertView = UIAlertController (title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in field.text = "" }
        
        alertView.addAction(okAction)
        self.present(alertView, animated: true)
    }
}

// MARK: - Text controller

extension HomeViewController:  UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case monthTextField:
            dayTextField.becomeFirstResponder()
        default:
            monthTextField.becomeFirstResponder()
        }
        return true
    }
}
