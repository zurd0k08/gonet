//
//  DetailViewController.swift
//  movieAplication
//
//  Created by WKN-72 on 14/08/20.
//  Copyright © 2020 Jose Pablo Perez Estrada. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var backdropImg: UIImageView!
    @IBOutlet weak var posterImg: UIImageView!
    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var overviewTxt: UITextView!
    @IBOutlet weak var contentView: UIView!
    
    var movie : movieModel = movieModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backdropImg.RoundImage()
        posterImg.RoundImage()
        
        rateView.setGradientBackground(colorOne: color1, colorTwo: color2)
        contentView.RoundAndShadowView()
        rateView.RoundAndShadowView()
        
        self.view.setGradientBackground(colorOne: color1, colorTwo: color2)
        titleLbl.text! = movie.title
        backdropImg.kf.setImage(with: URL(string: urlBaseImage + movie.backdrop_path))
        posterImg.kf.setImage(with: URL(string: urlBaseImage + movie.poster_path))
        rateLbl.text! = String(format: "%.1f", movie.vote_average)
        overviewTxt.text! = movie.overview
        
    }
    
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

   

}
