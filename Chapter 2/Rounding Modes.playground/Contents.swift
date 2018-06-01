import Foundation

let formatter = NumberFormatter()
formatter.numberStyle = .decimal
formatter.maximumFractionDigits = 1

let numbers =
    [1.2, 1.22, 1.25, 1.27, -1.25]
let modes: [NumberFormatter.RoundingMode] =
    [.ceiling, .floor, .up, .down, .halfUp, .halfDown, .halfEven]

for mode in modes {
    formatter.roundingMode = mode
    
    for number in numbers {
        formatter.string(for: number)
    }
}
