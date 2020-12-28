//
//  Created by Maksim Soldatov on 11.12.20.
//

public struct ResourceErrorViewModel {

    public let message: String?
    
    public init(message: String?) {
        self.message = message
    }
    
    public static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }
    
    public static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
