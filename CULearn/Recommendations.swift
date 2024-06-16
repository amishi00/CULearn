//
//  Recommendations.swift
//  CULearn
//
//  Created by Amishi Gupta on 4/29/24.
//


import Foundation
import SwiftUI

struct Tutor: Encodable, Hashable, Decodable {
    var id : Int
    var username: String
    var name: String
    var password: String
    var bio: String
    var img: String?
    var price: Float?
    var subjects: String
    var availability: String

    
}
struct Tutors: Codable{
    let users : [Tutor]
}
struct Rating {
    var id : Int
    var student_id: Int
    var tutor_id : Int
    var comment: String
}
var recs = [
    Tutor( id : 1, username:"kath", name: "Kathleen",password:"1234444", bio: "Need help with PHYS 1112? Look no further.", img: "alden", price: 45.0, subjects:"Math,CS",availability: "MWF")]
