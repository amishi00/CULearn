//
//  subjectSelectionView.swift
//  CULearn
//
//  Created by Amishi Gupta on 5/2/24.
//

import Foundation
import SwiftUI

struct SubjectSelectionView: View {
    @State private var searchText: String = ""
    @State private var selectedCourses: [String] = []
    
    @State private var bio: String = ""
    @State private var budget: String = ""
    @State private var navigateToAllSetPage = false
    
    
    let name: String
    let username: String
    let password: String
    let major: String
    let college: String
    
    var courses: [String] = [
        "Mathematics",
        "Physics",
        "Chemistry",
        "Biology",
        "History",
        "English",
        "Computer Science",
        "Economics",
        "Art",
        "Music",
        "Geography"
    ]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                Text("Which subjects do you need help in?")
                    .font(.title2)
                
                TextField("Search subjects", text: $searchText)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(courses.filter({ searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText) }), id: \.self) { course in
                            HStack {
                                Text(course)
                                    .padding(.horizontal)
                                Spacer()
                                if selectedCourses.contains(course) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                        .padding(.trailing)
                                }
                            }
                            .onTapGesture {
                                if let index = selectedCourses.firstIndex(of: course) {
                                    selectedCourses.remove(at: index)
                                } else {
                                    selectedCourses.append(course)
                                }
                            }
                        }
                    }
                }
                .frame(height: 200)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Text("Enter your bio:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                TextField("Bio", text: $bio)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                
                Text("Enter your Budget:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                TextField("budget", text: $budget)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)
                
                HStack(spacing: 10) {
                    ForEach(0..<4) { index in
                        Circle()
                            .fill(index == 2 ? Color.black : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.vertical)
                .padding(.top)
                
                let subjectsString = selectedCourses.joined(separator: ", ")
                
                NavigationLink(destination: AllSetPageView(name: self.name, username: self.username, password: self.password, major: self.major, college: self.college, subjects: subjectsString ,bio: self.bio, budget: Float(budget), price: nil, availability: nil, img: ""), isActive: $navigateToAllSetPage) {
                    EmptyView()
                    
                    
                    Button(action: {
                        
                        let newStudent = Student(
                            name: name,
                            username: username,
                            password: password,
                            profile_img: "han",
                            bio: bio,
                            budget: Float(budget) ?? 0.0,
                            subjects: subjectsString
                        )
                        NetworkManager.shared.createStudent(student: newStudent) { success, error in
                            if success {
                                print("Student created successfully")
                                navigateToAllSetPage = true // Activate navigation to AllSetPage
                            } else {
                                print("Failed to create tutor: \(error?.localizedDescription ?? "Unknown error")")
                            }
                        }
                    }) {
                        Text("Continue")
                            .padding()
                            .frame(maxWidth: 275, maxHeight: 42)
                            .background(Color.orange)
                            .foregroundColor(.black)
                            .cornerRadius(30)
                            .padding(.horizontal, 40)
                    }
                    .padding()
                }
            }
            .padding()
        }
        
    }
}

struct SubjectSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectSelectionView(name: "John Doe", username: "johndoe123", password: "password", major: "Computer Science", college: "College of Engineering")
    }
}
