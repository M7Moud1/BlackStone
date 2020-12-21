//
//  CurrencyPresenter.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import Foundation

protocol CurrencyView : class {
    
    func showLoading()
    func hideLoading()
    func onError(message : String)
    func getData(Base : String)
}

class CurrencyPresenter {
    
    
    private weak var view : CurrencyView?
    private let interactor = GetCurrencyInteractor()
    private var data : CurrencyModel?
    private var symbols = [String]()
    private var Values = [Double]()
    
    
    init(view : CurrencyView){
        
        self.view = view
    }
    
    func getData() {
        
        view?.showLoading()
        interactor.getCurrency { [weak self](data, error) in
            
            guard let self = self else { return }
            self.view?.hideLoading()
            
            if let error = error {
                
                self.view?.onError(message: error._message)
                
            } else {
                
                guard  let data = data else { return }
                self.data = data
                
                for (key , value) in data.rates! {
                    
                    self.symbols.append(key)
                    self.Values.append(value)
                }
                
                self.view?.getData(Base: data.base ?? "")
            }
        }
    }
    
    func getItemsSize() -> Int {
        
        return symbols.count
    }
    
    func getSymbol(index : Int) -> String {
        
      return symbols[index]
    }
    
    func getBaseVal() -> String {
        
        return data?.base ?? ""
    }
    
    func getSelectedCur(index : Int) -> String {
        
        return symbols[index] ?? ""
    }
    
    
    func getSelectedVal(index : Int) -> Double {
        
        return Values[index]
    }
}
