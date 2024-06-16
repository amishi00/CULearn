//
//  GetStarted.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//



import Foundation

import SwiftUI

struct GetStarted: View {
    var body: some View {
        NavigationStack{
            VStack {
                VStack(spacing: 20) {
                    Image("startPage")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 292)
                    
                    Text("CuLearn")
                        .font(.system(size: 36))
                        .foregroundColor(.orange)
                        .bold()
                    
                    Text("A personalized tutoring app for Cornell students")
                        .font(.system(size: 18))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.bottom,20)
                    
                    Text("Learn or teach anytime, anywhere")
                        .italic()
                        .font(.system(size: 16))
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.center)
                        
                    
                    NavigationLink(destination: LoginPageView()) {
                        Text("Get Started")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .frame(width: 275, height: 42)
                            .background(Color.orange)
                            .cornerRadius(30)
                    }
                }
                .padding(50)
                
                Spacer(minLength: 20)
                
                Text("An app made for App Dev's Hack Challenge")
                    .font(.system(size: 12))
                    .padding(.bottom)
            }
            .padding()
        }
    }
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        GetStarted()
    }
}


