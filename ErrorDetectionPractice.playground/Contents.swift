struct checkError{

    var value : Int = 0
    func compute(value : Int ) throws{
            if value == 0{
            throw valueZeroError.ValueZero
            }
        }
    func catchError(){
            do{
             try self.compute(value: value)
            }
        catch valueZeroError.ValueZero{
        print("the value is Zero")
        }
    }
    
    enum valueZeroError : Error{
    case ValueZero
   
    }

}
var checkerror = checkError(value : 0)
checkError.catchError()


