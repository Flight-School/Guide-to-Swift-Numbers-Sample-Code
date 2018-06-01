import Foundation
import CoreLocation

extension Measurement where UnitType == UnitAngle {
    public init(clLocationDegrees: CLLocationDegrees) {
        self.init(value: clLocationDegrees, unit: .degrees)
    }
    
    public init(clLocationDirection: CLLocationDirection) {
        self.init(value: clLocationDirection, unit: .degrees)
    }
}

extension Measurement where UnitType == UnitLength {
    public init(clLocationAccuracy: CLLocationAccuracy) {
        self.init(value: clLocationAccuracy, unit: .meters)
    }
    
    public init(clLocationDistance: CLLocationDistance) {
        self.init(value: clLocationDistance, unit: .meters)
    }
}

extension Measurement where UnitType == UnitSpeed {
    public init(clLocationSpeed: CLLocationSpeed) {
        self.init(value: clLocationSpeed, unit: .metersPerSecond)
    }
}
