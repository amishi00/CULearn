//
//  createProfileView.swift
//  CULearn
//
//  Created by Amishi Gupta on 5/2/24.
//


import Foundation
import SwiftUI

struct CreateProfileView: View {
    @State private var name: String = ""
    @State private var selectedMajorIndex = 0
    @State private var selectedCollegeIndex = 0
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var username: String = ""
    
    let majors = ["","Africana Studies",
                  "Agricultural Sciences",
                  "American Studies",
                  "Animal Science",
                  "Anthropology",
                  "Applied Economics and Management",
                  "Archaeology",
                  "Architecture",
                  "Asian Studies",
                  "Astronomy",
                  "Atmospheric Science",
                  "Biological Engineering",
                  "Biological Sciences",
                  "Biology & Society",
                  "Biomedical Engineering",
                  "Biometry and Statistics",
                  "Chemical Engineering",
                  "Chemistry",
                  "China and Asia-Pacific Studies",
                  "Civil Engineering",
                  "Classics (Classics, Classical Civ., Greek, Latin)",
                  "Cognitive Science",
                  "College Scholar",
                  "Communication",
                  "Comparative Literature",
                  "Computer Science",
                  "Design and Environmental Analysis",
                  "Earth and Atmospheric Sciences",
                  "Economics",
                  "Electrical and Computer Engineering",
                  "Engineering Physics",
                  "English",
                  "Entomology",
                  "Environment & Sustainability",
                  "Environmental Engineering",
                  "Feminist, Gender & Sexuality Studies",
                  "Fiber Science and Apparel Design",
                  "Fine Arts",
                  "Food Science",
                  "French",
                  "German Studies",
                  "Global & Public Health Sciences",
                  "Global Development",
                  "Government",
                  "Health Care Policy",
                  "History",
                  "History of Architecture (transfer students only)",
                  "History of Art",
                  "Hotel Administration",
                  "Human Biology, Health and Society",
                  "Human Development",
                  "Independent Major—Arts and Sciences",
                  "Independent Major—Engineering",
                  "Industrial and Labor Relations",
                  "Information Science",
                  "Information Science, Systems, and Technology",
                  "Interdisciplinary Studies",
                  "Italian",
                  "Jewish Studies",
                  "Landscape Architecture",
                  "Linguistics",
                  "Materials Science and Engineering",
                  "Mathematics",
                  "Mechanical Engineering",
                  "Music",
                  "Near Eastern Studies",
                  "Nutritional Sciences",
                  "Operations Research and Engineering",
                  "Performing and Media Arts",
                  "Philosophy",
                  "Physics",
                  "Plant Sciences",
                  "Public Policy",
                  "Psychology",
                  "Religious Studies",
                  "Science and Technology Studies",
                  "Sociology",
                  "Spanish",
                  "Statistical Science",
                  "Urban and Regional Studies",
                  "Viticulture and Enology"]
    
    let colleges = ["","The College of Agriculture & Life Sciences (CALS)","The College of Architecture, Art, and Planning (AAP)","The Cornell Jeb E. Brooks School of Public Policy","The College of Engineering", "The College of Human Ecology","The School of Industrial and Labor Relations","The College of Arts and Sciences","The Cornell SC Johnson College of Business"]
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Button(action: {
                    // Handle image upload
                }) {
                    Image( "finalSignUp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 276)
                        .foregroundColor(.gray)
                }
                
                Text("Sign Up")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading,56)
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text("Tell us a little bit about you!")
                    .font(.system(size: 18))
                    .padding(.bottom, 20)
                    .padding(.leading,56)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TextField("Name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 275) // Increase height
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 275) // Increase height
                
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 275) // Increase height
                
                SecureField("Confirm password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 275) // Increase height
                    .padding(.bottom,20)
                
                
                
                HStack{
                    Text("Major:")
                        .frame(alignment: .center)
                    Picker("Major", selection: $selectedMajorIndex) {
                        ForEach(0..<majors.count) { index in
                            Text(majors[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width:200, alignment: .center)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,56)
                .padding(.bottom, 10)
                HStack{
                    
                    Text("College:")
                        .frame(alignment: .center)
                    Picker("College", selection: $selectedCollegeIndex) {
                        ForEach(0..<colleges.count) { index in
                            Text(colleges[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(width:200, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,56)
                .padding(.bottom)
                
                
                
                
                HStack(spacing: 10) {
                    ForEach(0..<4) { index in
                        Circle()
                            .fill(index == 0 ? Color.black : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                NavigationLink(destination: ChooseRoleView(name: name, username: username, password: password, major: majors[selectedMajorIndex], college: colleges[selectedCollegeIndex])) {
                    Text("Continue")
                        .foregroundColor(.black)
                        .padding()
                        .frame(maxWidth: 275,maxHeight: 42)
                        .background(Color.orange)
                        .cornerRadius(30)
                    
                    
                    
                }
                .padding()
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}


