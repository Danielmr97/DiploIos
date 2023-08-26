import Foundation
enum ArithmeticExpression {
    case number (Double)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case substaction (ArithmeticExpression,ArithmeticExpression)
    indirect case multiplication (ArithmeticExpression, ArithmeticExpression)
    indirect case division (ArithmeticExpression, ArithmeticExpression)
}


let four = ArithmeticExpression.number(4)
let eigth = ArithmeticExpression.number(8)
let one = ArithmeticExpression.number(1)
let six = ArithmeticExpression.number(6)
let res = ArithmeticExpression.substaction(eigth,one)
let product = ArithmeticExpression.multiplication(four,res)
let sum = ArithmeticExpression.addition(six,product)
let total = ArithmeticExpression.division(sum,ArithmeticExpression.number(2))
//(5+4)*2
func evaluate(expression : ArithmeticExpression) -> Double{
    switch expression {
    case .number(let number):
        return number
    case .addition(let leftExp, let rightExpre):
        return evaluate(expression: leftExp) + evaluate(expression: rightExpre)
    case .multiplication(let leftExp, let rightExp):
        return evaluate(expression: leftExp) * evaluate(expression: rightExp)
    case .substaction(let leftExp, let rightExp):
        return evaluate(expression: leftExp) - evaluate(expression: rightExp)
    case .division(let leftExp, let rightExp):
        return evaluate(expression: leftExp) / evaluate(expression: rightExp)
    }
}
//(6+(4*(8-1))/2)

print(evaluate(expression: total))
