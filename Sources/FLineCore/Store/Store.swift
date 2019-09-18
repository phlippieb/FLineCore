import ReSwift

public final class StoreFactory {
    public init() {}
    public func createStore() -> Store<FirelineState> {
        return Store(
            reducer: firelineReducer,
            state: FirelineState())
    }
}

let firelineReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) in
    switch action {
    case let mainMenuAction as MainMenuAction:
        return mainMenuReducer(mainMenuAction, state)

    default:
        break
    }

    return state ?? FirelineState()
}

public struct FirelineState: StateType {
    init() {
        self.mainScene = .mainMenu
    }
    
    public let mainScene: MainSceneType
    public var didQuit = false
}

