//
//  urls.swift
//  movieAplication
//
//  Created by WKN-72 on 12/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import Foundation


var urlBase = "https://api.themoviedb.org/4/account/\(userId)/movie/"
var urlFavorites = urlBase + "favorites?page=1"
var urlRecomendations = urlBase + "recommendations?page=1"
var urlRated = urlBase + "rated?page=1"

var urlBaseImage = "https://image.tmdb.org/t/p/w500/"




