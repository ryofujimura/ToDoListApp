//
//  Data.swift
//  TaskManagingApp
//
//  Created by ryo fujimura on 10/19/21.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable{
    var id = String()
    var toDoItem = String()
    
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
