//
//  SettingsCell.swift
//  AccauntPage
//
//  Created by MakOSim on 03.02.2025.
//

import Foundation
import UIKit

enum SettingsSectionType: Int {
    case fisrt, second, third
}
enum SettingsfirstRow: Int {
    case airmode, wifi, bluetooth, cellular
}
enum SettingssecondRow: Int {
    case notifications, sound, focus, screenTime
}
enum SettingsThirdRow: Int {
   case general, controlCenter, display, homeScreen, accessibility
}

struct SetupMenu {
    
    enum SettingsCellType {
        case main, toggle, label
    }
    
    let name:  String
    let description: String?
    let image: UIImage
    var color: UIColor = .gray
    var type: SettingsCellType?
    
    init(name: String, description: String? = nil, imageName: String, color: UIColor = .gray, type: SettingsCellType? = .main) {
        self.name = name
        self.image = UIImage(systemName: imageName) ?? UIImage()
        self.color = color
        self.description = description
        self.type = type
    }
    
}

enum Colors {
    
    case orange
    case blue
    case green
    case red
    case purple
    
    
    var uiColor: UIColor {
        switch self {
        case .orange:
            return .systemOrange
        case .blue:
            return .systemBlue
        case .green:
            return .systemGreen
        case .red:
            return .systemRed
        case .purple:
            return .systemPurple
        }
        
    }
    
}


struct ImageName {
    
    static let airplaneMod  = "airplane"
    static let wifi = "wifi"
    static let bluetooth = "bluetooth"
    static let cellular = "antenna.radiowaves.left.and.right"
    
    static let notifications = "bell"
    static let sound = "speaker.wave.3"
    static let focus = "moon.fill"
    static let screenTime = "hourglass"
    
    static let general = "gear"
    static let controlCenter = "externaldrive"
    static let display = "textformat.size"
    static let homeScreen = "square.grid.2x2"
    static let accessibility = "person.fill"
    
}

struct Source {
    static func makeMenu() -> [SetupMenu] {
        [ SetupMenu(name: "Airplane Mode",
                    imageName: ImageName.airplaneMod,
                    color: Colors.orange.uiColor,
                    type: .toggle),
          SetupMenu(name: "Wi-Fi",
                    description: "Guest",
                    imageName: ImageName.wifi,
                    color: Colors.blue.uiColor,
                    type: .label),
          SetupMenu(name: "Bluetooth",
                    description: "On",
                    imageName: ImageName.bluetooth,
                    color: Colors.blue.uiColor,
                    type: .label),
          SetupMenu(name: "Cellular",
                    description: "Off",
                    imageName: ImageName.cellular,
                    color: Colors.green.uiColor,
                    type: .label),
          
          SetupMenu(name: "Notifications", imageName: ImageName.notifications, color: Colors.red.uiColor),
          SetupMenu(name: "Sounds & Haptics", imageName: ImageName.sound, color: Colors.red.uiColor),
          SetupMenu(name: "Focus", imageName: ImageName.focus, color: Colors.purple.uiColor),
          SetupMenu(name: "Screen Time", imageName: ImageName.screenTime, color: Colors.purple.uiColor),
          
          SetupMenu(name: "General", imageName: ImageName.general),
          SetupMenu(name: "Control Center", imageName: ImageName.controlCenter),
          SetupMenu(name: "Display & Brightness", imageName: ImageName.display, color: Colors.blue.uiColor),
          SetupMenu(name: "Home Screen", imageName: ImageName.homeScreen, color: Colors.blue.uiColor),
          SetupMenu(name: "Accessibility", imageName: ImageName.accessibility, color: Colors.blue.uiColor)]
        
    }
    static func makeGroup() -> [[SetupMenu]] {
        let menus = makeMenu()
        
        var oneRow: [SetupMenu] = []
        var twoRow: [SetupMenu] = []
        var threeRow: [SetupMenu] = []
        
        oneRow = Array(menus[0...3])
        twoRow = Array(menus[4...7])
        threeRow = Array(menus[8...12])
        
        return [oneRow, twoRow, threeRow]
    }
}

