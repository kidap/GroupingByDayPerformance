# Grouping By Day - Performance Test
Swift 4's Dictionary.init(grouping:by:) is fast!!!

## Using reduce to group objects by day
```
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
```
## Using Dictionary.init(grouping:by:) to group objects by day
```
let resultUsingGrouping = Dictionary.init(grouping: employees) {
    return Calendar.current.startOfDay(for: $0.hiringDate)
}
```

## Result

|Number of Records|	Reduce (in secs)|	Grouping (in secs)
|-----------------|-----------------|-----------------|
|10|	0.0455929040908813|	0.00792884826660156
|50|	0.265183877944946|	0.0308555603027344
|100|	0.721476411819458|	0.0672362804412842
|250|	2.39281177520752|	0.158499264717102
|500|	7.20673844814301|	0.275208425521851
|1000|	24.4565317630768|	0.555599117279053

![Chart](https://github.com/kidap/GroupingByDayPerformance/blob/master/ACCC49A4-FD62-4D0B-B310-F32A9A4BE962.jpg)
