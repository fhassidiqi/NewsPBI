//
//  Optional+Ext.swift
//  NewsPBI
//
//  Created by Falah Hasbi Assidiqi on 02/06/24.
//

import Foundation

extension Optional where Wrapped == String {
    func orEmpty() -> String {
        return self ?? ""
    }
}
