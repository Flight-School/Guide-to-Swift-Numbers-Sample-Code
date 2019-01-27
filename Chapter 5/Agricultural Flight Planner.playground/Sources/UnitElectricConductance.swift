import Foundation

public final class UnitElectricConductance: Dimension {
    public class var siemens: UnitElectricConductance {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "sr", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitElectricConductance {
        return .siemens
    }
}
