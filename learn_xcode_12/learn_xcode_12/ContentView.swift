//
//  ContentView.swift
//  learn_xcode_12
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var show_alert:Bool = false
    var body: some View {
        Button(action: {
            self.show_alert = true
        }, label: {
            Text("Show Alert :)")
                .font(.largeTitle)
        })
        .alert(isPresented: self.$show_alert, content: {
            Alert(title: Text("Alert"),
                  message: Text("It is dangerous!!"),
                  dismissButton: .cancel(Text("Close")))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
