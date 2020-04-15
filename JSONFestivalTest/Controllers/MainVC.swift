//
//  ViewController.swift
//  JSONFestivalTest
//
//  Created by Nicholas Kearns on 4/15/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    
    var festivals: [Festival]!
    
    var table: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        
        
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromFile("festivals")
        setupTable()
        // Do any additional setup after loading the view.
    }
    
    
    func getDataFromFile(_ fileName:String) {
        let path = Bundle.main.path(forResource: fileName, ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            print(url)
            let contents = try? Data(contentsOf: url)
            if let data = contents {
                let decoder = JSONDecoder()

                do {
                    let festivalsFromJSON = try decoder.decode(Festivals.self, from: data)
//                    let filmsFromJSON = try decoder.decode([FilmEntryCodable].self, from: data)

                    festivals = festivalsFromJSON.festivals
//                    print(festivalsFromJSON)
                    print(festivals)
                    table.reloadData()
                } catch {
                    print("Parsing Failed")
                }
            }
        }
        
    }
    
    func setupTable() {
        self.view.addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
    }


}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return festivals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCell
        let currentFestival = festivals[indexPath.row]
        cell.configure(name: currentFestival.name, date: currentFestival.date, numArtists: currentFestival.lineup.count)
        return cell
    }
    
    
    
    
    
}

