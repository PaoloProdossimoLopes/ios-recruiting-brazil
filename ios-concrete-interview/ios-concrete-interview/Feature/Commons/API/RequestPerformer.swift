//
//  RequestPerformer.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

import Foundation

class RequestPerformer {
    
    func perform<T: Decodable>(
        request: Request, _ completion: @escaping ((Result<T, APIErrors>) -> Void)
    ) {
        
        guard let url = URL(string: request.url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] dataRaw, responseRaw, errorRaw in
            guard let self = self else { return }
            
            guard let response = responseRaw as? HTTPURLResponse else { return }
            print("DEBUG: URL -> (\(String(describing: response.url)))")
            print("DEBUG: STATUS CODE ->", response.statusCode)
            
            if let error = errorRaw {
                print("DEBUG: Error ->", error.localizedDescription)
            }
            
            self.statusCodeHandler(
                statusCode: response.statusCode,
                data: dataRaw,
                completion: completion
            )
        }
        task.resume()
    }
    
    private func statusCodeHandler<T: Decodable>(statusCode: Int, data: Data?, completion: @escaping ((Result<T, APIErrors>) -> Void)) {
        switch statusCode {
        case HTTPStatusCodeConstant.ok.code:
            self.handleDecodeObject(data: data, completion)
            
        case HTTPStatusCodeConstant.noContent.code:
            completion(.failure(.noContet))
            
        case HTTPStatusCodeConstant.badRequest.code:
            completion(.failure(.badRequest))
            
        case HTTPStatusCodeConstant.forbidden.code:
            completion(.failure(.forbidden))
            
        case HTTPStatusCodeConstant.unauthorized.code:
            completion(.failure(.unauthorized))
            
        case HTTPStatusCodeConstant.notFound.code:
            completion(.failure(.notFound))
            
        case HTTPStatusCodeConstant.proxyAuthenticationRequired.code:
            completion(.failure(.proxyAuthenticationRequired))
            
        case HTTPStatusCodeConstant.requestTimeout.code:
            completion(.failure(.requestTimeout))
            
        case HTTPStatusCodeConstant.tooManyRequests.code:
            completion(.failure(.tooManyRequests))
            
        case HTTPStatusCodeConstant.internalServerError.code:
            completion(.failure(.internalServerError))
            
        case HTTPStatusCodeConstant.badGatway.code:
            completion(.failure(.badGatway))
            
        case HTTPStatusCodeConstant.serviceUnavailable.code:
            completion(.failure(.serviceUnavailable))
            
        case HTTPStatusCodeConstant.gatewayTimeout.code:
            completion(.failure(.gatewayTimeout))
            
        default: break
        }
    }
    
    private func handleDecodeObject<T: Decodable>(data: Data?, _ completion: @escaping ((Result<T, APIErrors>) -> Void)) {
        guard let data = data else {
            completion(.failure(.dataIsEmpty))
            return
        }

        let jsonDecoder = JSONDecoder()
        do {
            let object = try jsonDecoder.decode(T.self, from: data)
            DispatchQueue.main.async { completion(.success(object)) }
        } catch {
            completion(.failure(.failToDecodeData))
        }
    }
}
