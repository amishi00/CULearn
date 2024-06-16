//
//  NetworkManager.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/3/24.
//

import Foundation
import SwiftUI
import Alamofire


class NetworkManager {
    static let shared = NetworkManager()
    
    func createTutor(tutor: Tutor, completion: @escaping (Bool, Error?) -> Void) {
        guard let url = URL(string: "http://34.86.23.95/api/tutors/") else {
            completion(false, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(tutor)
            request.httpBody = jsonData
            print("encoding json")
        } catch {
            completion(false, error)
            print("not encoding json")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(false, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode  < 300 {
                    completion(true, nil)
                } else {
                    completion(false, nil)
                    print("Server returned status code: \(httpResponse.statusCode)")
                }
            } else {
                completion(false, nil)
                print("Unexpected response format")
            }
        }.resume()
    }
    
    func createStudent(student: Student, completion: @escaping (Bool, Error?) -> Void) {
        guard let url = URL(string: "http://34.86.23.95/api/students/") else {
            completion(false, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(student)
            request.httpBody = jsonData
            print("encoding json")
        } catch {
            completion(false, error)
            print("not encoding json")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(false, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                if httpResponse.statusCode  < 300 {
                    completion(true, nil)
                } else {
                    completion(false, nil)
                    print("Server returned status code: \(httpResponse.statusCode)")
                }
            } else {
                completion(false, nil)
                print("Unexpected response format")
            }
        }.resume()
    }
    func fetchTutors(completion: @escaping ([Tutor]?, Error?) -> Void) {
        guard let url = URL(string: "http://34.86.23.95/api/tutors/") else {
            completion(nil, nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                print("Error getting data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            print(String(data: data, encoding: .utf8) ?? "Unable to print data")
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let tutorResponse = try decoder.decode(TutorResponse.self, from: data)
                completion(tutorResponse.tutors, nil)
                print("Decoding successful")
            } catch {
                print("Error decoding data:", error)
                completion(nil, error)
            }
        }.resume()
    }
    
    struct TutorResponse: Codable {
        let tutors: [Tutor]
    }
//    func fetchTutors(completion: @escaping ([Tutor]?, Error?) -> Void) {
//        // Specify the endpoint
//        let endpoint = "http://34.86.23.95/api/tutors/"
//        
//        // Create a decoder
//        let decoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .iso8601
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        // Create the request
//        AF.request(endpoint, method: .get)
//            .validate()
//            .responseDecodable(of: [Tutor].self, decoder: decoder) { response in
//                // Handle the response
//                switch response.result {
//                case .success(let tutors):
//                    completion(tutors, nil)
//                case .failure(let error):
//                    completion(nil, error)
//                    print("Error in NetworkManager.fetchTutors: \(error.localizedDescription)")
//                }
//            }
//    }




}
