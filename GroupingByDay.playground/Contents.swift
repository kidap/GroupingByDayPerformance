//: Playground - noun: a place where people can play

import Foundation

struct Employee {
    var id: Int
    var hiringDate: Date
}

var employees: [Employee] = []

//------------------------------------------------------------
// Test Data
//------------------------------------------------------------
for x in 1...500 {
    let employee = Employee(id: x, hiringDate: Date(timeIntervalSince1970: TimeInterval(x*60*60)))
    employees.append(employee)
}


//------------------------------------------------------------
// Reduce
//------------------------------------------------------------
let resultUsingReduce = employees.reduce([Date: [Employee]]()) {
    var all = $0
    let date = Calendar.current.startOfDay(for: $1.hiringDate)
    
    if var row =  all[date] {
        row.append($1)
    } else {
        all[date] = [$1]
    }
    return all
}


//------------------------------------------------------------
// Dictionary.init(grouping: Sequence)
//------------------------------------------------------------
let resultUsingGrouping = Dictionary.init(grouping: employees) {
    return Calendar.current.startOfDay(for: $0.hiringDate)
}
