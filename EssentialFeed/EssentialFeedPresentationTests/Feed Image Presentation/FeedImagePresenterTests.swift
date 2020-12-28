//
//  Created by Maksim Soldatov on 11.12.20.
//
import XCTest
import EssentialFeed
import EssentialFeedPresentation

final class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModel() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
    
}
