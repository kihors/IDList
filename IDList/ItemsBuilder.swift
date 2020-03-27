//
//  ItemsBuilder.swift
//  IDList
//
//  Created by Ihor Kostiv on 25.03.2020.
//  Copyright © 2020 Ihor Kostiv. All rights reserved.
//

import UIKit

class ItemsBuilder<T: Decodable> {
    private let data: Data
    
    init?(fileName: String) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return nil }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil }
        self.data = data
        
    }
    
    func build() throws -> [T] {
        do {
            return try JSONDecoder().decode([T].self, from: data)
        } catch {
            return []
        }
    }
}

