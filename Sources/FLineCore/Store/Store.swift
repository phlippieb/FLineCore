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

    case let playingAction as PlayingAction:
        return playingReducer(playingAction, state)

    default:
        break
    }

    return state ?? FirelineState()
}

public struct FirelineState: StateType {
    init() {
        self.mainScene = .mainMenu
    }
    
    public var mainScene: MainSceneType
    public var didQuit = false
}

