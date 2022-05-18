//
//  ContentView.swift
//  Introduction
//
//  Created by Канат Сейтов on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isError = false
    @State var count = 0
    @State var lite = 0
    var texts = ["text 1","text 2","text 3", "text 4"]
    var body: some View {
        NavigationView{
            Form{
                Picker(selection: $count, label: Text("Text"), content: {
                    ForEach(0..<texts.count){
                        Text(self.texts[$0])
                    }
                })
                
                Toggle(isOn: $isError){
                    Text("Avia").foregroundColor(isError ? Color.blue : Color.gray)
                    
                }
                
                Picker(
                    selection:
                        $lite,
                    label:Text("Lite"),
                    content: {
                        ForEach(0..<101){
                        Text("\($0)")
                    }
                })
                
                Text("The result of picker \(texts[count])")
            }.navigationTitle(Text("Settings"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
