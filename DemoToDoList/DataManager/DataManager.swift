//
//  DataManageer.swift
//  DemoToDoList
//
//  Created by Asset Ryskul on 21.12.2022.
//

import Foundation

protocol DataManagerProtocol {
    func fetchToDoLists(includingCompleted: Bool) -> [ToDo]
    func add(todo: ToDo)
    func toggleIsCompleted(for todo: ToDo)
}

extension DataManagerProtocol {
    func fetchToDoLists(includingCompleted: Bool = false) -> [ToDo] {
        fetchToDoLists(includingCompleted: includingCompleted)
    }
}

class DataManager {
    static let shared: DataManagerProtocol = DataManager()
    private var toDos = [ToDo]()
    private init() {}
}

extension DataManager: DataManagerProtocol {
    
    func fetchToDoLists(includingCompleted: Bool) -> [ToDo] {
        includingCompleted ? toDos : toDos.filter({!$0.isCompleted})
    }
    
    func add(todo: ToDo) {
        toDos.insert(todo, at: 0)
    }
    
    func toggleIsCompleted(for todo: ToDo) {
        if let index = toDos.firstIndex(where: {$0.id == todo.id}) {
            toDos[index].isCompleted.toggle()
        }
    }
    
}
