//
//  MyHomeViewModel.swift
//  learn_xcode_5
//
//  Created by Haibin Zhao on 02.03.21.
//

import SwiftUI

class MyHomeViewModel: ObservableObject {
    @Published var bookinfo:Book
    
    init()
    {
        self.bookinfo = Book(Title: "My Book", Author: "Haibin")
    }
    
    var AppTitle:String
    {
        return self.bookinfo.Title + " (Author: \(self.bookinfo.Author))"
    }
}
