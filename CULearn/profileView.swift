//
//  File.swift
//  A4
//
//  Created by Ashish Kumar on 5/4/24.


import Foundation
import SwiftUI
import SDWebImage

import SwiftUI

struct ProfileView: View {
    let name: String
    let username: String
    let password: String
    let major: String
    let college: String
    let subjects: String
    let bio: String
    let budget: Float?
    let price: Float?
    let availability: String?
    let img: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                // Tutor's image
                if let imageURL = URL(string: img), let imageData = try? Data(contentsOf: imageURL), let tutorImage = UIImage(data: imageData) {
                    Image(uiImage: tutorImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 20)
                }
                
                // Display tutor's profile details
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(name)")
                        .font(.title)
                    Text("Username: \(username)")
                    Text("Major: Asian Studies")
                    Text("College: The College of Arts and Sciences")
                    Text("Subjects: \(subjects)")
                    Text("Bio:")
                        .font(.headline)
                    Text(bio)
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.white.opacity(0.8)))
                .padding(.horizontal)
                
                if let budget = budget {
                    Text("Budget: $\(budget, specifier: "%.2f")")
                } else if let price = price {
                    Text("Price: $\(price, specifier: "%.2f")")
                }
                if let availability = availability {
                    Text("Availability: MWF 5:30pm - 9pm")
                }
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .overlay(
            // Fixed buttons at the bottom
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    // Chat button
                    NavigationLink{
                        ChatView(name: name, username: username, password: password, major: major, college: college, subjects: subjects, bio: bio, budget: budget, price: price, availability: availability ?? "", img: img)
                    }label : {
                        Image("Chat")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                    Spacer()
                    // Home button
                    NavigationLink{
                        TutorProfileView(name: name, username: username, password: password, major: major, college: college, subjects: subjects, bio: bio, budget: budget, price: price, availability: availability ?? "", img: img)
                    }label:{
                        Image("blackHome")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                    Spacer()
                    
                    // Profile button
                    Button(action: {
                        // Handle profile button action
                    }) {
                        Image("finProfile")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                }
                .padding()
                .background(.white)
            }
            
                .offset(y: 30), 
            alignment: .bottom
        )
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(name: "John Doe", username: "johndoe123", password: "password123", major: "Computer Science", college: "University of XYZ", subjects: "Mathematics, Physics", bio: "I'm a passionate tutor with several years of experience in teaching mathematics and physics to students of all ages.", budget: nil, price: 30.0, availability: "Weekdays after 5 PM", img: "https://example.com/tutor_image.jpg")
    }
}

