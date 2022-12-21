//
//  ToDo.swift
//  DemoToDoList
//
//  Created by Asset Ryskul on 21.12.2022.
//

import Foundation

struct ToDo: Identifiable {
    
    var id = UUID()
    var title: String
    var isCompleted: Bool = false

}
