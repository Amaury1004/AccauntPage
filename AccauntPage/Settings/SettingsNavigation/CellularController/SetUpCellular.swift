import UIKit

struct CellularSettingsData {
    let label: String
    let descriptionLabel: String?
    var type: TypeCellular?
    let section: SectionCellular

    enum TypeCellular {
        case switchType, label
    }
    enum SectionCellular {
        case firstGroup, secondGroup
    }
}

struct SetupCell {
    static func setupCell() -> [CellularSettingsData] {
        return [
            CellularSettingsData(label: "Cellular Data", descriptionLabel: "", type: .switchType, section: .firstGroup),
            CellularSettingsData(label: "Cellular Data Option", descriptionLabel: "", type: .label, section: .firstGroup),
            CellularSettingsData(label: "Personal Hotspot", descriptionLabel: "Turn off cellular data to restrict all data to Wi-Fi, including email, web browsing, and push notifications.", type: .label, section: .firstGroup),
            
            CellularSettingsData(label: "Turn On This Line", descriptionLabel: "", type: .switchType, section: .secondGroup),
            CellularSettingsData(label: "WiFi Calling", descriptionLabel: "", type: .label, section: .secondGroup),
            CellularSettingsData(label: "Calls on Other Devices", descriptionLabel: "", type: .label, section: .secondGroup),
            CellularSettingsData(label: "Carrier Services", descriptionLabel: "", type: .label, section: .secondGroup),
            CellularSettingsData(label: "SIM PIN", descriptionLabel: "", type: .label, section: .secondGroup),
            CellularSettingsData(label: "Delete eSIM", descriptionLabel: "", type: .label, section: .secondGroup)
        ]
    }
    
    static func setupCellularGroup() -> [[CellularSettingsData]] {
        let firstGroup = setupCell().filter { $0.section == .firstGroup }
        let secondGroup = setupCell().filter { $0.section == .secondGroup }
        
        return [firstGroup, secondGroup]
    }
}
