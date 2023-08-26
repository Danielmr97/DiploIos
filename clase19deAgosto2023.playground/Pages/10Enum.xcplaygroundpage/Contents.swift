//: [Previous](@previous)

enum ContactMethod{
    case email(String)
    case phone(Int)
    case mail(streetName: String, Zipcode : String, streetNumber : Int)
}

var myPreferredContactMethod = ContactMethod.email("myemail@email.me")

switch myPreferredContactMethod{
case .email(let strEmail): print(strEmail)
case .phone(let num) : print(num)
case .mail(streetName : let name, Zipcode : let zc, streetNumber : let num) : print("adrerssStreet \(name) \(num) \(zc)")
}

enum ArithmeticExpression {
    case number (Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication (ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let eigth = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let six = ArithmeticExpression.number(6)
let sum = ArithmeticExpression.addition(five, four )
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//(5+4)*2
func evaluate(expression : ArithmeticExpression) -> Int{
    switch expression {
    case .number(let number):
        return number
    case .addition(let leftExp, let rightExpre):
        return evaluate(expression: leftExp) + evaluate(expression: rightExpre)
    case .multiplication(let leftExp, let rightExp):
        return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    }
}
//(6+(4*(8-1))/2)

print(evaluate(expression: product))
