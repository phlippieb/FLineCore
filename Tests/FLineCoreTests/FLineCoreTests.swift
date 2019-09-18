@testable import FLineCore

import Quick
import Nimble

final class TestSpec: QuickSpec {
    override func spec() {
        describe("The Quick unit test") {
            it("runs") {
                expect(true).to(equal(true))
            }
        }
    }
}

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

final class Spec: QuickSpec {
    override func spec() {
        describe("The main scene of a new state") {
            it("is the game menu") {
                expect(StoreFactory().createStore().state!.mainScene).to(equal(.mainMenu))
            }
            
            // Which options are available in the menu?
            // - quit
            // - start/continue next level:
            //   - if the player hasn't started playing yet, go to the first level
            //   - if the player has started playing, continue from the beginning of the next uncompleted level
            // - practice
            //   - tutorial level
            //   - sandbox simulation for writing and trying out scripts
        }
    }
}
