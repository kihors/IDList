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

class StudentsContainer {
    
}
