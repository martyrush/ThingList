//
//  AddView.swift
//  TodoList
//
//  Created by Alex Martuniuk on 08.12.2022.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var mTextField: String = ""
    //Color.init(red: 170, green: 170, blue: 170
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Напиши тут...",text:$mTextField).frame(height:60).padding(.horizontal).background(Color(UIColor.systemBackground)).cornerRadius(10)
                Button(action: {saveButtonPressed()}, label: {
                    Text("Сохранить".uppercased()).foregroundColor(.white).font(.headline).frame(height:55).frame(maxWidth: .infinity).background(Color.accentColor).cornerRadius(10)
                })
            }.padding(14)
        }.navigationTitle("Добавить событие").alert(isPresented: $showAlert,content: getAlert)
    }
    
    func saveButtonPressed()
    {
        if(textIsAppropriate()){
           
            listViewModel.addItem(title: mTextField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate()-> Bool{
        if mTextField.count<3{
            alertTitle="Текст должен быть больше 3x символов"
            showAlert.toggle()
            return false
        }
        else {return true}
    }
    func getAlert()-> Alert{
        return Alert(title:Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                AddView()
            }.preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait).environmentObject(ListViewModel())
            NavigationView{
                AddView()
            }.preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait).environmentObject(ListViewModel())
        }
        
    }
}
