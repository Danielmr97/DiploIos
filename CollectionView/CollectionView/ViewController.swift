//
//  ViewController.swift
//  CollectionView
//
//  Created by Daniel Mayo on 03/11/23.
//

import UIKit

class ViewController: UIViewController {

    var dataArray = ["Primero","Segundo","Tercero"]
    var filterArrey: [String] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterArrey = dataArray
        tableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func sortAction(_ sender: Any) {
        if (tableView.isEditing ) {
            tableView.isEditing = false
        }else {
            tableView.isEditing = true
        }
    }
    
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterArrey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = filterArrey[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        "Cambiar posición de la celda"
        filterArrey.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
}


extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterArrey = []
        
        if searchText == "" {
            filterArrey = dataArray
        }
        
        for word in dataArray{
            if word.uppercased().contains(searchText.uppercased()){
                filterArrey.append(word)
            }
        }
        tableView.reloadData()
    }
}
