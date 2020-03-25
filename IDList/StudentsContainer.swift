//
//  StudentsContainer.swift
//  IDList
//
//  Created by Ihor Kostiv on 11.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import Foundation

protocol Container {
    associatedtype Item: Decodable
    var numberOfItem: Int { get }
    subscript(index: Int) -> Item? { get }
    func item(at index: Int) throws -> Item
    mutating func append(_ item: Item)
    mutating func remove(_ item: Item)
}

enum StudentContainerEror: Error {
    case indexOutOfRange
}

class StudentsContainer: Container {
    
    typealias Item = Student
    
    private var students: [Student] = []
    
    var numberOfItem: Int {
        return students.count
    }
    
    subscript(index: Int) -> Student? {
        if index >= 0 && index <= numberOfItem - 1 {
            return students[index]
        }
        return nil
    }
    
    func item(at index: Int) throws -> Student {
        if index >= 0 && index <= numberOfItem - 1 {
            return students[index]
        }
        throw StudentContainerEror.indexOutOfRange
    }
    
    func append(_ item: Student) {
        students.append(item)
    }
    
    func remove(_ item: Student) {
        if let index = students.firstIndex(of: item) {
            students.remove(at: index)
        }
    }
    
    func filteredStudents(by name: String?) -> [Student] {
        if let value = name?.lowercased(), !value.isEmpty {
            return students.filter { $0.name.lowercased().contains(value) }.sorted { $0.name < $1.name }
        } else {
            return students
        }
    }
    
}
