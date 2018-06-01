import Foundation

extension UnitMass {
    public convenience init(_ massFormatterUnit: MassFormatter.Unit) {
        var unit: UnitMass
        switch massFormatterUnit {
        case .gram:
            unit = .grams
        case .kilogram:
            unit = .kilograms
        case .ounce:
            unit = .ounces
        case .pound:
            unit = .pounds
        case .stone:
            unit = .stones
        }
        
        self.init(symbol: unit.symbol, converter: unit.converter)
    }
}
