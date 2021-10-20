//
//  Calendar.swift
//  TaskManagingApp
//
//  Created by ryo fujimura on 10/19/21.
//

import SwiftUI
import Combine

struct Calendar: View {
    var body: some View {
        NavigationView{
            addItem()
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            NavigationView{
                addItem()
            }.navigationTitle("Tasks")
            .navigationBarItems(trailing: EditButton())
            HStack{
                CardView()
                .offset(y: 215)
                .padding(.all, 40.0)
                CardView()
                .offset(y: 215)
                .padding(.all, 40.0)
                
            }.ignoresSafeArea()
        }
       
    }
}
