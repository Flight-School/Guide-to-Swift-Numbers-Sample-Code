do {
    try detectingFloatingPointErrors(flags: .invalid) {
        Double.signalingNaN + 1
    }
} catch {
    print("Error: \(error)")
}
