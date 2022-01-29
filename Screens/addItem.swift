//
//  addItem.swift
//  TaskManagingApp
//
//  Created by ryo fujimura on 10/19/21.
//

import SwiftUI

struct addItem: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack{
            TextField("Enter task", text: self.$newToDo)
                .padding(.leading)
                .resignFirstResponder()
            Button(action: self.addNewToDo, label: {Text("Add")
                    .fontWeight(.black)
                    .foregroundColor(Color(hue: 0.548, saturation: 0.908, brightness: 0.497))
                    .padding(.horizontal)
                })
        }
        .padding(12.0)
    }
    
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
    }
    
    var body: some View {
        VStack{
            searchBar
            List{
                ForEach(self.taskStore.tasks){
                    task in
                    Text(task.toDoItem)
                }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
            }//.navigationTitle("Tasks")x
           // .navigationBarItems(trailing: EditButtonxx())
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func delete(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
}

struct addItem_Previews: PreviewProvider {
    static var previews: some View {
        addItem()
    }
}
