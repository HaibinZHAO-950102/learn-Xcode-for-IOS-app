//
//  ContentView.swift
//  learn_xcode_8
//
//  Created by Haibin Zhao on 02.03.21.
//

import SwiftUI


struct ContentView: View {
    @State private var activeLink: Bool = false
    
    var body: some View {
        NavigationView
        {
            VStack(alignment: .center, spacing: 0)
            {
                Text("Hello World!")
                NavigationLink(
                    destination: DetailView(active: self.$activeLink), isActive: self.$activeLink,
                    label:
                        {
                            Button(action: {
                                self.activeLink = true
                            }, label: {
                                Text("Detail Page")
                            })
                        })
            }
            .padding()
            .navigationBarTitle("Main Page", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
