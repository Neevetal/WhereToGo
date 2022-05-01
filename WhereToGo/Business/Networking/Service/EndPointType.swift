//
//  EndPointType.swift
//  WhereToGo
//
//  Created by Vitaly Malkov on 16.01.2022.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
   // var task: Task { get }
    var headers: HTTPHeaders { get }
}
