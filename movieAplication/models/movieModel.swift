//
//  movieModel.swift
//  movieAplication
//
//  Created by WKN-72 on 13/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import Foundation
import EVReflection

class movieModel : EVObject{
    var popularity : Float = 0.00
    var vote_count : Int = 0
    var video : Bool = false
    var poster_path : String = ""
    var id : Int = 0
    var adult : Bool = false
    var backdrop_path : String = ""
    var original_language: String = ""
    var original_title: String = ""
    var genre_ids: [Int] = [Int]()
    var title: String = ""
    var vote_average: Float = 0.00
    var overview: String = ""
    var release_date: String = ""
    var category : String = ""
}

class movieResponse : EVObject {
    var results : [movieModel] = [movieModel]()
}

struct menuModel {
    var id : Int
    var menu : String
    var image : String
}

