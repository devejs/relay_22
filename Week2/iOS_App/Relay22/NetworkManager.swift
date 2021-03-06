//
//  NetworkManager.swift
//  Relay22
//
//  Created by 조기현 on 2020/08/07.
//  Copyright © 2020 gicho. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    static let session: URLSession = URLSession.shared
    
	static func request(_ url: String, method: HttpMethod, body: Data? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        guard let url = URL(string: url) else { return }
		
		var request = URLRequest(url: url)
		request.httpMethod = method.rawValue
		if let body = body {
			request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
			request.httpBody = body
		}
        
		session.dataTask(with: request, completionHandler: completion).resume()
	}
}
