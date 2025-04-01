//
//  CardItem.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 28.03.2025.
//

import SwiftUI

import SwiftUI

struct CardItem: View {
    let firstName: String
    let lastName: String
    let middleName: String
    let rank: Int
    let avatar: String
    let profession: String
    let experience: Int
    let price: Int
    let freeReceptionTimes: [Int]
   // let freeReceptionTime: Bool
    @State private var isFavorite = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 15) {
                HStack(alignment: .top, spacing: 16) {
                    
                    AsyncImage(url: URL(string: avatar)) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    } placeholder: {
                        // Если URL недоступен или изображения нет, показываем системную иконку
                        if avatar.isEmpty || URL(string: avatar) == nil {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(Color.gray)
                                .clipShape(Circle())
                        } else {
                            ProgressView()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        }
                    }

                        

                    VStack(alignment: .leading, spacing: 8) {
                        Text(lastName)
                            .font(.system(size: 16, weight: .bold))
                        HStack {
                            Text(firstName)
                                .font(.system(size: 16, weight: .bold))
                            Text(middleName)
                                .font(.system(size: 16, weight: .bold))
                        }
                        
                        HStack(spacing: 2.5) {
                            CustomRating(count: rank)
                        }
                        Text("\(profession) • стаж \(experience) лет")
                            .font(.system(size: 14))
                            .foregroundStyle(.gray)
                        Text("от \(price) ₽")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .frame(width: 205, height: 126, alignment: .topLeading)

                    Button {
                            isFavorite.toggle()
                            } label: {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.pink)
                            }
                            .buttonStyle(.plain)
                }
                .frame(width: 311, height: 126, alignment: .topLeading)

                Button {
                    
                } label: {
                    Text(freeReceptionTimes.isEmpty ? "Нет свободного расписания" : "Записаться")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 311,height: 47)
                        .background(freeReceptionTimes.isEmpty ? Color.gray : Color.pink)
                        .cornerRadius(8)
                }
            }
            .padding()
            
        }
    }
}

struct CustomRating: View {
    var count: Int
    let maxRating = 5
    
    var body: some View {
        HStack {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundColor(index < count ? .pink : .gray) // Если рейтинг больше индекса, звезда розовая, иначе серая
            }
        }
    }
}


#Preview {
    CardItem(
        firstName: "Иван",
        lastName: "Петров",
        middleName: "Сергеевич",
        rank: 4,
        avatar: "image",
        profession: "Педиатр",
        experience: 2,
        price: 400,
        freeReceptionTimes: [123, 122] // freeReceptionTime: true
    )
}
