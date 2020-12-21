//
//  CurrencyVC.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import UIKit
import RxSwift
import RxCocoa
import RappleProgressHUD


class CurrencyVCRX: UIViewController {
    
    @IBOutlet weak var CurrencyTable: UITableView!
    //let interactor = GetCurrencyInteractor()
    let disposeBag = DisposeBag()

    let presenter = CurrencyPresenterRX()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CurrencyTable.tableFooterView = UIView()
        LoadingSubscribe()
        presenter.getData()
        subscribeToResponse()
        CurrencySelection()
      //  currencyValue()
    }
    
    
    func subscribeToResponse() {
        
        presenter.CurrencyObservable.subscribe(onNext: { data in
            
            self.title = "Base currency" + (data.base ?? "")
            
        }).disposed(by: disposeBag)
        
        presenter.CurrencySymbolObservable.bind(to: self.CurrencyTable.rx.items(cellIdentifier: "CurrencyCell", cellType: CurrencyCell.self)) { row , data , cell in
            
            cell.textLabel?.text = data.key
        } .disposed(by: disposeBag)
    }
    
    
    func CurrencySelection() {
        
        Observable.zip(CurrencyTable.rx.itemSelected, CurrencyTable.rx.modelSelected(Dictionary<String,Double>.self)).bind  { [weak self] selectedIndex ,  data in
            
            guard let self = self else {return}
            print(data)
          //  self.presenter.getCurrencyData(Index: selectedIndex.row)
            
           
        }.disposed(by: disposeBag)
    }
    

    
    func LoadingSubscribe(){
        
        presenter.loadingBehavior.subscribe(onNext: {[weak self] event in
            
            guard let self = self else {return}
            
            if event {
                
                self.showLoading()
            } else {
                
                
                self.hideLoading()
            }
            
        }).disposed(by: disposeBag)
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
