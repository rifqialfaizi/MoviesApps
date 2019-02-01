//
//  String+Extension.swift
//  MoviesApps
//
//  Created by Robihamanto on 31/01/19.
//  Copyright © 2019 Rifqi Alfaizi. All rights reserved.
//

import Foundation

extension String {
    
    /// Merubah path yang didapat dari response API menjadi link url
    /// Sehingga bisa untuk gigunakan ketika request image ke server
    func imagePathToUrl() -> String {
        return "https://image.tmdb.org/t/p/w500/\(self)"
    }
    
    
}
