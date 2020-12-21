//
//  CurrencyRouter.swift
//  BlackStone
//
//  Created by mahmoud helmy on 12/21/20.
//

import Alamofire

enum CurrencyNetwork : URLRequestConvertible {
    
    var access_Key : String  {
        
       return "bf07f1af0d712deafb7f5350b87d69b8"

    }
    case Latest
    
    
    var headers : HTTPHeaders {
        
        return []
    }
    
    var method : HTTPMethod {
        
        switch self {
        
        case .Latest:
            return .get
      
        }
    }
    
    var parameters : [String : Any] {
        
        switch self {
            
        case .Latest:
            return [
                "access_key":access_Key
            ]
        
        }
    }
    
    
    var url : URL {
        
        let relativePath : String?
        
        switch self {
        case .Latest:
            relativePath = "http://data.fixer.io/api/latest"
       
        
        }
        
        let url = URL(string: relativePath ?? "")!
       
        return url
    }
    
    
    
    var encoding: ParameterEncoding {
           switch self {
           case .Latest:
               return URLEncoding.default
        
           }
       }
    
    func asURLRequest() throws -> URLRequest {
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        
        print(parameters)
        return try encoding.encode(request, with: parameters)
        
    }
}
