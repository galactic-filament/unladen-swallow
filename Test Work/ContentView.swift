//
//  ContentView.swift
//  Test Work
//
//  Created by Adrian Parker on 4/10/22.
//

import AVKit
import SwiftUI

struct Option: Hashable {
    let title: String
    let imageName: String
}

struct ContentView: View {
    @State var currentOption = 0
    
    let options: [Option] = [
        .init(title: "Home", imageName: "house"),
        .init(title: "About", imageName: "info.circle"),
        .init(title: "Settings", imageName: "gear"),
        .init(title: "Social", imageName: "message")
    ]
    
    var body: some View {
        NavigationView {
            ListView(options: options, currentSelection: $currentOption)
            
            switch currentOption {
            case 1:
                Text("About")
            case 2:
                Text("Settings")
            case 3:
                Text("Social")
            default:
                MainView()
            }
        }
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ListView: View {
    let options: [Option]
    @Binding var currentSelection: Int
    
    var body: some View {
        VStack() {
            let current = options[currentSelection]
            
            ForEach(0..<options.count) { i in
                let option = options[i]
                
                HStack() {
                    Image(systemName: option.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    
                    Text(option.title)
                        .foregroundColor(option == current ? Color.blue : Color.white)
                    
                    Spacer()
                    
                }
                .padding()
                .onTapGesture {
                    currentSelection = i
                }
            }
            
            Spacer()
        }
    }
}

struct MainView: View {
    let cols: [GridItem] = [
        .init(.flexible()),
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let videoImages = Array(1...3).map { "video\($0)" }
    
    var body: some View {
        VStack {
            Image("4053 Leaf")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 800, maxHeight: 600)
            
            LazyVGrid(columns: cols) {
                ForEach(videoImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 800, maxHeight: 600)
                }
            }
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
