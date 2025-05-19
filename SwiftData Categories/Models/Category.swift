//
//  Category.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//


import Foundation
import SwiftData

@Model
class Category {
    var id: UUID = UUID()
    var name: String = ""
    var icon: String = "folder"
    var items: [Item]?
    
    init(
        id: UUID = UUID(),
        name: String = "",
        icon: String = "folder", // Default icon
        items: [Item]? = []
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.items = items
    }
}
