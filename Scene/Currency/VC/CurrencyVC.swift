//
//  CurrencyVC.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import UIKit


class CurrencyVC: UIViewController {
    
    @IBOutlet weak var CurrencyTable: UITableView!
    //let interactor = GetCurrencyInteractor()
    var presenter : CurrencyPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CurrencyTable.delegate = self
        CurrencyTable.dataSource = self
        CurrencyTable.tableFooterView = UIView()
        presenter = CurrencyPresenter(view: self)
        presenter?.getData()
    }
}

extension CurrencyVC : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter?.getItemsSize() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as! CurrencyCell
        
        cell.textLabel?.text = presenter?.getSymbol(index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "CurrencyCalculation") as! CurrencyCalculation
        
        vc.getBaseVal = 1.0
        vc.getBaseCur = (presenter?.getBaseVal())
        vc.getSelectedVal = presenter?.getSelectedVal(index: indexPath.row)
        vc.getSelectedCur = presenter?.getSelectedCur(index: indexPath.row)
        
        vc.modalPresentationStyle = .overCurrentContext
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
