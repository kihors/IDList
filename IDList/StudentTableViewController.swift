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
    @IBOutlet weak var searchByName: UISearchBar!
    
    func newStudent(student: Student) {
        allStudents.append(student)
        refresh()
        
        averageAgeLabel.text = String(format: "%.2f", √students)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var students = [Student]()
    var allStudents = [Student]()
    
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
    
    func refresh() {
        students = allStudents.filter { $0.name.starts(with: searchByName.text ?? "") }.sorted { $0.name < $1.name }
        tableView.reloadData()
    }
    
}

prefix operator √
prefix func √(students: [Student]) -> Double {
    let averageAge = students.reduce(0) { $0 + $1.age }
    return Double(averageAge) / Double(students.count)
}

extension StudentTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        refresh()
    }
    
}

