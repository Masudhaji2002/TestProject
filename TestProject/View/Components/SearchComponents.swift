//
//  SearchComponents.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 29.03.2025.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Поиск", text: $searchText)
                .foregroundColor(.black)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}

#Preview {
    SearchBar()
}
