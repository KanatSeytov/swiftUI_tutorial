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
    var body: some View {
        VStack {
            ZStack{
                HStack{
                VStack{
                    Text("Content1")
                    Text("Content2")
                    Spacer().frame(height: 400)
                }
                    Spacer()
                }
                Rectangle().fill(Color.blue).offset(x:  isError ? 100: 0)
                
                Text("Text inside the rectangle").offset(x:  isError ? 100: 0)
            }.animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.4))
            Toggle(isOn: $isError, label: {
                Text("Text")
            }).padding();
        }
        
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
