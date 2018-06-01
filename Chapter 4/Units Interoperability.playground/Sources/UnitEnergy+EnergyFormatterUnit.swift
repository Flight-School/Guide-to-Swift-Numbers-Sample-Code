import Foundation

extension UnitEnergy {
    public convenience init(_ energyFormatterUnit: EnergyFormatter.Unit) {
        var unit: UnitEnergy
        switch energyFormatterUnit {
        case .calorie: unit = .calories
        case .joule: unit = .joules
        case .kilocalorie: unit = .kilocalories
        case .kilojoule: unit = .kilojoules
        }
        
        self.init(symbol: unit.symbol, converter: unit.converter)
    }
}
