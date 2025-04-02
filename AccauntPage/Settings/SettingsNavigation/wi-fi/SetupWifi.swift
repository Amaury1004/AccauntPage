import UIKit

struct WiFiNetwork {
    let name: String
    let isSecured: Bool
    let signalStrength: Int
}

struct WiFiManager {
    static let selectedNetworkKey = "SelectedWiFiNetwork"
	
    static func saveSelectedNetwork(_ network: String) {
        UserDefaults.standard.set(network, forKey: selectedNetworkKey)
    }

    static func getSelectedNetwork() -> String? {
        return UserDefaults.standard.string(forKey: selectedNetworkKey)
    }
}

extension WiFiNetwork {
    static func getAvailableNetworks() -> [WiFiNetwork] {
        return [
            WiFiNetwork(name: "Сеть Света", isSecured: true, signalStrength: 3),
            WiFiNetwork(name: "ХunterЛинк", isSecured: true, signalStrength: 2),
            WiFiNetwork(name: "СпотиПрист", isSecured: false, signalStrength: 1),
            WiFiNetwork(name: "ЖопаЖопаЖопаЖопа", isSecured: true, signalStrength: 4),
            WiFiNetwork(name: "I_wish_to_be...htototam", isSecured: false, signalStrength: 1),
            WiFiNetwork(name: "Кладбище детей Даунов", isSecured: true, signalStrength: 3),
            WiFiNetwork(name: "Егор Фашист Гойдович", isSecured: false, signalStrength: 1),
            WiFiNetwork(name: "Моя АльтГерл.com", isSecured: false, signalStrength: 5),
            WiFiNetwork(name: "Рофлян помники фром ЛжеДмитрий", isSecured: false, signalStrength: 5)
            
        ]
    }
}
