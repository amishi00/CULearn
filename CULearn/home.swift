//
//  home.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//

import Foundation
import SwiftUI
import SDWebImage



struct TutorCardView: View {
    let tutor: Tutor
    let placeholderImg = "https://i.pinimg.com/originals/87/d0/98/87d098d886d3fab2af463c09b65d7b44.jpg"
    let lightOrange = Color(red: 255/255, green: 150/255, blue: 27/255)
    let orangeFill = Color.orange.opacity(0.2)
    
    
    
    var body: some View {
        
        VStack {
            if let url = URL(string: tutor.img ?? placeholderImg) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100,height: 100)
                        .clipShape(Circle())
                        .padding(.bottom,10)
                        
//
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            
            Text(tutor.name)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 8)
                
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(tutor.bio)
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                
            HStack {
                let formattedPrice = String(format: "%.2f", tutor.price ?? 0.0)
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(orangeFill)
                        .frame(height: 25)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    HStack{
                        Text("Rate: ")
                            .bold()
                            .foregroundColor(.black)
                        Text("$\(formattedPrice)/hr")
                            .font(.subheadline)
                            .foregroundColor(.black)
                        
                            .padding(.vertical, 4)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 4)
            }
            
        }
        .frame(width: 170, height: 250)
        .background(Color.white)
        .cornerRadius(10)
    }

}

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isFiltering: Bool
    @Binding var selectedFilter: Filter
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.leading, 30)
                .padding(.vertical, 15)
                .background(.white.opacity(0.6))
                .cornerRadius(25)
                .overlay(
                    HStack {
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                                self.isFiltering = false
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                        }
                    }
                )
                .padding(.horizontal)
                .onTapGesture {
                    self.isFiltering = true
                }
            
            if isFiltering {
                Picker(selection: $selectedFilter, label: Text("")) {
                    Text("None").tag(Filter.none)
                    Text("Price").tag(Filter.filter1)
                   
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
                .padding(.trailing)
            }
        }
        
    }
}

enum Filter {
    case none, filter1
}

struct TutorProfileView: View {
    @State private var searchText = ""
    @State private var isFiltering = false
    @State private var selectedFilter: Filter = .none
    @State private var tutors: [Tutor] = []
    @State private var showingProfileView = false
    //@State private var isChatViewPresented = false
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
    let lightOrange = Color(red: 255/255, green: 150/255, blue: 27/255)
    let placeholderImg = "https://i.pinimg.com/originals/87/d0/98/87d098d886d3fab2af463c09b65d7b44.jpg"
    
    var body: some View {
        VStack{
            ZStack{
                Image("searchBar")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        if let url = URL(string: img ?? placeholderImg) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .clipShape(Circle())
                                    .padding(.leading,20)
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 42, height: 42)
                                    .clipShape(Circle())
                                    .padding(.leading,20)
                            }
                        }
                        Text("Hi "+name+"!")
                            .font(.system(size: 30))
                            
                            .padding(.bottom,5)
                            .padding(.top,25)
                            .padding(.leading,5)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                    SearchBar(searchText: $searchText, isFiltering: $isFiltering, selectedFilter: $selectedFilter)
                    
                }
            }

            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 10)], spacing: 10) {
                    ForEach(filteredTutors, id: \.self) { tutor in
                        NavigationLink{DetailedTutorView(tutor: tutor)}label: {
                            TutorCardView(tutor: tutor)
                        }
                    }
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        
        .onAppear {
            fetchTutors()
        }.overlay(
            // Fixed buttons at the bottom
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink{
                        ChatView(name: name, username: username, password: password, major: major, college: college, subjects: subjects, bio: bio, budget: budget, price: price, availability: availability ?? "", img: img ?? "")
                    }label : {
                        Image("Chat")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                    Spacer()
                    // Home button
                    Button(action: {
                        
                    }) {
                        Image("Home")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                        
                    }
                    .padding(.trailing)
                    Spacer()
                    
                    // Profile button
                    NavigationLink{
                        ProfileView(name: name, username: username, password: password, major: major, college: college, subjects: subjects, bio: bio, budget: budget, price: price, availability: availability ?? "", img: img ?? "")
                    } label :{
                        Image("Profile")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                }
                .background(.white)
            }
               
            
            
                .offset(y: 30), // Adjust the vertical position of the buttons
            alignment: .bottom
        )
    
    }
    
    var filteredTutors: [Tutor] {
        var filtered = tutors
        
        // Apply search text filter
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
        
        // Apply price filter
        switch selectedFilter {
        case .filter1: // Price filter
            filtered.sort { ($0.price ?? 0.0) < ($1.price ?? 0.0) }
        default:
            break
        }
        
        return filtered
    }
    
    
    func fetchTutors() {
        NetworkManager.shared.fetchTutors { tutors, error in
            if let tutors = tutors {
                self.tutors = tutors
            } else if let error = error {
                print("Error fetching tutors: \(error.localizedDescription)")
            }
        }
    }
}



struct TutorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TutorProfileView(name: "John", username: "jDoe", password: "jjj", major: "Info Science", college: "Engineering", subjects: "chemistry, physics", bio: "hey I would love to help!", budget: 40.0, price: nil, availability: nil, img: "")
    }
}

