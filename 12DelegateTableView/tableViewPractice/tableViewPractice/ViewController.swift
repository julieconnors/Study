//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Julie Connors on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {
    
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"

    var episodes: [Shows] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let decoder = JSONDecoder()
        if let url = URL(string: tvShowsStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                    if let data = data {
                        if let shows = try? decoder.decode([Shows].self, from: data) {
                            for show in shows {
                                self.episodes.append(show)
                            }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                })
            task.resume()
        }
    }

    struct Shows: Codable {
        let name: String
        let airdate: String
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell") as? MyTableViewCell else {
            fatalError()
        }
        cell.episodeName.text = episodes[indexPath[1]].name
        
        let airdate = episodes[indexPath[1]].airdate
        cell.airdate.text = "Airdate: \(airdate)"
        
        return cell
    }
}

