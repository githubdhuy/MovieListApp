//
//  ViewController.swift
//  MovieListApp
//
//  Created by Huy on 05/09/2023.
//

import UIKit

class MovieListViewController: UIViewController {

    let cellId = "cellId"
    
    let tableView = UITableView()
    
    var movies: [MovieModel] = MovieModel.getSampleDatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = tableView
        tableView.backgroundColor = .white
        title = "Movies"
        
        let sortButton = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(handleSort))
        
        self.navigationItem.rightBarButtonItem = sortButton
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func handleSort() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let alertAction1 = UIAlertAction(title: "Title", style: .default) {[weak self] _ in
            guard let self = self else { return }
            
            self.movies = self.movies.sorted(by: {$0.title < $1.title})
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        alertAction1.titleTextColor = .gray
        
        let alertAction2 = UIAlertAction(title: "Released Date", style: .default) {[weak self] _ in
            guard let self = self else { return }
            self.movies = self.movies.sorted(by: { (movie1, movie2) in
                let date1 = movie1.releasedDate.asDate(dateFormat: "d MMM yyyy")!.timeIntervalSince1970
                let date2 = movie2.releasedDate.asDate(dateFormat: "d MMM yyyy")!.timeIntervalSince1970//yyyy/MM/dd
                
                return date1 < date2
            })
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        alertAction2.titleTextColor = .gray
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        cancelAction.titleTextColor = .black
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        alertController.addAction(cancelAction)
        
        
        self.present(alertController, animated: true)
    }
    
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = MovieDetailViewController()
        viewController.movieModel = movies[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieTableViewCell
        
        let movieItem = movies[indexPath.row]
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: movieItem.releasedDate.asDate(dateFormat: "d MMM yyyy")!)
        
        cell.thumbnailImageView.image = UIImage(named: movieItem.imageString)
        cell.titleLabel.text = "\(movieItem.title)" + "(" + "\(year)" + ")"
        cell.subtitleLabel.text = "\(movieItem.duration)-\(movieItem.genre.joined(separator: ", "))"
        if UserModel.current.watchListIds.contains(movieItem.id) {
            cell.onMyWatchListLabel.isHidden = false
        } else {
            cell.onMyWatchListLabel.isHidden = true
        }
        
        
        return cell
    }
}


