//
//  ContentView.swift
//  mbtiPlayground
//
//  Created by 박종후 on 2022/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .main
    
    enum Tab {
        case main
        case content
        case chatRoom
        case search
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: $selection){
                SearchHome()
                .navigationViewStyle(StackNavigationViewStyle())
                .tabItem{
                    Label("메인", systemImage: "house")
                }
                .tag(Tab.main)
                
                SearchInput()
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem{
                        Label("검색", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
