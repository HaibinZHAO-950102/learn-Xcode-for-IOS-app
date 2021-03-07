//
//  ContentView.swift
//  learn_xcode_cameras
//
//  Created by Haibin Zhao on 07.03.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show_sheet:Bool = false
    @State private var show_img_picker:Bool = false
    @State private var source_type:UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView
        {
            VStack
            {
                Image(uiImage: image ?? UIImage(systemName: "camera")!)
                    .resizable()
//                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .aspectRatio(contentMode: .fill)
                
                Button(action: {
                    self.show_sheet = true
                }, label: {
                    Text("Choose Picture")
                })
                .padding()
                
                .actionSheet(isPresented: self.$show_sheet) {() -> ActionSheet in
                    ActionSheet(title: Text("Select Photo"),
                                message: Text("Choose"),
                                buttons:
                                    [
                                        .default(Text("Photo Library"))
                                            {
                                                self.show_img_picker = true
                                                self.source_type = .photoLibrary
                                            },
                                        .default(Text("Camera"))
                                            {
                                                self.show_img_picker = true
                                                self.source_type = .camera
                                            },
                                        .cancel()
                                    ])
                }
            }
            .navigationBarTitle("Camera Demo")
        }
        .sheet(isPresented: self.$show_img_picker)
        {
            ImagePicker(image: $image, is_shown: self.$show_img_picker, source_type: self.source_type)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
