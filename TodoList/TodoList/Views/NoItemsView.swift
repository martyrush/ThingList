//
//  NoItemsView.swift
//  TodoList
//
//  Created by Alex Martuniuk on 11.12.2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing:10){
                Text("Записи отсутствуют!").font(.title).fontWeight(.semibold)
                Text("Для добавления новой записи нажмите на кнопку добавить").padding(.bottom,20)
                NavigationLink(destination: AddView(), label:{ Text("Добавить").foregroundColor(.white).font(.headline).frame(height:55).frame(maxWidth: .infinity).background(animate ? secondaryAccentColor : Color.accentColor).cornerRadius(10)}).padding(.horizontal, animate ? 30 : 50).scaleEffect(animate ? 1.1 : 1.0).offset(y: animate ? -7 : 0).shadow(color:animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7), radius: 10, x: 0.0, y: animate ? 50 :30)
            }.frame(maxWidth:400).multilineTextAlignment(.center).padding(40).onAppear(perform: addAnimation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .center)
        
    }
   
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation( Animation.easeInOut(duration: 2.0).repeatForever()){
               
                animate.toggle()
            }
        }
    }

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
    }.navigationTitle("Title")
    }
}
}
