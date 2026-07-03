//
//  Date+Ext.swift
//  ProductStore
//
//  Created by Szekely Janos on 2026. 07. 03..
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: .now)!
    }

    var oneHundredTenYearsAge: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: .now)!
    }
}
