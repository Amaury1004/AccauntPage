struct CellularSettingsData {
    let sections: [String] = ["", "", "CARRIER"]
    var items: [[String]] = [
        ["Cellular Data", "Cellular Data Options", "Personal Hotspot"],
        ["Turn On This Line"],
        ["Wi-Fi Calling", "Calls on Other Devices", "Carrier Services", "SIM PIN", "Delete eSIM"]
    ]
    
    var settings: [String: String] = [
        "Wi-Fi Calling": "On"
    ]
}
