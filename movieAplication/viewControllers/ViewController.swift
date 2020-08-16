//
//  ViewController.swift
//  movieAplication
//
//  Created by WKN-72 on 12/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuList : [menuModel] = [menuModel]()
    var index  = 0
    @IBOutlet weak var menuListTableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView.isHidden = true
        menuList.append(.init(id: 1, menu: "Favoritos", image: "favs"))
        menuList.append(.init(id: 2, menu: "Ranqueadas", image: "rate"))
        menuList.append(.init(id: 3, menu: "Recomendaciones", image: "recomendations"))
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.networkStatusChanged(_:)), name: Notification.Name(rawValue: ReachabilityStatusChangedNotification), object: nil)
        Reach().monitorReachabilityChanges()

        if (BD.init().contarPelis() == 0) && !itsInternet(){// si no hay internet y no hay peliculas entonces alerta no hay intenret
            AlertImage.shared.showAlertImage(title: "Ups!", message: "No se encontro conexión a internet y no hay peliculas en cache", type: .failure, view: self.view, image: "worriedDin")
        }
        if itsInternet() {
            cargarDatosSQL()
        }
    }
    
    @objc func networkStatusChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let status = userInfo["Status"] as! String
            print(status)
            
            if itsInternet(){
                cargarDatosSQL()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuListTableView.dequeueReusableCell(withIdentifier: "menuListCell", for: indexPath) as! MenuListTableViewCell
        
            cell.name.text = menuList[indexPath.row].menu
            cell.imageMovie.image = UIImage.init(named: menuList[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "toMovieList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieList" {
            if let nextViewController = segue.destination as? MoviesViewController {
                nextViewController.categoria = menuList[index]
            }
        }
    }
    
    func cargarDatosSQL(){
        indicatorView.isHidden = false
        indicatorView.startAnimating()
        APIPetitions.init().getListMovies(url: urlFavorites){ (result) in
            let res = result as! movieResponse
            print(res)
            // si esta vacio entonces guardarlo
            if BD.init().contarPelis() == 0 {
                for pelicula in res.results{
                    BD.init().insertPeli(movie: pelicula, categoria: "1")
                }
            }// si no entonces verficar que no exista
            else {
                for pelicula in res.results{
                    if BD.init().verificarRegistro(id: pelicula.id) == 0{
                        BD.init().insertPeli(movie: pelicula, categoria: "1")
                    }
                }
            }
        }
        
        APIPetitions.init().getListMovies(url: urlRated){ (result) in
            let res = result as! movieResponse
            print(res)
            
            // si esta vacio entonces guardarlo
            if BD.init().contarPelis() == 0 {
                for pelicula in res.results{
                    BD.init().insertPeli(movie: pelicula, categoria: "2")
                }
            }// si no entonces verficar que no exista
            else {
                for pelicula in res.results{
                    if BD.init().verificarRegistro(id: pelicula.id) == 0{
                        BD.init().insertPeli(movie: pelicula, categoria: "2")
                    }
                }
            }
        }
        
        APIPetitions.init().getListMovies(url: urlRecomendations){ (result) in
            let res = result as! movieResponse
            print(res)
            self.indicatorView.isHidden = true
            self.indicatorView.stopAnimating()
            // si esta vacio entonces guardarlo
            if BD.init().contarPelis() == 0 {
                for pelicula in res.results{
                    BD.init().insertPeli(movie: pelicula, categoria: "3")
                }
            }// si no entonces verficar que no exista
            else {
                for pelicula in res.results{
                    if BD.init().verificarRegistro(id: pelicula.id) == 0{
                        BD.init().insertPeli(movie: pelicula, categoria: "3")
                    }
                }
            }
        }
    }
    
    func itsInternet() -> Bool{
        let status = Reach().connectionStatus()
        var result = false
        switch status {
        case .unknown, .offline:
            result = false
        case .online(.wwan):
            result = true
        case .online(.wiFi):
            result = true
        }
        return result
    }
}

