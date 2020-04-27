//___FILEHEADER___

import Foundation
import SwiftUI

/// Holds the application state.
struct ___FILEBASENAMEASIDENTIFIER___: Equatable {

    var userData = UserData()
    var routing = ViewRouting()
    var system = System()
}

extension ___FILEBASENAMEASIDENTIFIER___ {

    /// Holds data displayed  for the user, typically loaded from external sources.
    struct UserData: Equatable {

    }
}

extension ___FILEBASENAMEASIDENTIFIER___ {

    /// Holds view routing
    struct ViewRouting: Equatable {

    }
}

extension ___FILEBASENAMEASIDENTIFIER___ {

    /// Holds system events.
    struct System: Equatable {

        /// Triggered when app is entering the background.
        var isActive: Bool = false

        /// Keyboard events.
        var keyboardHeight: CGFloat = 0
    }
}

#if DEBUG
extension ___FILEBASENAMEASIDENTIFIER___ {

    /// Create an `AppState` for use in previews.
    static var preview: ___FILEBASENAMEASIDENTIFIER___ {
        var state = AppState()
        state.system.isActive = true
        return state
    }
}
#endif
