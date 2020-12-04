//
//  ViewController.swift
//  ControlHW
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textTableView: UITableView!
    
    
    private var controls = ["Slider","Segmented Control", "TextField", "Stepper", "Switch"]
    private var values:[Any] = [0.5, 1, "Default Text", 1, true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textTableView.dataSource = self
        self.textTableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let control = self.controls[indexPath.row]
        let value = self.values[indexPath.row]
        cell.textLabel?.text = "\(control): \(value)"
        return cell
    }
}

extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC = storyboard.instantiateViewController(identifier: "EditViewController") as! EditViewController
        let textToEdit = self.values[indexPath.row]
        editVC.editText = textToEdit as? String
        editVC.delegate = self
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}

extension ViewController: editViewControllerDelegate {
    func update(with newText: String) {
        if let selectedIndex = self.textTableView.indexPathForSelectedRow?.row{
            self.values[selectedIndex] = newText
            self.textTableView.reloadData()
        }
    }
    
    
}
