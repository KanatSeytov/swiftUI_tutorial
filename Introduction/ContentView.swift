//
//  ContentView.swift
//  Introduction
//
//  Created by Канат Сейтов on 16.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isSharePresented = false
    
    var body: some View {
        Button("Nice try"){
            self.isSharePresented = true
            print("\(self.isSharePresented)")
        }.sheet(isPresented: $isSharePresented){
            ActivityView(activityItems: ["TEXT"])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
