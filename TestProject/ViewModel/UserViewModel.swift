//
//  UserData.swift
//  TestProject
//
//  Created by Масуд Гаджиев on 29.03.2025.
//

import Foundation
import Alamofire

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    // Метод для загрузки данных
    func getData() {
        let urlString = "https://raw.githubusercontent.com/salfa-ru/test_iOS_akatosphere/main/test.json"
        
        let parameters: Parameters = [
            "count": 91,
            "previous": "null",
            "message": "Success",
            "errors": "null"
        ]
        
        isLoading = true
        
        AF.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default).response { result in
            self.isLoading = false
            if let error = result.error {
                self.errorMessage = "Ошибка запроса: \(error.localizedDescription)"
                return
            }
            
            guard let data = result.data else {
                self.errorMessage = "Данные не получены"
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(RootResponse.self, from: data)
                self.users = decodedResponse.data.users
            } catch {
                self.errorMessage = "Ошибка декодирования: \(error)"
                print(error)
            }
        }
    }
}
