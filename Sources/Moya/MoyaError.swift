import Foundation

// Mark Moya.Error as unavaiable and offer a quick fix.
@available(*, unavailable, renamed: "MoyaError", message: "Moya.Error has been renamed to MoyaError in version 8.0.0")
public typealias Error = MoyaError

public enum MoyaError: Swift.Error {

    /// Indicates a response failed to map to an image.
    case imageMapping(Response)

    /// Indicates a response failed to map to a JSON structure.
    case jsonMapping(Response)

    /// Indicates a response failed to map to a String.
    case stringMapping(Response)

    /// Indicates a response failed with an invalid HTTP status code.
    case statusCode(Response)

    /// Indicates a response failed due to an underlying `Error`.
    case underlying(Swift.Error)

    /// Indicates that an `Endpoint` failed to map to a `URLRequest`.
    case requestMapping(String)
}

public extension MoyaError {
    /// Depending on error type, returns a `Response` object.
    var response: Moya.Response? {
        switch self {
        case .imageMapping(let response): return response
        case .jsonMapping(let response): return response
        case .stringMapping(let response): return response
        case .statusCode(let response): return response
        case .underlying: return nil
        case .requestMapping: return nil
        }
    }
}
