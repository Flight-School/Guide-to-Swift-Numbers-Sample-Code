import Foundation

public class UnitElectricCapacitance: Dimension {
    public class var farads: UnitElectricCapacitance {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "F", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitElectricCapacitance {
        return .farads
    }
}
