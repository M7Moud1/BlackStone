//
//  CurrencyCalculation.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import UIKit

class CurrencyCalculation: UIViewController {
    
    var getBaseCur , getSelectedCur : String?
    
    var getBaseVal , getSelectedVal : Double?

    @IBOutlet weak var BaseCur: UILabel!
    
    @IBOutlet weak var SelectedCur: UILabel!
    
    
    @IBOutlet weak var BaseVal: UITextField!
    
    @IBOutlet weak var SelectedVal: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BaseCur.text = getBaseCur
        SelectedCur.text = getSelectedCur

        BaseVal.text = "\(getBaseVal ?? 0.0)"
        
        SelectedVal.text = "\(1.0 * (getSelectedVal ?? 0.0))"
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func Calculate(_ sender: Any) {
        
        let BaseValue = Double(BaseVal.text ?? "0.0")
        SelectedVal.text = "\(BaseValue! * (getSelectedVal ?? 0.0))"
    }
    
    
    @IBAction func Back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
