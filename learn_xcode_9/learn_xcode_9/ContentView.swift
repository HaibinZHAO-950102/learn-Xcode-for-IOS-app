//
//  ContentView.swift
//  learn_xcode_9
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct AnotherView1: View
{
    @Binding var page_index:Int
    var body: some View {
        VStack{
            Text("Hello")
            Button(action: {
                self.page_index = 20
            }, label: {
                Text("Click Here")
            })
        }
    }
}

struct AnotherView2: View
{
    @Binding var page_index:Int
    var body: some View {
        VStack{
            Text("Hello")
            Button(action: {
                self.page_index = 10
            }, label: {
                Text("Click Here")
            })
        }
    }
}

struct ContentView: View {
    
    @State private var selected_view_index:Int = 10
    
    var body: some View {
        TabView (selection: self.$selected_view_index){
            AnotherView1(page_index: self.$selected_view_index)
                .tabItem ({
                    Image(systemName: "house")
                    Text("Home Page")
                }).tag(10)
            AnotherView2(page_index: self.$selected_view_index)
                .tabItem ({
                    Image(systemName: "house")
                    Text("Home Page")
                }).tag(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
