//
//  ContentView.swift
//  Introduction
//
//  Created by Канат Сейтов on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var segIdx = 0
    @State var offset: Float = 0
    var companies = ["Nike", "Puma", "Adidas"]
    var body: some View {
        VStack{
            Text("Cross from \(companies[segIdx])").font(Font.system(.title))
            ZStack{
                RoundedRectangle(cornerRadius: 10).fill(Color.gray)
                    .frame(width: 320, height: 320)
                    .padding()
                    
                Image(companies[segIdx]).resizable().frame(width: 300, height: 300)
                    .offset(x: CGFloat(self.offset))
            }.offset(x: CGFloat(self.offset)).animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.4))
            
            Picker(selection: Binding(get: {
                    self.segIdx
            }, set: {newValue in
                
                self.offset = -500
                self.segIdx = newValue
                moveBack()
            }), content: {
                ForEach(0..<companies.count){
                    Text(self.companies[$0]).tag($0)
                }
            }, label: {Text("Companies")}).pickerStyle(SegmentedPickerStyle()).padding()
            Spacer().frame(height: 100)
        }
    }
    
    private func moveBack(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.offset = 0
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
