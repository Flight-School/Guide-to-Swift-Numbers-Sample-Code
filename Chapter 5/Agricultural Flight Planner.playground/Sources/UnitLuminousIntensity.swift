import Foundation

public class UnitLuminousIntensity: Dimension {
    public class var candelas: UnitLuminousIntensity {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "cd", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitLuminousIntensity {
        return .candelas
    }
}
