//
//  EditViewController.swift
//  ControlHW
//
//  Created by Field Employee on 12/3/20.
//

import UIKit

protocol editViewControllerDelegate {
    func update(with newText: String)
}

class EditViewController: UIViewController {
    
//

    @IBOutlet weak var theTextField: UITextField!
//    @IBAction func theSlider(_ sender: Any) {
//        sliderVal = self.value(forKey: ) as! Double
//    }
    
    
    @IBAction func theSlider(_ sender: UISlider) {
        sliderVal = self.value(forKey: <#T##String#>) as! Float
    }
    
    @IBAction func theSegControl(_ sender: UISegmentedControl) {
    }
    
    @IBAction func theSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func theStepper(_ sender: UIStepper) {
    }
    
    var stepperVal: Double
    var switchOn: Bool
    var segControlVal: ([Any]?)
    var sliderVal: Float?
    var editText: String?
    var delegate: editViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.theTextField.text = self.editText
        self.theSlider.value = self.sliderVal
        self.theSegControl(.init(items: <#T##[Any]?#>))
        self.theSwitch(.init(frame: CGRect))
        self.theStepper.value = self.stepperVal
        
    }
    
    @IBAction func saveText(_ sender: Any) {
        
        self.delegate?.update(with: self.theTextField.text ?? "default" )
        
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func saveSlider(_ sender: Any) {
//        self.delegate?.update(with: String(sliderVal))
//    }
}
