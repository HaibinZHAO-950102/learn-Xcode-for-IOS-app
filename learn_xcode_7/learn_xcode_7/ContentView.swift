//
//  ContentView.swift
//  learn_xcode_7
//
//  Created by Haibin Zhao on 02.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var setColor:Bool = false
    @State private var setBold:Bool = false
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("Hello World!")
                    .foregroundColor(self.setColor ? Color.red : Color.blue)
                Spacer()
            }
            .padding(10)
            .font(self.setBold ? .largeTitle : .body)
            
            .navigationBarTitle("Home Screen", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.setBold.toggle()
                }, label: {
                    Text("Change the font")
                }),
                
                trailing: Button(action: {
                    self.setColor.toggle()
                }, label: {
                    Text("Change the color")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
