//
//  ListView.swift
//  TodoList
//
//  Created by Alex Martuniuk on 08.12.2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel:ListViewModel
    //@State
   
    
    var body: some View {
        ZStack{
            if listViewModel.mItems.isEmpty{
                NoItemsView().transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                 
                    ForEach(listViewModel.mItems){item in ListRowView(mItem: item).onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
                      }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }.listStyle(PlainListStyle()).navigationTitle("Todo List")
                    .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Добавить",destination: AddView()))
            }
        }
        
    }
   
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
   
    }
}


