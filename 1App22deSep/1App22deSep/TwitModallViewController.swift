//
//  TwitModallViewController.swift
//  1App22deSep
//
//  Created by Daniel Mayo on 29/09/23.
//

import UIKit

class TwitModallViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        MessageTexView.text = ""
    }

    @IBOutlet weak var MessageTexView: UITextView! {
        didSet{
            MessageTexView.delegate = self
        }
    }
    
    @IBOutlet weak var SendingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SendInfoButton(_ sender: UIButton) {
        print(MessageTexView.text)
    }
}

extension TwitModallViewController : UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == ""{return true }
        if text.rangeOfCharacter(from: .alphanumerics) == nil && text != " "{
            return false
        } else {
            return ((textView.text?.count ?? 0) + text.count - range.length <= 150)
        }
    }
}
