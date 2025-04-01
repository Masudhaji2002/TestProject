//
//  DoctorsCard.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 01.04.2025.
//

import SwiftUI

struct DoctorsCard: View {
    let user: User

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 16) {
                    AsyncImage(url: URL(string: user.avatar ?? "")) { phase in
                                    switch phase {
                                    case .empty:
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .scaledToFill()
                                            .foregroundStyle(.gray)
                                            .frame(width: 50, height: 50)
                                    case .success(let image):
                                        image.resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    case .failure:
                                        Image(systemName: "person.crop.circle.fill")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.last_name)
                            .font(.system(size: 16, weight: .bold))
                        Text("\(user.first_name) \(user.patronymic)")
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    DescriptionCardDoctorComponents(name: "clock", text: "Опыт работы: \(user.scientific_degree ?? 0) лет")
                    DescriptionCardDoctorComponents(name: "cross.case", text: "Врач \(user.category_label ?? "Не указано") категории")
                    DescriptionCardDoctorComponents(name: "graduationcap", text: user.higher_education?.first?.university ?? "Не указано")
                    DescriptionCardDoctorComponents(name: "location", text: user.work_expirience?.first?.organization ?? "Не указано")
                }

                Button {
                    
                } label: {
                    HStack {
                        Text("Стоимость услуг")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                        Spacer()
                        Text("от \(user.text_chat_price ?? 0) ₽")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                }

                Text("Опыт работы не указан")
                    .font(.system(size: 14, weight: .regular))
                
                Spacer()

                Button {
                    
                } label: {
                    Text(user.free_reception_time?.isEmpty == true ? "Нет свободного расписания" : "Записаться")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(user.free_reception_time?.isEmpty == true ? Color.gray : Color.red)
                        .cornerRadius(8)
                }
            }
            .padding(.bottom, 80)
            .padding(.horizontal, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 245/255, green: 245/255, blue: 245/255))
    }
}
