//
//  DescriptionCardDoctorComponents.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 01.04.2025.
//

import SwiftUI

struct DescriptionCardDoctorComponents: View {
    var name: String
    var text: String
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: name)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
                .foregroundStyle(.gray)
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(.gray)
            
        }
        
    }
}

#Preview {
    DescriptionCardDoctorComponents(name: "cross.case", text: "Врач высшей категории")
}
