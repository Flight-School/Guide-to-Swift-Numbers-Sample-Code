import Foundation

let prices: [Money<USD>] = [2.19, 5.39, 20.99, 2.99, 1.99, 1.99, 0.99]
let subtotal = prices.reduce(0.00, +)
let tax = 0.08 * subtotal
let total = subtotal + tax

let priceInCNY = Money<CNY>(19.9)

var money: Money<USD> = 1.00
money = -money // easy come, easy go
