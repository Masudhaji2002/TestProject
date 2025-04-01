//
//  MainView.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 29.03.2025.
//

import SwiftUI

struct MainView: View {
    @State var selectTab: String = "house.fill"
    
    let pages: [(icon: String, title: String)] = [
        ("house.fill", "Главная"),
        ("calendar", "Приемы"),
        ("message", "Чат"),
        ("person", "Профиль")
    ]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTab) {
                ContentView()
                    .tag("house.fill")
                
                Text("Приемы")
                    .tag("calendar")
                
                Text("Чат")
                    .tag("message")
                
                Text("Профиль")
                    .tag("person")
            }
            
            HStack(spacing: 60) {
                ForEach(pages, id: \.icon) { page in
                    TabItem(page: page, selectTab: $selectTab)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 70)
            .background(Color.white)
           
        }
    }
}

struct TabItem: View {
    var page: (icon: String, title: String)
    @Binding var selectTab: String
    
    var body: some View {
        VStack {
            Button {
                selectTab = page.icon
            } label: {
                Image(systemName: page.icon)
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(selectTab == page.icon ? .pink : .gray)
            }
            Text(page.title)
                .font(.system(size: 12))
                .foregroundColor(selectTab == page.icon ? .pink : .gray)
        }
        
    }
}

#Preview {
    MainView()
}
