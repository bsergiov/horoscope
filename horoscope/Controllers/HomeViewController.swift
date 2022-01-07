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
    
    var datePerson: String = ""
    var signModel: SignModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Введите \n День и Месяц рождения:"
        
        dayTextField.delegate = self
        monthTextField.delegate = self
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutVC = segue.destination as? AboutViewController else {return}
        aboutVC.signModel = signModel
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        datePerson = String(monthTextField.text ?? "01") + String(dayTextField.text ?? "01")
        signModel = PersonModel.getPersonModel(from: datePerson)
//        dayTextField.text = ""
//        monthTextField.text = ""
    }
}

   
extension HomeViewController {
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newDate = textField.text else { return }
        guard let date = Int(newDate) else {
            showAlert(title: "Please", message: "Enter integer numbers of days or months", field: textField)
            return
        }
        if date == 0 || date > 31 { showAlert(title: "Please", message: "2-Enter an integer numbers of days or months", field: textField)
            return
        }
        switch textField {
        case monthTextField:
            if date <= 12 {
                datePerson = String(date)
            } else {
                showAlert(title: "Please", message: "3-Enter integer numbers of Month (1...12)", field: textField)
                return
            }
        default:
            guard let month = Int(datePerson) else {
                showAlert(title: "Please", message: "4-Enter an integer number of Months first", field: textField)
                return
            }
            switch month {
            case 2:
                if date > 28 {
                    showAlert(title: "Please", message: "5-Enter integer numbers of Days (1...28)", field: textField)
                    return
                }
                datePerson += String(date)
            case 4, 6, 9, 11:
                if date > 30 {
                    showAlert(title: "Please", message: "6-Enter integer numbers of Days (1...30)", field: textField)
                    return
                }
                datePerson += String(date)
            default:
                datePerson += String(date)
            }
        }
    }
}
