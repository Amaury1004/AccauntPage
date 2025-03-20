import UIKit

struct BlueToothNetwork {
    let name: String
    let signalStrength: Int
}

struct BlueToothManager {
    static let selectedNetworkKey = "SelectedBlueToothNetwork"

    static func saveSelectedNetwork(_ network: String) {
        UserDefaults.standard.set(network, forKey: selectedNetworkKey)
    }

    static func getSelectedNetwork() -> String? {
        return UserDefaults.standard.string(forKey: selectedNetworkKey)
    }
}

extension BlueToothNetwork {
    static func getAvailableNetworks() -> [BlueToothNetwork] {
        return [
            BlueToothNetwork(name: "Телевизор",  signalStrength: 3),
            BlueToothNetwork(name: "Порнхаб", signalStrength: 2),
            BlueToothNetwork(name: "Паладин",  signalStrength: 1),
            BlueToothNetwork(name: "ЖопаЖопаЖопаЖопа",  signalStrength: 4),
            BlueToothNetwork(name: "Альтушка",  signalStrength: 1),
            BlueToothNetwork(name: "Фрирен",  signalStrength: 3),
            BlueToothNetwork(name: "Егор", signalStrength: 1),
            BlueToothNetwork(name: "Моя АльтГерл.com",  signalStrength: 5),
            BlueToothNetwork(name: "Скибиди",  signalStrength: 5)
            
        ]
    }
}
