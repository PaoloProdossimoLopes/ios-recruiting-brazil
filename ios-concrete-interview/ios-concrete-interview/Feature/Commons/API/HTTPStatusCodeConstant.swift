//
//  HTTPStatusCodeConstant.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 17/04/22.
//

enum HTTPStatusCodeConstant: Int {
    case continueProcess = 100
    case switchingProtocol = 101
    case processing = 102
    case earlyHints = 103
    
    case ok = 200
    case created = 201
    case acepted = 202
    case nonAuthorizedInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModifer = 304
    case useProxy = 305
    case unused = 306
    
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case notAcceptable = 405
    case proxyAuthenticationRequired = 406
    case requestTimeout = 408
    case conflicts = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case URIToLarge = 414
    case unsuportedMedia = 415
    case requestRangeNotSatisfiable = 416
    case expectationFailed = 417
    case locked = 423
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451
    
    case internalServerError = 500
    case notImplemented = 501
    case badGatway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case HTTPVersionNotSuported = 505
    case insuficientStorage = 507
    case networkAuthenticationRequired = 511
    
    var code: Int { rawValue }
}
