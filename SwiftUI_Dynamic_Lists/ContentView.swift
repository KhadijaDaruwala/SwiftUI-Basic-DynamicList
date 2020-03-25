//
//  ContentView.swift
//  SwiftUI_Dynamic_Lists
//
//  Created by Khadija Daruwala on 25/03/20.
//  Copyright © 2020 Khadija Daruwala. All rights reserved.
//

import SwiftUI
import Foundation
struct ContentView: View {
    
    //    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    //    var users = (UIApplication.shared.delegate as! AppDelegate).users
    @ObservedObject var fetcher = FetchUser()
    
    var body: some View {
        NavigationView{
            List(fetcher.users){ user in
                //User row
                VStack(alignment: .leading){
                    HStack{
                        Image(user.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                           .overlay(Circle().stroke(Color.black, lineWidth:4))
                            //.clipped()
                            
                        VStack(alignment: .leading){
                            Text(user.name).font(.headline)
                            Text(user.company).font(.subheadline)
                            
                        }.padding(.leading, 8)
                    }.padding(.bottom, 8)
                    Text(user.description).lineLimit(nil)
                }.padding(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }.navigationBarTitle(Text("Dynamic List"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
