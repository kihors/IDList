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
    @IBOutlet weak var averageAgeLabel: UILabel!
    
    func newStudent(student: Student) {
        students.append(student)
        tableView.reloadData()
        
        averageAgeLabel.text = String(format: "%.2f", √students)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? StudentAddViewController {
            viewController.delegate = self
        }
    }
    
    

}

prefix operator √
prefix func √(students: [Student]) -> Double {
    let averageAge = students.reduce(0) { $0 + $1.age }
    return Double(averageAge) / Double(students.count)
}

