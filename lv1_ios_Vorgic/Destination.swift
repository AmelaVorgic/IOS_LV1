//
//  Destination.swift
//  lv1_ios_Vorgic
//
//  Created by student on 26.04.2022..
//

import UIKit

class Destination: Codable {
    
    let id: String
    var ime: String
    var opis: String
    
    init(ime: String, opis: String) {
        self.id=UUID().uuidString
        self.ime=ime
        self.opis=opis
    }
    
    
}
