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
        
//        nameTextField.delegate = self
//        ageTextField.delegate = self
//        saveButton.isEnabled = false
        validate()
    }
    
    @IBAction func onNameChanged(_ sender: UITextField) {
        validate()
    }
    
    @IBAction func onAgeChanged(_ sender: UITextField) {
        validate()
    }
    
    private func validate() {
        let name = nameTextField.text ?? ""
        let age  = ageTextField.text ?? ""
        
        saveButton.isEnabled = !name.isEmpty && !age.isEmpty
        saveButton.alpha = saveButton.isEnabled ? 1.0 : 0.5
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

