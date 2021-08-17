//
//  ViewController.swift
//  myTableView
//
//  Created by Julie Connors on 8/17/21.
//

import UIKit

class ViewController: UITableViewController {
    
    let tvShowsStr = "https://api.tvmaze.com/shows/431/episodes"

    var episodes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .yellow
        fetchData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
        }
    
    func fetchData() {
        let decoder = JSONDecoder()
        if let url = URL(string: tvShowsStr) {
            let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
                    if let data = data {
                        if let shows = try? decoder.decode([Shows].self, from: data) {
                            for show in shows {
                                self.episodes.append(show.name)
                            }
//                            DispatchQueue.main.async {
//                                print(shows.first?.name ?? "")
//                            }
                        }
                    }
            })
        task.resume()
        print(episodes)
        }
    }
    
    struct Shows: Codable {
        let name: String
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.UITableViewCell
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? MyCell else {
                fatalError()
            }
            
//            cell.episodeName.text = "testing"
//            cell.idLabel.text = "Row: \(indexPath.row)"

            return cell
        }
}

