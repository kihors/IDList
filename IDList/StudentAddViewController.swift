//
//  StudentAddViewController.swift
//  IDList
//
//  Created by Ihor Kostiv on 04.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

protocol StudentAddViewControllerDelegate: class {
    
    func newStudent(student: Student)
    
}

class StudentAddViewController: UIViewController, UITextFieldDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var saveButton: UIButton!
    
    
    weak var delegate: StudentAddViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        ageTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let name = nameTextField.text, !name.isEmpty {
            if let age = ageTextField.text, !age.isEmpty {
                saveButton.isEnabled = true
            } else {
                saveButton.isEnabled = false
            }
        } else {
            saveButton.isEnabled = false
        }
        return true
    }
    
    
    //MARK: Action
    @IBAction func saveButton(_ sender: UIButton) {
        
        guard let name = nameTextField.text else { return }
        guard let age = Int(ageTextField.text!) else { return }
        let gender = genderSegmentedControl.selectedSegmentIndex == 0 ? Gender.male : Gender.female

        let student = Student(name: name, age: age, gender: gender)
        delegate?.newStudent(student: student)
        navigationController?.popViewController(animated: true)
    }
}

