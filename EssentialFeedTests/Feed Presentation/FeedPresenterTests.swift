//
//  Created by Maksim Soldatov on 11.12.20.
//
import XCTest

public final class FeedPresenter {
    
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    //MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
}
