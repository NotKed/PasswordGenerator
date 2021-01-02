//
//  ContentView.swift
//  PasswordGenerator
//
//  Created by Kyle Edwards on 01/01/2021.
//

import SwiftUI
import MobileCoreServices

struct ContentView: View {
    
    @State var pass: String = "Password Generator"
    @State var copyVisible: Bool = false
    
    @State var chars: Array = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~`! @#$%^&*()_-+={[}]|\"'<,>.?/")
    
    var body: some View {
        VStack() {
            HStack() {
                Text(pass)
                    .padding(20)
                    .font(.title)
                    .scaledToFit()
                    .lineLimit(1)
                    .minimumScaleFactor(0.05)
                
                if copyVisible {
                    Button(action: {
                        UIPasteboard.general.string = pass
                    }, label: {
                        Image(systemName: "doc.on.doc.fill")
                    })
                }
            }
            Button(action: {
                copyVisible = true
                pass = "";
                for _ in 1...35 {
                    pass += String(chars.randomElement()!)
                }
            }, label: {
                HStack() {
                    Image(systemName: "gear")
                        .font(.title)
                    Text("Generate")
                        .font(.title)
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
