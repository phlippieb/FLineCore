@testable import FLineCore

import Quick
import Nimble

final class StoreFactorySpec: QuickSpec {
    override func spec() {
        describe("The StoreFactory") {
            func _makeSUT() -> StoreFactory {
                return StoreFactory()
            }
            
            it("can be instantiated") {
                _ = _makeSUT()
            }
            
            it("creates a store with a state.") {
                let sut = _makeSUT()
                expect(sut.createStore().state).toNot(beNil())
            }
        }
    }
}

final class MainMenuSpec: QuickSpec {
    override func spec() {
        describe("The main scene of a new state") {
            it("is the game menu") {
                expect(StoreFactory().createStore().state!.mainScene).to(equal(.mainMenu))
            }

            it("does not say that the game was quit") {
                expect(StoreFactory().createStore().state!.didQuit).to(equal(false))
            }
            
            // Which options are available in the menu?
            // - quit
            // - start/continue next level:
            //   - if the player hasn't started playing yet, go to the first level
            //   - if the player has started playing, continue from the beginning of the next uncompleted level
            // - practice
            //   - tutorial level
            //   - sandbox simulation for writing and trying out scripts

            context("when given a quit action") {
                it("changes its state to indicate that it was quit") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.quit)
                    expect(store.state!.didQuit).to(equal(true))
                }

                // TODO when we have more complex state, maybe we should enforce that the store ignores subsequent actions.
            }
        }
    }
}

final class LevelSpec: QuickSpec {
    override func spec() {
        describe("The main menu") {
            context("when choosing to play") {
               it("goes to the playing scene, with the playing state at tick zero") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.play)
                    
                    expect({
                        guard case .playing(let playingState) = store.state!.mainScene
                            else { return .failed(reason: "Wrong enum case") }

                        expect(playingState.tick).to(equal(0))

                        return .succeeded
                    }).to(succeed())
                }
            }
        }

        describe("A playing state") {
            context("when a tick action is dispatched") {
                it("Increments the tick") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.play)
                    store.dispatch(PlayingAction.tick)

                    expect({
                        guard case .playing(let playingState) = store.state!.mainScene
                            else { return .failed(reason: "Wrong enum case") }
                        
                        expect(playingState.tick).to(equal(1))

                        return .succeeded
                    }).to(succeed())
                }
            }
        }
    }
}

