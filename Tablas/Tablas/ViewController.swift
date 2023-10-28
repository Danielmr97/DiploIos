//
//  ViewController.swift
//  Tablas
//
//  Created by Daniel Mayo on 27/10/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstTableView: UITableView!{
        didSet{
            firstTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    
    let model = TableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTableView.dataSource = self
    }
    

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell") as
//        }
//        cell?.backgroundColor = .green
//        cell?.textLabel?.text = model.getTitle(index: indexPath)
//        cell?.detailTextLabel?.text = model.getDescription(index: indexPath)
//        cell?.accessoryType = .disclosureIndicator
        
        cell?.myTitleLabel.text = model.getTitle(index: indexPath)
        cell?.myDescriptionLabel.text = model.getDescription(index: indexPath)
        
        return cell!
    }
    
    
}
