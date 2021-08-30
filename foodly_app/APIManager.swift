//
//  APICaller.swift
//  foodly_app
//
//  Created by Theodor Holmen Bjørnstad on 30/08/2021.
//

import Foundation
import Alamofire



enum APIManager: URLRequestConvertible {
    
    
    static let endpoint = URL(string: "https://private-anon-8ef53e3147-foodlyapp.apiary-mock.com")!
    
    case getAllRestaurants
    
    var path: String {
        switch self {
        
        case .getAllRestaurants:
            return "/restaurants/"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllRestaurants:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: APIManager.endpoint.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        //var parameters = Parameters()
        
        
        // add support for post requests
        
        return request
    }
    
    
    static func getAllRestaurants(onCompletion: @escaping ([Restaurant]) -> Void) {
        AF.request(APIManager.getAllRestaurants).responseJSON {(json) in
            if let jsonData = json.data {
                let jsonDecoder = JSONDecoder()
                let restaurants = try! jsonDecoder.decode([Restaurant].self, from: jsonData)
                onCompletion(restaurants)
            }
        }
    }
    
}
