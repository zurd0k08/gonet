//
//  MoviesViewController.swift
//  movieAplication
//
//  Created by WKN-72 on 13/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit
import Kingfisher

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var tituloLbl: UILabel!
    
    @IBOutlet weak var frontView: UIView!
    var categoria : menuModel!
    var movies : [movieModel] = [movieModel]()
    
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    var filteredMovies = [movieModel]()
    var movieSeleccionada = movieModel()
    var fromMovies = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLbl.text! = categoria.menu
        movies  = BD.init().consultarXcategoria(id: categoria.id)
        moviesTableView.reloadData()
        creatingSearhBar()
        tableSettings()
        frontView.setGradientBackground(colorOne: color1, colorTwo: color2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.moviesTableView {
            return movies.count
        }
        else {
            return filteredMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        if tableView == moviesTableView{
            cell.movieImage.kf.setImage(with: URL(string: urlBaseImage + movies[indexPath.row].poster_path  ))
            cell.movieTitle.text = movies[indexPath.row].title
            cell.movieLanguage.text = movies[indexPath.row].original_language
            cell.movieRate.text = String(movies[indexPath.row].vote_average)
        }
        else {
            cell.movieImage.kf.setImage(with: URL(string: urlBaseImage + filteredMovies[indexPath.row].poster_path  ))
            cell.movieTitle.text = filteredMovies[indexPath.row].title
            cell.movieLanguage.text = filteredMovies[indexPath.row].original_language
            cell.movieRate.text = String(filteredMovies[indexPath.row].vote_average)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == moviesTableView{
            movieSeleccionada = movies[indexPath.row]
        }
        else {
            movieSeleccionada = filteredMovies[indexPath.row]
        }
        
        if searchController.isActive{
            searchController.isActive = false
        }
        
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let nextViewController = segue.destination as? DetailViewController {
                nextViewController.movie = movieSeleccionada
            }
        }
    }
    
    func creatingSearhBar() {
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.moviesTableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
    }
    
    func tableSettings() {
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.resultsController.tableView.rowHeight = 204
        self.resultsController.tableView.separatorStyle = .none
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.filteredMovies = self.movies.filter { (movie: movieModel) -> Bool in
            if movie.title.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                return true
            } else{
                return false
            }
        }
        self.resultsController.tableView.reloadData()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
