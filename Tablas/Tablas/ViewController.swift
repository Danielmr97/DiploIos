//
//  ViewController.swift
//  Tablas
//
//  Created by Daniel Mayo on 27/10/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var firstTableView: UITableView!{
        didSet{
            firstTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }
    }
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addButton(_ sender: Any) {
        model.addRow(text: myTextField.text ?? "")
        firstTableView.reloadData()
    }
    let model = TableViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTableView.dataSource = self
        firstTableView.delegate = self
    }
    

}

extension ViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        model.getSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getCountArray()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        model.getSectionTitle()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell
        
        cell?.myTitleLabel.text = model.getTitle(index: indexPath)
        cell?.myDescriptionLabel.text = model.getDescription(index: indexPath)
        
        switch indexPath.section {
        case 0: cell?.backgroundColor = .brown
        case 1: cell?.backgroundColor = .green
        case 2 : cell?.backgroundColor = .orange
        default:
            cell?.backgroundColor = .white
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        "Delete"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.deleteRow(index: indexPath)
            tableView.reloadData()
        }
    }
    
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(model.getTitle(index: indexPath))
        performSegue(withIdentifier: "mySegueSecondView", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
