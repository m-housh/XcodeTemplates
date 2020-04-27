//___FILEHEADER___

import Foundation
import SwiftUI

protocol ___FILEBASENAMEASIDENTIFIER___Interactor {
    func loadSomething()
}

struct Real___FILEBASENAMEASIDENTIFIER___Interactor:  ___FILEBASENAMEASIDENTIFIER___Interactor {

    private let appState: Store<AppState>

    init(appState: Store<AppState>) {
        self.appState = appState
    }

    func loadSomething() {
        // Implement
        fatalError("Needs Implemented")
    }
}

struct Stub___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___Interactor {

    func loadSomething() {
        return
    }
}
