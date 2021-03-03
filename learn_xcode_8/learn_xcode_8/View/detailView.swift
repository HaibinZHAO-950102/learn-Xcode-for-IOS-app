//
//  detailView.swift
//  learn_xcode_8
//
//  Created by Haibin Zhao on 02.03.21.
//
import SwiftUI

struct DetailView: View {
    @Binding var active: Bool
    var body: some View
    {
        Text("I love you!")
        Button(action: {
            self.active = false
        }, label: {
            Text("Back")
        })
    }
}


struct detailView_Previews: PreviewProvider {
//    @Binding static var active = false
    static var previews: some View {
        DetailView(active: .constant(true))
    }
}

