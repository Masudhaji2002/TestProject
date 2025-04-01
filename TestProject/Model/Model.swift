//
//  Model.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 29.03.2025.
//



import Foundation

struct RootResponse: Codable {
    let data: UserResponse
}

struct UserResponse: Codable {
    let users: [User]
}

struct User: Codable, Identifiable, Hashable {
      let id: String
      let first_name: String
      let patronymic: String
      let last_name: String
      let specialization: [Specialization]?
      let ratings_rating: Int?
      let avatar: String?
      let text_chat_price: Int?
      let scientific_degree: Int?
      let higher_education: [HigherEducation]?
      let work_expirience: [WorkExpirience]?
      let category_label: String?
      let free_reception_time: [FreeReceptionTime]?
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        // Реализация Equatable
        static func == (lhs: User, rhs: User) -> Bool {
            return lhs.id == rhs.id
        }
    
}

struct Specialization: Codable {
    let id: Int
    let name: String
    let is_moderated: Bool
}

struct WorkExpirience: Codable {
    let id: Int
    let organization: String
    let position: String
    let start_date: Int
    let end_date: Int?
    let until_now: Bool
    let is_moderated: Bool
}

struct FreeReceptionTime: Codable {
    let time: Int
}

struct HigherEducation: Codable {
    let id: Int
    let university: String
    let specialization: String
    let qualification: String
    let start_date: Int
    let end_date: Int?
    let until_now: Bool
    var is_moderated: Bool = true
}




