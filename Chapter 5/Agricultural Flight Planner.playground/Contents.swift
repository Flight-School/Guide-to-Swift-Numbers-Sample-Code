import Foundation

let emptyPlaneWeight: Measurement<UnitMass>
let payloadWeight: Measurement<UnitMass>
let fuelWeight: Measurement<UnitMass>
let pilotWeight: Measurement<UnitMass>
let maximumTakeoffWeight: Measurement<UnitMass>

emptyPlaneWeight = Measurement<UnitMass>(value: 3150, unit: .pounds)
maximumTakeoffWeight = Measurement<UnitMass>(value: 7020, unit: .pounds)
pilotWeight = Measurement<UnitMass>(value: 100, unit: .kilograms)

let fieldLength = Measurement<UnitLength>(value: 400, unit: .yards)
let fieldWidth = Measurement<UnitLength>(value: 250, unit: .yards)
let fieldArea = (fieldLength * fieldWidth).converted(to: .acres)

let speed = Measurement<UnitSpeed>(value: 100, unit: .knots)

let ferryLength = Measurement<UnitLength>(value: 10, unit: .miles)
let ferryDuration = (ferryLength / speed) * 2

let flyAroundLength = ((fieldLength * 2) + (fieldWidth * 2))
let flyAroundDuration = (flyAroundLength / speed)

var applicationLength: Measurement<UnitLength>
var applicationWidth: Measurement<UnitLength>

//(applicationLength, applicationWidth) =
//    (fieldWidth, fieldLength) // best-case

(applicationLength, applicationWidth) =
    (fieldLength, fieldWidth) // worst-case

let swathWidth = Measurement<UnitLength>(value: 40, unit: .feet)
let swathPasses = ceil(applicationWidth / swathWidth)

let trimPasses = 2.0
let cleanupPasses = ceil(0.05 * swathPasses) // 5% fudge factor

let totalPasses = swathPasses + trimPasses + cleanupPasses

let standardTurnDuration = Measurement<UnitDuration>(value: 1.0, unit: .minutes)
let passDuration = (applicationLength / speed)

let totalDuration = (
    totalPasses * (passDuration + standardTurnDuration) +
    ferryDuration +
    flyAroundDuration
).converted(to: .minutes)

let fuelConsumptionRate = Rate<UnitVolume, UnitDuration>(value: 50, unit: .gallons, per: .hours)

var fuelVolume = totalDuration * fuelConsumptionRate

let fuelTankCapacity = Measurement<UnitVolume>(value: 46, unit: .gallons)
fuelVolume < fuelTankCapacity

fuelVolume = fuelTankCapacity // fill 'er up!

let fuelWeightRate =
    Rate<UnitMass, UnitVolume>(value: 6,
                               unit: .pounds,
                               per: .gallons)

fuelWeight = fuelWeightRate * fuelVolume

let payloadWeightRate = Rate<UnitMass, UnitArea>(value: 120, unit: .pounds, per: .acres)

payloadWeight = payloadWeightRate * fieldArea

let takeoffWeight = (
    emptyPlaneWeight +
    payloadWeight +
    fuelWeight +
    pilotWeight
).converted(to: .pounds)

let canTakeOff = takeoffWeight < maximumTakeoffWeight
