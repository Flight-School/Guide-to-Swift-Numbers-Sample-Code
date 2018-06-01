import Foundation

typealias UnitPlanarAngle = UnitAngle

public class UnitSolidAngle: Dimension {
    public class var steradians: UnitSolidAngle {
        let baseUnitConverter = UnitConverterLinear(coefficient: 1)
        return .init(symbol: "sr", converter: baseUnitConverter)
    }
    
    public override class func baseUnit() -> UnitSolidAngle {
        return .steradians
    }
}
