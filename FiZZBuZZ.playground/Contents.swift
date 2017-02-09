//: Playground - noun: a place where people can play

//let arr = Array(1...100)
var arr = [1,2,3,4,8,75,9,45,68,85,90]
arr.sort {
    return $0 < $1
}

let MapFizz = arr.map({(value : Int) -> Any in
    if (value % 3 == 0) && (value % 5 == 0) {
        return "FiZZ BuZZ"
    }
    else if value % 3 == 0 {
        return "Fizz"
    }
    else if value % 5 == 0 {
        return "BuZZ "
    }
    else {
        return value
    }
})

