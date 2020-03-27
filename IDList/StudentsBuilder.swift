//
//  StudentsBuilder.swift
//  IDList
//
//  Created by Ihor Kostiv on 26.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

class StudentsBuilder: ItemsBuilder<Student> {
    convenience init?() {
        self.init(fileName: "students")
    }
}

