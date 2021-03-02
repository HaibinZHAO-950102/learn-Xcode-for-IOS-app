//
//  MyHomeView.swift
//  learn_xcode_5
//
//  Created by Haibin Zhao on 02.03.21.
//

import SwiftUI

struct MyHomeView: View {
    @StateObject private var viewmodel = MyHomeViewModel()
    
    var body: some View {
        Text(self.viewmodel.AppTitle)
            .padding()
            .font(.title)
            .foregroundColor(.blue)
    }
}

struct MyHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyHomeView()
    }
}
