//
//  imageExtension.swift
//  movieAplication
//
//  Created by WKN-72 on 14/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import  UIKit

extension UIImageView{
    

    func RoundImage() {
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
   
    
}
