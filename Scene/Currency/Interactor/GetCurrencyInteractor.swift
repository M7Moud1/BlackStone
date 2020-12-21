//
//  GetCurrencyInteractor.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import Alamofire

class GetCurrencyInteractor {
    
    func getCurrency(CompletionHandler : @escaping (CurrencyModel? , ErrorModel?) -> Void) {
        
        AF.request(CurrencyNetwork.Latest).responseJSON { (response) in
            
            if response.response?.statusCode == 200 {
                
                switch response.result {
                case .success(let value):
                    
                    do {
                        let data = try JSONDecoder().decode(CurrencyModel.self, from: response.data!)
                        CompletionHandler(data , nil)
                        
                    } catch {
                        
                        print(error)
                        
                        let errorModel = ErrorModel()
                        errorModel._message = error.localizedDescription
                        
                        CompletionHandler(nil , errorModel)
                    }
                case .failure(let error):
                    let errorModel = ErrorModel()
                    errorModel._message = error.localizedDescription
                    
                    CompletionHandler(nil , errorModel)

                }
            }
        }
    }
}

