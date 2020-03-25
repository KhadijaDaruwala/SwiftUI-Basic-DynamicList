//
//  FetchUser.swift
//  SwiftUI_Dynamic_Lists
//
//  Created by Khadija Daruwala on 25/03/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import Foundation
public class FetchUser: ObservableObject {
    @Published var users = [UserModel]()
    
    init(){
        load()
    }
    
    func load() {
        
        if let path = Bundle.main.path(forResource: "UserDataJson", ofType: "json") {
            do {
                let d = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodedLists = try JSONDecoder().decode([UserModel].self, from: d)
                DispatchQueue.main.async {
                    self.users = decodedLists
                }
                
            } catch {
                print ("Error while getting data from json \(error)")
            }
        }
    }
}


//if let path = Bundle.main.path(forResource: "UserDataJson", ofType: "json") {
//         do {
//             //                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
//             //                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//             //                if let json = jsonResult as? [[String: AnyObject]]{
//             //                            print("My json: \(json)")
//             //                  }
//
//             let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//             let jsonDecoder = JSONDecoder()
//             let jsonResult = try jsonDecoder.decode(UserModel.self, from:  data)
//             if let data = jsonResult.data{
//                  self.users = data
//             }
//
//         } catch {
//             print("Json file could not be accessed \(error)")
//         }
//     }
