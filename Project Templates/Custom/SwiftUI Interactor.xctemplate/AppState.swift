//___FILEHEADER___

import Foundation
import SwiftUI

/// Holds the application state.
struct AppState: Equatable {

    var userData = UserData()
    var routing = ViewRouting()
    var system = System()
}

extension AppState {

    /// Holds data displayed  for the user, typically loaded from external sources.
    struct UserData: Equatable {

    }
}

extension AppState {

    /// Holds view routing
    struct ViewRouting: Equatable {

    }
}

extension AppState {

    /// Holds system events.
    struct System: Equatable {

        /// Triggered when app is entering the background.
        var isActive: Bool = false

        /// Keyboard events.
        var keyboardHeight: CGFloat = 0
    }
}

#if DEBUG
extension AppState {

    /// Create an `AppState` for use in previews.
    static var preview: AppState {
        var state = AppState()
        state.system.isActive = true
        return state
    }
}
#endif
