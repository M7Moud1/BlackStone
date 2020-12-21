//
//  CurrencyPresenter.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import Foundation
import RxSwift
import RxCocoa

class CurrencyPresenterRX {
    
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    private var interactor = GetCurrencyInteractor()
    private var CurrencyDataSubject = PublishSubject<CurrencyModel>()
    private var CurrencySymbol = PublishSubject<[String : Double]>()
    
    let disposeBag = DisposeBag()

    
    var currencyValue = BehaviorSubject(value: "0.0")
    var CurrencyObservable : Observable<CurrencyModel> {
        
        return CurrencyDataSubject
    }
    
    var CurrencySymbolObservable : Observable<[String : Double]> {
        
        return CurrencySymbol
    }
    
    func getData(){
        
        loadingBehavior.accept(true)
        
        interactor.getCurrency { [weak self](data, error) in
            
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            if let error = error {
                
                print(error._message)
            } else {
                guard let data = data else { return }
                
                
                self.CurrencyDataSubject.onNext(data)
                
//                var keys = [String]()
//                var Values = [Double]()
//
//                for (key , value) in data.rates! {
//                    keys.append(key)
//                    Values.append(value)
//
//                }
                
                self.CurrencySymbol.onNext(data.rates ?? [:])
            
                }
        }
    }
    
//    func getCurrencyData(Index : Int) {
//        
//        CurrencySymbol.subscribe(onNext: { event in
//            
//            print(event[In])
//            self.currencyValue.onNext(event[Index])
//            
//        }).disposed(by: disposeBag)
//    }
    
}
