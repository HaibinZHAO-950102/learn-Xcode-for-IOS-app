//
//  HeroView.swift
//  learn_xcode_11
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct HeroView: View {
    @Environment(\.presentationMode) var presentation
    let herovm: HeroViewModel
    
    var body: some View {
        VStack{
            Spacer()
            Text(herovm.hero.show_name)
            Text(herovm.description)
            Spacer()
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Close")
            })
        }
    }
}

//struct HeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroView()
//    }
//}
