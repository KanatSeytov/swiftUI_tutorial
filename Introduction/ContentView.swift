//
//  ContentView.swift
//  Introduction
//
//  Created by Канат Сейтов on 16.05.2022.
//

import SwiftUI


struct MyView : View{
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var classes: Classes
    var text: String
    
    var body: some View {
        VStack(spacing:20){
            Text("you choose  \(classes.classes) classes on \(text)")
            .navigationBarItems(leading:
                Button("Back to page"){
                    presentation.wrappedValue.dismiss()
            }
            ,trailing:
                HStack{
                    Button("+"){
                        classes.classes += 1
                    }
                    Button("-"){
                        guard self.classes.classes > 0 else{ return }
                        classes.classes -= 1
                    }
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            self.classes.classes = 0
        }
    }

}


class Classes: ObservableObject{
    @Published var classes = 0
}

struct ContentView: View {
    
    var body: some View {
        TabView {
            ExtractedView()
                .badge(10)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    var body: some View {
        ZStack{
            Color.red
            Text("The First Tab")
        }
        
            
    }
}
