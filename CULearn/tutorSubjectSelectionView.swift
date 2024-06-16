//
//  tutorSubjectSelectionView.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//

import Foundation

import SwiftUI

struct TutorSubjectSelectionView: View {
let name: String
let username: String
let password: String
let major: String
let college: String
@State private var searchText: String = ""
@State private var selectedCourses: [String] = []
@State private var bio: String = ""
@State private var availability: String = ""
@State private var price: String = "0.00"
 @State private var navigateToAllSetPage = false
    let placeholderImg = "https://i.pinimg.com/originals/87/d0/98/87d098d886d3fab2af463c09b65d7b44.jpg"
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
    ScrollView {
        VStack(spacing: 20) {
            Text("Which subjects can you help in?")
                .font(.title2)
            
            TextField("Search subjects", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
            
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
            .frame(maxWidth: .infinity)
            
            Text("Enter your bio:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .bold()
            TextField("Bio", text: $bio)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
            
            
            Text("Enter your Availabilty:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .bold()
            TextField("Availability", text: $availability)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(maxWidth: .infinity)
            
            Text("Enter your hourly rate ($/hr):")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
                .bold()
            TextField("Price", text: $price)
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
            
            NavigationLink(destination: AllSetPageView(name: self.name, username: self.username, password: self.password, major: self.major, college: self.college, subjects: subjectsString, bio: self.bio, budget: nil, price: Float(price), availability: self.availability, img: placeholderImg), isActive: $navigateToAllSetPage) {
                EmptyView()
                
                
                Button(action: {
                    
                    let newTutor = Tutor(
                        id: 1,
                        username: username,
                        name: name,
                        password: password,
                        bio: bio,
                        img: placeholderImg,
                        price: Float(price) ?? 0.0,
                        subjects: subjectsString,
                        availability: availability
                    )
                    NetworkManager.shared.createTutor(tutor: newTutor) { success, error in
                        if success {
                            print("Tutor created successfully")
                            navigateToAllSetPage = true
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

struct TutorSubjectSelectionView_Previews: PreviewProvider {
static var previews: some View {
TutorSubjectSelectionView(name: "John Doe", username: "johndoe123", password: "password", major: "Computer Science", college: "College of Engineering")
}
}
