//___FILEHEADER___

import Foundation
import SwiftUI

protocol Interactor {
    func loadSomething()
}

struct RealInteractor: Interactor {

    private let appState: Store<AppState>

    init(appState: Store<AppState>) {
        self.appState = appState
    }

    func loadSomething() {
        // Implement
        fatalError("Needs Implemented")
    }
}

struct StubInteractor: Interactor {

    func loadSomething() {
        return
    }
}
