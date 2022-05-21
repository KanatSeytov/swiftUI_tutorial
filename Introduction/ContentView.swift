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
    @State var isSharePresented = false
    @ObservedObject var classes = Classes()
    @State var selector: String?
    let math = "math"
    let physics = "physics"
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                
                Text("You have \(classes.classes) classes ")
                    
                NavigationLink(destination: MyView(text: math), tag: "act1", selection: $selector, label:{Text(math)})
                NavigationLink(destination: MyView(text: physics), tag: "act2", selection: $selector, label:{Text(physics)})
                
                
                
                    .navigationBarTitle("Potential")
            }
        }
        .environmentObject(classes)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
