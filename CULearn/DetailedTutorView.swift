//
//  DetailedTutorView.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/4/24.
//

import Foundation
import SwiftUI

struct DetailedTutorView: View {
    let tutor: Tutor
    @State private var reviewText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Display tutor's image
                AsyncImage(url: URL(string: tutor.img ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width, height: 250)
                        .clipped()
                } placeholder: {
                    // Placeholder image or loading indicator
                    ProgressView()
                }
                .frame(height: 250)
                
                // Tutor's name
                Text(tutor.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                // Tutor's subjects
                Text("Subjects: \(tutor.subjects)")
                    .font(.headline)
                    .padding(.horizontal)
                HStack{
                    Text("Major: ")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("Asian Studies")
                        .font(.body)
                        
                }
                HStack{
                    Text("College: ")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("The College of Arts and Sciences")
                        .font(.body)
                        
                }
                
                HStack{
                    Text("Availability: ")
                        .font(.headline)
                        .padding(.horizontal)
                    Text("MWF 5:30pm - 9pm")
                        .font(.body)
                       
                }
            
                // Tutor's bio
                Text(tutor.bio)
                    .font(.body)
                    .padding(.horizontal)
                
                // Tutor's price
                HStack {
                    Text("Price:")
                        .font(.headline)
                    Text("$\(String(format: "%.2f", tutor.price ?? 0.0))/hr")
                        .font(.headline)
                }
                .padding(.horizontal)
                
                Text("Write a Review:")
                    .font(.headline)
                    .padding(.horizontal)
                
                // Multiline TextField
                TextField("Enter your review here", text: $reviewText)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)
                
                
                
        
                
                Spacer()
            }
        }
        .navigationBarTitle(tutor.name, displayMode: .inline)
    }
}

struct DetailedTutorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedTutorView(tutor: Tutor(id: 1, username: "kath", name: "Kathleen", password: "1234444", bio: "Need help with PHYS 1112? Look no further.", img: "alden", price: 45.0, subjects: "Math,CS", availability: "MWF"))
    }
}
