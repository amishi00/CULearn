//
//  LoginPageView.swift
//  CULearn
//
//  Created by Amishi Gupta on 5/2/24.
//

import SwiftUI
import Foundation

struct LoginPageView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var students: [Student] = []
    @State private var isAuthenticated: Bool = false
    @State private var tutorProfileView: TutorProfileView?

    var body: some View {
        NavigationView{
            VStack {
                Image("finalLog")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 253.33)
                
                Text("Login")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading,56)
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                
                Text("We're happy to have you!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 18))
                    .padding(.leading,56)
                    .padding(.bottom, 18)
                
                HStack{
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 275)
                        .frame(maxHeight: 42)
                }
                
                HStack{
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(maxWidth: 275)
                }
                
                Button("Login"){
                    login()
                }
                .padding()
                .frame(maxWidth: 275,maxHeight: 42)
                
                .background(Color.orange)
                .foregroundColor(.black)
                .cornerRadius(30)
                .padding(.horizontal, 40)
                .padding()
                .background(
                    NavigationLink(destination:tutorProfileView, isActive: $isAuthenticated) { EmptyView() }
                )
                
                Text("Don't have an account?")
                    .font(.caption)
                
                NavigationLink(destination: CreateProfileView()) {
                    Text("Sign Up")
                        .padding()
                        .frame(maxWidth: 275,maxHeight: 42)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .padding(.horizontal, 40)
                }
            }
        }
    }
    
    func login() {
        guard let url = URL(string: "http://34.86.23.95/api/tutor/authentication/") else {
            print("Invalid URL")
            return
        }
        let requestBody: [String: String] = ["username": username]
        guard let requestBodyData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Failed to encode request body")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = requestBodyData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                // Parse JSON response
                let response = try JSONDecoder().decode(TutorPasswordResponse.self, from: data)

                // Check if password matches the fetched password
                if response.password == password {
                    print("Login successful as \(username)")
                    NetworkManager.shared.fetchTutors { tutors, error in
                        if let tutors = tutors {
                            // Find tutor with matching username
                            if let tutor = tutors.first(where: { $0.username == username }) {
                                // Navigate to TutorProfileView and pass details
                                DispatchQueue.main.async {
                                    isAuthenticated = true
                                    // Pass required details to TutorProfileView
                                    tutorProfileView = TutorProfileView(name: tutor.name, username: tutor.username, password: tutor.password, major: "", college: "", subjects: tutor.subjects, bio: tutor.bio, budget: nil, price: tutor.price, availability: tutor.availability, img: tutor.img)
                                    // Push to TutorProfileView
                                    // You need to handle navigation in your app accordingly
                                }
                            } else {
                                print("Tutor not found for username: \(username)")
                            }
                        } else if let error = error {
                            print("Error fetching tutors: \(error.localizedDescription)")
                        }
                    }
                
                } else {
                    print("Invalid username or password")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }


        struct TutorPasswordResponse: Codable {
            let password: String
        }
    
    

}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}


