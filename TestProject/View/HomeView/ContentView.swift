//
//  ContentView.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 27.03.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var userViewModel = UserViewModel()
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                VStack(spacing: 16) {
                    SearchBar()
                    PlaceButton()
                    VStack(spacing: 16) {
                        ScrollView(.vertical) {
                            if userViewModel.isLoading {
                                ProgressView("Загрузка...")
                            } else if let errorMessage = userViewModel.errorMessage {
                                Text(errorMessage)
                                    .foregroundColor(.red)
                               
                            } else {
                                ForEach(userViewModel.users) { user in
                                    CardItem(
                                        firstName: user.first_name,
                                        lastName: user.last_name,
                                        middleName: user.patronymic,
                                        rank: user.ratings_rating ?? 0,
                                        avatar: user.avatar ?? "",
                                        profession: user.specialization?.first?.name ?? "404",
                                        experience: user.scientific_degree ?? 0,
                                        price: user.text_chat_price ?? 0,
                                        freeReceptionTimes: user.free_reception_time?.map { $0.time } ?? []
                                    )
                                    .onTapGesture {
                                        navigationPath.append(user)
                                    }
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.horizontal,16)
                .background(Color(red: 245/255, green: 245/255, blue: 245/255))
            }
            .navigationDestination(for: User.self) { user in
                            DoctorsCard(user: user)
                        }
            .onAppear {
                userViewModel.getData()
            }
        }
    }
}
