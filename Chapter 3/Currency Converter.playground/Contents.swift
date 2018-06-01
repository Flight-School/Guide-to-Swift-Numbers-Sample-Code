import Foundation

let EURtoUSD = CurrencyPair<EUR, USD>(rate: 1.17) // as of June 1st, 2018

let euroAmount: Money<EUR> = 123.45
let dollarAmount = EURtoUSD.convert(euroAmount)
