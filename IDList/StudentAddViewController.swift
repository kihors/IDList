//
//  StudentAddViewController.swift
//  IDList
//
//  Created by Ihor Kostiv on 04.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

class StudentAddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func genderChoice(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
    }
}

