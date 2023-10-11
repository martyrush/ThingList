//
//  ListRowView.swift
//  TodoList
//
//  Created by Alex Martuniuk on 08.12.2022.
//

import SwiftUI

struct ListRowView: View {
    
    let mItem:itemModel
    
    var body: some View {
        HStack{
            Image(systemName: mItem.isCompleted ? "checkmark.circle":"circle").foregroundColor(mItem.isCompleted ? .green : .red)
            Text(mItem.title)
            Spacer()
        }.font(.title2).padding(.vertical,8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 =  itemModel(title: "This is the first", isCompleted: false)
    static var item2=itemModel(title: "This is the second", isCompleted: true)

    
    static var previews: some View {
     
        Group{
            ListRowView(mItem: item1)
            ListRowView(mItem: item2)
        }.previewLayout(.sizeThatFits)
    }
}
