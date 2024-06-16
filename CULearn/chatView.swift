//
//  File.swift
//  A4
//
//  Created by Ashish Kumar on 5/4/24.
//


import Foundation
import SwiftUI
import SDWebImage

import SwiftUI

struct Chat: Identifiable {
    let id = UUID()
    let tutorName: String
    let tutorImage: String
    let lastMessage: String
}

struct ChatCell: View {
    let chat: Chat
    let placeholderImg = "https://i.pinimg.com/originals/87/d0/98/87d098d886d3fab2af463c09b65d7b44.jpg"
    var body: some View {
        HStack(spacing: 10) {
            if let url = URL(string: chat.tutorImage ?? placeholderImg) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
        
                
            VStack(alignment: .leading, spacing: 5) {
                Text(chat.tutorName)
                    .font(.headline)
                Text(chat.lastMessage)
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(10)
    }
}

struct ChatView: View {
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
    let chats: [Chat] = [
        Chat(tutorName: "Cinnamon", tutorImage: "https://static.wikia.nocookie.net/p__/images/f/f9/MyMelody.png/revision/latest?cb=20210824094453&path-prefix=protagonist", lastMessage: "Hey, can we meet tomorrow at Zeus?"),
        Chat(tutorName: "Evan", tutorImage: "https://images.pexels.com/photos/3474629/pexels-photo-3474629.jpeg?cs=srgb&dl=pexels-mododeolhar-3474629.jpg&fm=jpg", lastMessage: "Sure, what time works for you?"),
        Chat(tutorName: "Amy", tutorImage: "https://images.pexels.com/photos/3813342/pexels-photo-3813342.jpeg?cs=srgb&dl=pexels-olly-3813342.jpg&fm=jpg", lastMessage: "I'm available after 4 PM."),
        Chat(tutorName: "Avery", tutorImage: "https://media.istockphoto.com/id/1196391449/photo/portrait-of-african-woman.jpg?s=612x612&w=0&k=20&c=b-hwtJGyg5Y-hwG-9id9D3hb71TmaqyDlfU-Ps3GA2s=", lastMessage: "Great! Let's meet at the library."),
        Chat(tutorName: "Shannon", tutorImage: "https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVhZCUyMHNob3R8ZW58MHx8MHx8fDA%3D", lastMessage: "Hey, wanna meet in duffield?."),
        Chat(tutorName: "Davidrus", tutorImage: "https://static.wikia.nocookie.net/wizardsofwaverlyplace/images/d/df/Justin_Russo_2.jpg/revision/latest?cb=20200105221702", lastMessage: "Yes, I would be able to meet in person tomorrow."),
        Chat(tutorName: "Amishi", tutorImage: "https://www.allrecipes.com/thmb/UV3EA5o1UjF0IGo2JciyAMrCXcg=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/290890_original-f425d458ea2b4cec8d4a855ce6929707.jpg", lastMessage: "Yes! Looking forward to teach you Math!."),
        Chat(tutorName: "Kathy", tutorImage: "https://i.pinimg.com/originals/87/d0/98/87d098d886d3fab2af463c09b65d7b44.jpg", lastMessage: "I am available next Wednesday.")
        
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("Chats")
                    .font(.system(size: 30))
                    .bold()
                    .padding(.top,10)
                    .padding(.bottom,5)
                    .padding(.leading,10)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
            
                
                ForEach(chats) { chat in
                    NavigationLink(destination: Text("Chat detail for \(chat.tutorName)")) {
                        ChatCell(chat: chat)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.primary)
                    Divider()
                }
            }
            .padding(.vertical, 10)
        }
        .navigationTitle("Chats")
        .navigationBarBackButtonHidden(true)
        .overlay(
            // Fixed buttons at the bottom
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    // Chat button
                    Button(action: {
                       
                    }) {
                        Image("orangeChat")
                            .font(.title)
                            .frame(width: 42.05,height:42.05)
                            .padding()
                    }
                    .padding(.trailing)
                    Spacer()
                    // Home button
                    NavigationLink{
                        TutorProfileView(name: name, username: username, password: password, major: major, college: college, subjects: subjects, bio: bio, budget: budget, price: price, availability: availability ?? "", img: img ?? "")
                    }label:{
                        Image("blackHome")
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
                .padding()
                .background(.white)
            }
            
                
            
                .offset(y: 30),
            alignment: .bottom
        )
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatView(name: "John", username: "jDoe", password: "jjj", major: "Info Science", college: "Engineering", subjects: "chemistry, physics", bio: "hey I would love to help!", budget: 40.0, price: nil, availability: nil, img: "")
        }
        .navigationBarBackButtonHidden(true)
    }
}
