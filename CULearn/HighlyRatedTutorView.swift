////
////  HighlyRatedTutorView.swift
////  CULearn
////
////  Created by Ashish Kumar on 5/2/24.
////
//
//import Foundation
//import SwiftUI
//
//
//struct HighlyRatedTutorView: View {
// var body: some View {
////                NavigationView {
////                    List(recs.sorted { $0.rating > $1.rating }, id: \.self) { rec in
////                        RecommendationCell(recommendation: rec)
////                    }
////                    .navigationTitle("Highly Rated Tutors")
////                    .navigationBarBackButtonHidden(true)
////                }
//            
//        }
//    
////    struct RecommendationCell: View {
////        var recommendation: Tutor
////        
////        var body: some View {
////            VStack(alignment: .leading) {
////                HStack {
////                    Image(recommendation.image)
////                        .resizable()
////                        .aspectRatio(contentMode: .fill)
////                        .frame(width: 60, height: 60)
////                        .clipShape(Circle())
////                        .shadow(radius: 3)
////
////                    VStack(alignment: .leading) {
////                        Text(recommendation.name)
////                            .font(.headline)
////                        Text(recommendation.des)
////                            .font(.subheadline)
////                            .foregroundColor(.secondary)
////                        
////                        HStack {
////                            Text("\(recommendation.rating, specifier: "%.1f") ★")
////                                                        .bold()
////                                                    if let price = recommendation.price {
////                                                        let formattedPrice = String(format: "%.2f", price)
////                                                        Text("$\(formattedPrice)/hr")
////                                                            .font(.caption)
////                                                            .foregroundColor(.secondary)
////                                                    } else {
////                                                        Text("Price not available")
////                                                            .font(.caption)
////                                                            .foregroundColor(.secondary)
////                                                    }
////                        
////                            NavigationLink {
////                                
////                            } label: {
////                                Text("")
////                            
////                            }
////                        }
////                        
////                    }
////                    
////                }
////            
////            }
////            .padding()
////        }
////    }
////    
//    
//}
//struct Highly_prev: PreviewProvider {
//    static var previews: some View {
//        HighlyRatedTutorView()
//    }
//}
//
