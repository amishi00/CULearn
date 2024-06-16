//
//  RecommendedTutorView.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//

import Foundation
import SwiftUI


struct RecommendedTutorView: View {
    var body: some View {
            NavigationView {
                List(recs, id: \.self) { rec in
                    RecommendationCell(recommendation: rec)
                }
                .navigationTitle("Recommended Tutors")
            }
        }
    
    struct RecommendationCell: View {
        var recommendation: Tutor
        
        var body: some View {
            VStack(alignment: .leading) {
                HStack {                    Image(recommendation.img ?? "han")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .shadow(radius: 3)

                    VStack(alignment: .leading) {
                        Text(recommendation.name)
                            .font(.headline)
                        Text(recommendation.bio)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        HStack {
                                                    if let price = recommendation.price {
                                                        let formattedPrice = String(format: "%.2f", price)
                                                        Text("$\(formattedPrice)/hr")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    } else {
                                                        Text("Price not available")
                                                            .font(.caption)
                                                            .foregroundColor(.secondary)
                                                    }
                        
                            NavigationLink {
                                
                            } label: {
                                Text("")
                            
                            }
                        }
                        
                    }
                    
                }
            
            }
            .padding()
        }
    }
    
    
}
struct Recommended: PreviewProvider {
    static var previews: some View {
        RecommendedTutorView()
    }
}

