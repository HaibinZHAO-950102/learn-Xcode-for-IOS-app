//
//  ContentView.swift
//  learn_xcode_13
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var title:String = "Learn ActionSheet"
    @State private var message:String = "Message"
    @State private var open_sheet:Bool = false
    
    var body: some View {
        VStack{
            Text(self.title)
                .font(.largeTitle)
            Spacer()
            Text(self.message)
                .font(.body)
                .foregroundColor(.red)
            Spacer()
            Button(action: {
                self.open_sheet = true
            }, label: {
                Text("Open ActionSheet")
            })
        }
        .actionSheet(isPresented: self.$open_sheet) { () -> ActionSheet in
            ActionSheet(title: Text("Title"),
                        message: Text("Message"),
                        buttons: [
                            .default(Text("Option 1"), action: {
                                self.message = "Option 1"
                            }),
                            .destructive(Text("Option 2"), action: {
                                self.message = "Option 2"
                            }),
                            .cancel(Text("Cancel"), action: {
                                self.message = "Canceled"
                            })
            ])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
