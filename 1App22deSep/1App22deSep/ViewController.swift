//
//  ViewController.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 22/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var phoroTypeSwitch: UISwitch!
    @IBOutlet weak var titlteLabel: UILabel!
    @IBOutlet weak var switchTexfielEdit: UISwitch!
    @IBOutlet weak var titleTextField: UITextField! {
        didSet {
            titleTextField.delegate = self
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if sender.tag == 1 {
            performSegue(withIdentifier: "SegueFromMainToPhotos", sender: nil)
        }
        else{
            performSegue(withIdentifier: "SegueFromMainToInfo", sender: nil)
        }
    }
    
    @IBAction func switchTexfieldEdit(_ sender: UISwitch) {
        sender.isOn ? (titlteLabel.text = "You can use") : (titlteLabel.text = "Is disable")
    }
    
    @IBAction func photoTypeSwitchValueChanged(_ sender: UISwitch) {
        sender.isOn ? nextButton.setTitle("Cats", for: .normal) : nextButton.setTitle("Dogs", for: .normal)
    }
    @IBAction func titleTextFieldEditingChanged(_ sender: UITextField) {
        titlteLabel.text = sender.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationViewController  = segue.destination as? ImageStackViewController {
            destinationViewController.showCat = phoroTypeSwitch.isOn
            switchTexfielEdit.isOn ? (
                destinationViewController.title = titleTextField.text) : (destinationViewController.title = "")
        }else {
            segue.destination.title = "Info"
        }
    }
    
}

extension ViewController : UITextFieldDelegate{
    //Validar lo que puede traer un textfield
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if switchTexfielEdit.isOn == false{
            return false
        }
        if string == "" { return true}
            if string.rangeOfCharacter(from: .alphanumerics) == nil && string != " "{
                return false
            }else {
                return ((textField.text?.count ?? 0) + string.count - range.length <= 10 )
            }
    }
}
