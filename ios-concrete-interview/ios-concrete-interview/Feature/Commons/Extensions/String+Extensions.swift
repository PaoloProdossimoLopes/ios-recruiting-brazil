//
//  String+Extensions.swift
//  ios-concrete-interview
//
//  Created by Paolo Prodossimo Lopes on 16/04/22.
//

import Foundation

extension String {
    static var emptyText: String { "" }
    
    var formatDate: String {
        let fromDF = DateFormatter()
        fromDF.dateFormat = "yyyy-MM-dd"
        
        let date = fromDF.date(from: self) ?? Date()
        
        let toDF = DateFormatter()
        toDF.dateFormat = "dd/MM/yyyy"
        
        return toDF.string(from: date)
    }
}
