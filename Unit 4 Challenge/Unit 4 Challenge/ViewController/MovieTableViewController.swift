//
//  MovieTableViewController.swift
//  Unit 4 Challenge
//
//  Created by Eric Andersen on 9/21/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate {
    
    var movies: [EDAMovie]?
    
    @IBOutlet weak var movieSearchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
       movieSearchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        EDAMovieClient.fetchPosts(withSearchTerm: searchText) { (movies, error) in
            DispatchQueue.main.async {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell

        // Configure the cell...
        let movie = movies?[indexPath.row]
        cell?.movie = movie

        return cell ?? UITableViewCell()
    }
    
}
