//
//  ContentView.swift
//  ToDoList_Swift_UI
//
//  Created by Andrew  on 3/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                //item.isCompleted = true
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("ToDo Lists 📝")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination:
                AddView()))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(ListViewModel())
    }
}