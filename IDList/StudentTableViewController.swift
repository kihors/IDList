//
//  StudentTableViewController.swift
//  IDList
//
//  Created by Ihor Kostiv on 16.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

class StudentTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StudentAddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    func newStudent(student: Student) {
        students.append(student)
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //loadSampleStudents()
    }
    
    var students = [Student]()

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cellIdentifier = "StudentTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StudentTableViewCell else {
            fatalError("The dequeued cell is not an instance of StudentTableViewCell.")
        }
        
        
        
        let student = students[indexPath.row]
        
        cell.nameLabel.text = student.name
        cell.ageLabel.text = String(student.age)
        cell.genderLabel.text = student.gender.rawValue

        return cell
    }
    

//    private func loadSampleStudents() {
//        let student1 = Student(name: "Ihor", age: 31, gender: .male)
//        let student2 = Student(name: "Daria", age: 26, gender: .female)
//        students += [student1, student2]
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? StudentAddViewController {
            viewController.delegate = self
        }
    }

}
