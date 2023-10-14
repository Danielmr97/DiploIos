//
//  ViewController.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 22/09/23.
//

import UIKit

class MainViewController: UIViewController {

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
        if sender.tag == 0 {
            segueToInfo()
        }
        else{
            segueForPhoto()
        }
    }
    func segueForPhoto(){
        guard let photosViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageStackViewController") as? ImageStackViewController else {return}
        photosViewController.showCat = phoroTypeSwitch.isOn
        if switchTexfielEdit.isOn{
            photosViewController.title = titleTextField.text
        }
        navigationController?.pushViewController(photosViewController, animated: true)
    }
    
    func segueToInfo(){
        let infoViewControler = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "infoViewControler")
        infoViewControler.title = "Info"
        navigationController?.pushViewController(infoViewControler, animated: true)
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
    
    
}

extension MainViewController : UITextFieldDelegate{
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
