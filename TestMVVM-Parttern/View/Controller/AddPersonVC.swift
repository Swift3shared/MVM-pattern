//
//  AddPersonVC.swift
//  TestMVVM-Parttern
//
//  Created by sok channy on 12/11/16.
//  Copyright © 2016 channy-origin. All rights reserved.
//

import UIKit

class AddPersonVC: UIViewController {

    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var model : AddPersonViewModel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        model = AddPersonViewModel(PersonContext.shared)
        model.attachToDelegate(self)
    }
    
    @IBAction func donePress(_ sender: Any) {
        model.name = nameTextField.text!
        model.sex = sexTextField.text!
        model.age = ageTextField.text!
        model.handleDonePressed()
    }
}

extension AddPersonVC:AddPersonViewModelDelegate{
    func dissmissAddPerson() {
        //self.dismiss(animated: true, completion: nil)
        _=navigationController?.popViewController(animated: true)
    }
    
    func sohwInvalidName() {
        let alertController = UIAlertController(title: "Erro", message: "Invalid, must be first name and last name", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        nameTextField.becomeFirstResponder()
    }
    
    func showInvalidAge() {
        let alertController = UIAlertController(title: "Erro", message: "Invalid age, must be between 0 to 100", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        ageTextField.becomeFirstResponder()
    }
    
    func showInvalidSex() {
        let alertController = UIAlertController(title: "Erro", message: "Invalid sex, must be male or female", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        sexTextField.becomeFirstResponder()
    }
}
