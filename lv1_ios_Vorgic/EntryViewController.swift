//
//  EntryViewController.swift
//  lv1_ios_Vorgic
//
//  Created by student on 26.04.2022..
//

import UIKit

protocol EntryViewProtocol: AnyObject {
    func kreiranaNova(destinacija: Destination)
}


class EntryViewController: UIViewController {
    
    
    @IBOutlet weak var nazivLabel: UILabel!
    @IBOutlet weak var opisLabel: UILabel!
    @IBOutlet weak var nazivTextfield: UITextField!
    @IBOutlet weak var opisTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!

    weak var delegate: EntryViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    title = "Unos destinacije"
        nazivLabel.text="Naziv:"
        opisLabel.text="Opis:"
        saveButton.setTitle("Spremi",for: .normal)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapButton(_ sender: Any) {
        guard let naziv = nazivTextfield.text, naziv.count > 3 else {
            return
        }
        
        guard let opis = opisTextField.text, opis.count > 3  else {
            return
        }
        
        
        let d = Destination(ime: naziv, opis: opis )
        
        delegate?.kreiranaNova(destinacija: d)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
