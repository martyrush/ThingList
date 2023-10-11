//
//  ListViewModel.swift
//  TodoList
//
//  Created by Alex Martuniuk on 11.12.2022.
//
/*
 CRUD
  Create
 Read
 Update
 Delete
 
 */
import Foundation
class ListViewModel:ObservableObject{
    @Published var mItems:[itemModel]=[]{
        didSet{
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init(){
        getItems()
    }
    
    func getItems(){
    
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([itemModel].self, from: data)
        else {return}
        self.mItems=savedItems
    }
    func deleteItem(IndexSet: IndexSet)
    {
        mItems.remove(atOffsets: IndexSet)
    }
    func moveItem(from: IndexSet, to: Int)
    {
        mItems.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String)
    {
        let newItem=itemModel(title:title, isCompleted:false)
        mItems.append(newItem)
    }
    func updateItem(item:itemModel)
    {
      
        if let index = mItems.firstIndex(where: {$0.id == item.id}){
            mItems[index]=item.updateCompletion()
        }
    }
    func saveItems()
    {
        if let encodedData = try? JSONEncoder().encode(mItems){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
