struct Direction {
    var name : String?
   var whatisName : String{
        willSet{
        print(" default value  =\(whatisName)")
        }
        didSet{
        print("oldvalue = \(oldValue) and newValue =\(whatisName)")
        }
    }
    mutating func setName(name : String)
    {
    self.name = name
    }
    
}
var getName = Direction(name : "Shivam",whatisName : "GAur")
    getName.whatisName = "Dehradun"
getName.whatisName
getName.setName(name: "parth")
getName.name