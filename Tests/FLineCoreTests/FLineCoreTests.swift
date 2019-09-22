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
                expect(StoreFactory().createStore().state?.mainScene.mainMenu).toNot(beNil())
                expect(StoreFactory().createStore().state?.mainScene.playingState).to(beNil())
            }

            it("does not say that the game was quit") {
                expect(StoreFactory().createStore().state!.didQuit).to(equal(false))
            }
            
            context("when given a quit action") {
                it("changes its state to indicate that it was quit") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.quit)
                    expect(store.state!.didQuit).to(equal(true))
                }
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
                    
                    expect(store.state?.mainScene.playingState).toNot(beNil())
                    expect(store.state?.mainScene.playingState?.tick).to(equal(0))

                    expect(store.state?.mainScene.mainMenu).to(beNil())
               }
            }
        }

        describe("A playing state") {
            context("when a tick action is dispatched") {
                it("Increments the tick") {
                    let store = StoreFactory().createStore()
                    store.dispatch(MainMenuAction.play)
                    
                    store.dispatch(PlayingAction.tick)
                    expect(store.state?.mainScene.playingState?.tick).to(equal(1))

                    store.dispatch(PlayingAction.tick)
                    expect(store.state?.mainScene.playingState?.tick).to(equal(2))
                }
            }
        }

        describe("A new playing state") {
            let store = StoreFactory().createStore()
            store.dispatch(MainMenuAction.play)

            context("the player") {
                it("starts at the zero coordinates") {
                    let expected = Location(x: 0, y: 0)
                    let actual = store.state?.mainScene.playingState?.player.navigation.location
                    expect(actual).to(equal(expected))
                }
            }
        }
    }
 }

