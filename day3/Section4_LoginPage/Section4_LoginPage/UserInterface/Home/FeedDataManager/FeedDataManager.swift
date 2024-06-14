//
//  FeedDataManager.swift
//  Section4_LoginPage
//
//  Created by Jinyoung Leem on 5/7/24.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("", method:  .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) {
            response in
            switch response.result {
            case .success(let result):
                viewController.sucessAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}

