//
//  Student.swift
//  IDList
//
//  Created by Ihor Kostiv on 11.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import Foundation

struct Student: Equatable, Decodable {
    let name: String
    let age: Int
    let gender: Gender
    
}

enum Gender: String, Decodable {
    case male
    case female
}

