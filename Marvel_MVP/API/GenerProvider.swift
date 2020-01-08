//
//  GenerProvider.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation


class GenericProvider: BaseProvider {
    
    //MARK: - Comics
    internal func getListComicsFromMarvel(_ endPoint : String,
                                          timestamp : String,
                                          apiKey : String,
                                          hash : String,
                                          success: @escaping(ComicsModel) -> (),
                                          failure: @escaping(APIError) -> ()){
        
        let urlArguments : [CVarArg] = [endPoint, timestamp, apiKey, hash]
        let lastUrlEndPoint = String(format: CONSTANTS.CALLSTOMARVEL.BASE_URL, arguments: urlArguments)
        
        requestGeneric(ComicsModel.self, endpoint: lastUrlEndPoint, method: .get)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        failure(error)
                }
            }) { (data) in
                success(data)
            }.cancel()
    }
    
}
