//
//  itemModel.swift
//  TodoList
//
//  Created by Alex Martuniuk on 11.12.2022.
//

import Foundation

//immutable stuct

struct itemModel:Identifiable,Codable{
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id: String=UUID().uuidString,title: String, isCompleted:Bool){
        self.id=id
        self.title=title
        self.isCompleted=isCompleted
    }
    
    func updateCompletion() -> itemModel{
        return itemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
