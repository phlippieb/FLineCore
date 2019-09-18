import ReSwift

enum MainMenuAction: Action {
    case quit
}

let mainMenuReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) -> FirelineState in
    var state = state ?? FirelineState()

    guard let mainMenuAction = action as? MainMenuAction
        else { return state }
    
    switch mainMenuAction {
    case .quit:
        state.didQuit = true
    }
        
    return state
}
