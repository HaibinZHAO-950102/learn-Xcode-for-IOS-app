//
//  ContentView.swift
//  learn_xcode_6
//
//  Created by Haibin Zhao on 02.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var txtInput:String = ""
    @State private var message:String = "Hello World!"
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
            Text(self.message)
                .font(.largeTitle)
            
            TextField("Input your Username", text: self.$txtInput)
                .frame(width: UIScreen.main.bounds.width - 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.title)
                .padding(10)
                .border(Color.gray)
            
            Button(action: {
                self.message = self.txtInput
            }, label: {
                Text("Confirm")
                    .font(.title)
                    .background(Color.blue)
                    .foregroundColor(.white)
            })
            .buttonStyle(DefaultButtonStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
