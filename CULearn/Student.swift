//
//  Student.swift
//  CULearn
//
//  Created by Ashish Kumar on 5/2/24.
//

import Foundation
struct Student: Encodable, Hashable {
    let name : String
    let username: String
    let password: String
    let profile_img : String
    let bio : String
    let budget : Float
    let subjects: String
}
