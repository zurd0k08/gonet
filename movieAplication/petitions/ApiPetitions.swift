//
//  ApiPetitions.swift
//  movieAplication
//
//  Created by WKN-72 on 13/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import Foundation
import Alamofire

class APIPetitions {
    
    func getListMovies(url : String, completionhandler:@escaping (Any) -> ()){
        let headers : HTTPHeaders = [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(accessToken)"
        ]
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default, headers: headers).responseObject{(response: DataResponse <movieResponse>) in
            completionhandler(response.result.value!)
        }
    }
    
}
