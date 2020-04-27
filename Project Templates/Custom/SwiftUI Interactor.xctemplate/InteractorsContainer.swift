//___FILEHEADER___

extension DIContainer {
    struct Interactors {

        let interactor: Interactor

        init(interactor: Interactor) {
            self.interactor = interactor
        }

        static var stub: Self {
            .init(interactor: StubInteractor())
        }
    }
}
