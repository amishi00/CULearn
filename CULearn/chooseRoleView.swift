//
//  chooseRoleView.swift
//  CULearn
//
//  Created by Amishi Gupta  on 5/2/24.
//


import SwiftUI
import Foundation

struct ChooseRoleView: View {
    let name: String
    let username: String
    let password: String
    let major: String
    let college: String
    
    let lightOrange = Color(red: 255/255, green: 150/255, blue: 27/255)
    
    var body: some View {
        VStack(spacing: 10) {
            Image("finalRole")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 278, height: 276)
            Text("Role")
                .font(.system(size: 30))
                .bold()
                .padding(.top, 20)
                .padding(.leading,32)
                .foregroundColor(.orange)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            Text("What are you here for?")
                .font(.system(size: 18))
                .padding(.bottom, 20)
                .padding(.leading,32)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            NavigationLink{ SubjectSelectionView(name: name, username: username, password: password, major: major, college: college)
                
            } label : {
                Text("I want to be tutored!")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 300,maxHeight: 42)
                    .background(lightOrange.opacity(0.51))
                    .cornerRadius(30)
            }
            
            NavigationLink{
                TutorSubjectSelectionView(name: name, username: username, password: password, major: major, college: college)
                
            } label : {
                Text("I want to tutor others!")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: 300,maxHeight: 42)
                    .background(lightOrange.opacity(0.51))
                    .cornerRadius(30)
            }
            .padding(.bottom, 40)
            
            HStack(spacing: 10) {
                ForEach(0..<4) { index in
                    Circle()
                        .fill(index == 1 ? Color.black : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.vertical)
            .padding(.top,15)
        }
        .padding()
    }
}

struct ChooseRoleView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseRoleView(name: "John Doe", username: "johndoe123", password: "password", major: "Computer Science", college: "College of Engineering")
    }
}


