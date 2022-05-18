//
//  ViewController.swift
//  lv1_ios_Vorgic
//
//  Created by student on 26.04.2022..
//

import UIKit

class ListViewController: UIViewController, EntryViewProtocol, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinacije.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        
        let d = destinacije[indexPath.row]
        cell.textLabel?.text=d.ime
        cell.detailTextLabel?.text=d.opis
        return cell
    }
    
    var destinacije: [Destination] = []
    @IBOutlet weak var tableView: UITableView!
    
    
    func kreiranaNova(destinacija: Destination) {
        destinacije.append(destinacija)
        tableView.reloadData()
        
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(destinacije)
            UserDefaults.standard.setValue(data, forKey: "moje_destinacije")
            UserDefaults.standard.synchronize()
        } catch {
            print(error)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "moje_destinacije") {
                    do {
                        try destinacije = decoder.decode([Destination].self, from: data)
                    } catch {
                        print(error)
                    }
    }
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryVC = segue.destination as? EntryViewController {
            entryVC.delegate = self
        }
    }
}

