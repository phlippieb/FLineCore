import ReSwift

public enum MainMenuAction: Action {
    case quit
    case play
}

let mainMenuReducer: Reducer<FirelineState> = { (action: Action, state: FirelineState?) -> FirelineState in
    var state = state ?? FirelineState()

    guard let mainMenuAction = action as? MainMenuAction
        else { return state }
    
    switch mainMenuAction {
    case .quit:
        state.didQuit = true

    case .play:
        state.mainScene = .playing(PlayingState())
    }
        
    return state
}
