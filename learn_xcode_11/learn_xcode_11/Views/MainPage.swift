//
//  MainPage.swift
//  learn_xcode_11
//
//  Created by Haibin Zhao on 03.03.21.
//

import SwiftUI

struct MainPage: View {
    @StateObject private var appdata = AppData()
    @State private var open_sheet: HeroViewModel? = nil
    
    var body: some View {
        List {
            ForEach(self.appdata.heroes) { vm in
                HStack{
                    Button(action: {
                        self.open_sheet = vm
                    }, label: {
                        Text(vm.hero.show_name)
                    })
                }
            }
        }
        .sheet(item: self.$open_sheet) { vm in
            HeroView(herovm: vm)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
