//
//  Letter.swift
//  UI-468
//
//  Created by nyannyan0328 on 2022/02/17.
//

import SwiftUI

struct Letter: Identifiable,Equatable {
    var id = UUID().uuidString
    var date : String
    var title : String
}

var letters : [Letter] = [
    
    
    Letter(date: "June 19 1988", title: "Happy Jake"),
    
    Letter(date: "November 3 2001", title: "Happy Roki"),
    
    Letter(date: "February 28 1988", title: "Happy Chapman")
    
    



]
