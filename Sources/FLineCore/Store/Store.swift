import ReSwift

final class StoreFactory {
    func createStore() -> Store<FirelineState> {
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

struct FirelineState: StateType {
    init() {
        self.mainScene = .mainMenu
    }
    
    let mainScene: MainSceneType
    var didQuit = false
}

