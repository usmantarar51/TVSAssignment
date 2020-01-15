//
//  APIClient.swift
//  TvsAssignment
//
//  Created by Usman Tarar on 13/01/2020.
//  Copyright © 2020 Usman Tarar. All rights reserved.
//

import Alamofire
import Foundation

class APIClient {
    // MARK: - GET MEHTOD

    /// This is the generic webservice method of type 'GET' for web service calling
    ///
    /// - Parameters:
    ///   - action: service end point
    ///   - completionHandler: generic call back completion handler
    class func perform<T: Decodable>(route: APIRouter, completionHandler: @escaping (DataResponse<T>) -> ()) {
        Alamofire.request(route).responseObject { response in
            completionHandler(response)
        }
    }
}
