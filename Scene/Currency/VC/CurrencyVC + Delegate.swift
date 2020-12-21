//
//  CurrencyVC + Delegate.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import UIKit
import RappleProgressHUD

extension CurrencyVC : CurrencyView {
    func onError(message: String) {
        
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func getData(Base: String) {
            
        self.title = "Base currency \(Base)"
        CurrencyTable.reloadData()

    }
    
    func showLoading(){
        
        let atrribute = RappleActivityIndicatorView.attribute(style: .apple, tintColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), screenBG: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), progressBG: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 0), progressBarBG: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), progreeBarFill: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), thickness: 20)

        RappleActivityIndicatorView.startAnimatingWithLabel("", attributes: atrribute)
        RappleActivityIndicatorView.setProgress(2.0)
        
    }


    func hideLoading(){
        
        RappleActivityIndicatorView.stopAnimation()
    }
}
