//
//  File.swift
//  Challenge
//
//  Created by Felipe Martinez on 28/03/22.
//

import Foundation


public class User{
    public var Rented: Array<String> = []
    public var Favorite: Array<String> = []
    
    
    
    public func addFav(_ movie: String){
        self.Favorite.append(movie)
        print(Favorite)
    }
    public func deleteFav(_ String: String){
        if let index = Favorite.firstIndex(of: String) {
            Favorite.remove(at: index)
        }
    }
    public func addRent(_ String: String){
        Rented.append(String)
    }
}
