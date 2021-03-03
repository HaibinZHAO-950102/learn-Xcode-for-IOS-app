//
//  ContentView.swift
//  learn_xcode_10
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct PopView: View {
    @Binding var show:Bool
    var body: some View{
        VStack{
            Spacer()
            Text("Pop View").font(.largeTitle)
            Spacer()
            Button("Close Pop View"){
                self.show = false
            }.font(.title)
        }
    }
}

struct ContentView: View {
    @State private var show_sheet:Bool = false
    var body: some View {
        Button(action: {
            self.show_sheet = true
        }, label: {
            Text("Show Pop View")
                .font(.title)
        })
        .sheet(isPresented: self.$show_sheet, content: {
            PopView(show: self.$show_sheet)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
