//
//  DetailViewController.swift
//  ios101-lab6-flix
//
//  Created by Lizzy Zhou on 4/2/24.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {


    @IBOutlet weak var backdropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var voteLabel: UILabel!
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    // Property to store the passed in movie
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        // Unwrap the optional vote average
        if let voteAverage = movie.voteAverage {

            // voteAverage is a Double
            voteLabel.text = "Vote Average: \(voteAverage)"
        } else {

            // if vote average is nil, set vote average label text to empty string
            voteLabel.text = ""
        }
        
        // Create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        // Unwrap the optional release date
        if let releaseDate = movie.releaseDate {

            // Use the the date formatter's `string(from: Date)` method to convert the date to a string
            let releaseDateString = dateFormatter.string(from: releaseDate)
            releaseDateLabel.text = "Release Date: \(releaseDateString)"
        } else {

            // if release date is nil, set release date label text to empty string
            releaseDateLabel.text = ""
        }
        
        // Unwrap the optional poster path
        if let posterPath = movie.posterPath,
           // Create a url by appending the poster path to the base url. https://developers.themoviedb.org/3/getting-started/images
           let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + posterPath) {

               // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
               Nuke.loadImage(with: imageUrl, into: posterImageView)
           }
        
        // Unwrap the optional backdrop path
        if let backdropPath = movie.backdropPath,
           // Create a url by appending the backdrop path to the base url. https://developers.themoviedb.org/3/getting-started/images
           let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500" + backdropPath) {

               // Use the Nuke library's load image function to (async) fetch and load the image from the image url.
               Nuke.loadImage(with: imageUrl, into: backdropImageView)
           }
        navigationItem.largeTitleDisplayMode = .never
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
