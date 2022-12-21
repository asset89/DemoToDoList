//
//  ToDoViewModel.swift
//  DemoToDoList
//
//  Created by Asset Ryskul on 21.12.2022.
//

import Foundation
import Combine

protocol ToDoListViewModelProtocol {
    var todos: [ToDo] { get }
    var showCompleted: Bool { get set }
    func fetchTodos()
    func toggleIsCompleted(for todo: ToDo)
}

final class ToDoListViewModel: ObservableObject {
    
    @Published var todos = [ToDo]()
    @Published var showCompleted: Bool = false
    
    var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchTodos()
    }
    
}

extension ToDoListViewModel: ToDoListViewModelProtocol {
    func fetchTodos() {
        todos = dataManager.fetchToDoLists(includingCompleted: showCompleted)
    }
    
    func toggleIsCompleted(for todo: ToDo) {
        dataManager.toggleIsCompleted(for: todo)
    }
}
