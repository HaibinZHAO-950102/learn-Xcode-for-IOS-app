//
//  AppData.swift
//  learn_xcode_11
//
//  Created by Haibin Zhao on 03.03.21.
//

import Foundation
import SwiftUI

struct Hero {
    var name:String
    var show_name:String
    var attack:Int
}

struct HeroViewModel: Identifiable {
    var id = UUID()
    var hero: Hero
    var description:String{
        return "English name: " + hero.name + "/ Attack: \(hero.attack)"
    }
}

class AppData: ObservableObject {
    @Published var heroes: [HeroViewModel]
    init(){
        self.heroes = [
            HeroViewModel(hero: Hero(name: "8bit", show_name: "8BIT", attack: 5)),
            HeroViewModel(hero: Hero(name: "barley", show_name: "BARLEY", attack: 6)),
            HeroViewModel(hero: Hero(name: "bea", show_name: "BEA", attack: 7)),
            HeroViewModel(hero: Hero(name: "bibi", show_name: "BIBI", attack: 8)),
        ]
    }
}
