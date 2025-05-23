//
//  SwiftData_CategoriesApp.swift
//  SwiftData Categories
//
//  Created by Remo Prozzillo on 24.04.2025.
//

import SwiftUI

@main
struct SwiftData_CategoriesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Category.self,
                ])
        }
    }
}
