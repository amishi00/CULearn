////
////  ContentView.swift
////  CULearn
////
////  Created by Amishi Gupta on 4/29/24.
////
//
//import SwiftUI
//import Foundation
//
//struct ContentView: View {
//    var body: some View {
//            NavigationView {
//                List(recs, id: \.self) { rec in
//                    RecommendationCell(recommendation: rec)
//                }
//                .navigationTitle("Tutor Recommendations")
//            }
//        }
//    
//    struct RecommendationCell: View {
//        var recommendation: Tutor
//        
//        var body: some View {
//            VStack(alignment: .leading) {
//                HStack {
//                    Image(recommendation.profile_img)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 60, height: 60)
//                        .clipShape(Circle())
//                        .shadow(radius: 3)
//
//                    VStack(alignment: .leading) {
//                        Text(recommendation.name)
//                            .font(.headline)
//                        Text(recommendation.des)
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                    }
//
//                    Spacer()
//                    
//                    VStack {
//                        Text("\(recommendation.rating, specifier: "%.1f") ★")
//                            .bold()
//                        Text("\(recommendation.distance) miles away")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
//                }
//
//                HStack {
//                    Spacer()
//                    NavigationLink {
//                        GetStarted()
//                    } label: {
//                        Text("")
//                    
//                    }
//                    
//                }
//                .padding(.top, 5)
//            }
//            .padding()
//        }
//    }
//    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView()
//        }
//    }
//}
