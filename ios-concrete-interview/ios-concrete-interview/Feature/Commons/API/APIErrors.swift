//
//  APIErrors.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

enum APIErrors: Error {
    case invalidURL
    case dataIsEmpty
    case failToDecodeData
    case created
    case noContet
    case noContent
    case badRequest
    case forbidden
    case unauthorized
    case notFound
    case proxyAuthenticationRequired
    case requestTimeout
    case tooManyRequests
    case internalServerError
    case badGatway
    case serviceUnavailable
    case gatewayTimeout
}
