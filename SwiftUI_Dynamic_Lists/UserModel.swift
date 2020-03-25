//
//  UserModel.swift
//  SwiftUI_Dynamic_Lists
//
//  Created by Khadija Daruwala on 25/03/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import Foundation


struct UserModel: Decodable, Identifiable {
    public var id: Int
    public var name: String
    public var company: String
    public var description: String
    public var image: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case company = "company"
        case description = "description"
        case image = "image"
    }
}
