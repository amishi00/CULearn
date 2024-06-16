//
//  allSetPageView.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//

import Foundation
import SwiftUI

struct AllSetPageView: View {
    let name: String
    let username: String
    let password: String
    let major: String
    let college: String
    let subjects: String
    let bio: String
    let budget: Float?
    let price : Float?
    let availability : String?
    let img : String?
    var body: some View {
        VStack {
            Image("finalAllSet")
                .resizable()
                .scaledToFit()
                .frame(height: 272)
                .padding()
            
            Text("You're all set!")
                .font(.title)
                .padding()
            
            Spacer()
            
            HStack(spacing: 10) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 3 ? Color.black : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.vertical)
            
            NavigationLink{
                TutorProfileView(name: self.name, username: self.username, password: self.password, major: self.major, college: self.college, subjects: self.subjects, bio: self.bio, budget: self.budget, price:self.price, availability: self.availability, img: self.img)
            }label:{
                Text("Let's go")
                    .padding()
                    .frame(maxWidth: 275, maxHeight: 42)
                    .background(Color.orange)
                    .foregroundColor(.black)
                    .cornerRadius(30)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
            }
            
            
        }
        .padding()
    }
}

struct AllSetView_Previews: PreviewProvider {
    static var previews: some View {
        AllSetPageView(name: "John", username: "jDoe", password: "jjj", major: "Info Science", college: "Engineering", subjects: "chemistry, physics", bio: "hey I would love to help!", budget: 40.0, price: nil, availability: nil, img: "")
    }
}
