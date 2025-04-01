//
//  PlaceButton.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 29.03.2025.
//

import SwiftUI

struct PlaceButton: View {
    @State private var selectedFilter: String? = nil
    
    var body: some View {
        HStack(spacing: 0) {
            FilterButton(title: "По цене", selectedFilter: $selectedFilter)
            FilterButton(title: "По стажу", selectedFilter: $selectedFilter)
            FilterButton(title: "По рейтингу", selectedFilter: $selectedFilter)
        }
        .frame(height: 32)
        .background(Color.white)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

struct FilterButton: View {
    let title: String
    @Binding var selectedFilter: String?

    var body: some View {
        Button {
            selectedFilter = (selectedFilter == title) ? nil : title
        } label: {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(selectedFilter == title ? .white : .gray)
                .frame(maxWidth: 113, maxHeight: 32)
                .background(selectedFilter == title ? Color.pink : Color.clear)
                .cornerRadius(8)
        }
        
    }
}

#Preview {
    PlaceButton()
}
