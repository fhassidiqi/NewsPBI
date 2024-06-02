//
//  Logger.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation
import Alamofire

final class Logger: EventMonitor {
    let queue = DispatchQueue(label: "Network-Logger")
    
    func requestDidResume(_ request: Request) {
        print("Resuming: \(request)")
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        let responseText = String(data: response.data ?? Data(), encoding: .utf8) ?? ""
        debugPrint("Response is: \(responseText)")
    }
}
