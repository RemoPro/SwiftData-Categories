//
//  Item.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//


import SwiftUI
import SwiftData

@Model
final class Item {
    var id: UUID
    var name: String
    var category: Category?
    
    init(
        id: UUID = UUID(),
        name: String = "",
        category: Category?
    ) {
        self.id = id
        self.name = name
        self.category = category
    }
}
