#if swift(>=4.0)
@objcMembers public class MoviesRequests: MoviesAPIRequests {

    public override func registerGetMovieDetailRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: MoviesAPI.kRequestGetMovieDetail,
    reqClass: String.self, 
    respClass: AnyObject.self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func registerGetTopRatedMoviesRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: MoviesAPI.kRequestGetTopRatedMovies,
    reqClass: None.self, 
    respClass: [Movie].self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }


    public override func unregisterGetMovieDetailRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterGetTopRatedMoviesRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
        return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    //------------------------------------------------------------------------------------------------------------------------------------


    public override func getMovieDetail(movieId: String, responseCompletionHandler: @escaping (AnyObject?, ElectrodeFailureMessage?) -> ()) {
        let requestProcessor = ElectrodeRequestProcessor<String, AnyObject, Any>(
            requestName: MoviesAPI.kRequestGetMovieDetail,
            requestPayload: movieId,
            respClass: AnyObject.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? AnyObject, errorMessage) })

        requestProcessor.execute()
    }

    public override func getTopRatedMovies( responseCompletionHandler: @escaping ([Movie]?, ElectrodeFailureMessage?) -> ()) {
        let requestProcessor = ElectrodeRequestProcessor<None, [Movie], Any>(
            requestName: MoviesAPI.kRequestGetTopRatedMovies,
            requestPayload: nil, 
            respClass: [Movie].self,
            responseItemType: Movie.self,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? [Movie], errorMessage) })

        requestProcessor.execute()
    }
}
#else
public class MoviesRequests: MoviesAPIRequests {

    public override func registerGetMovieDetailRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: MoviesAPI.kRequestGetMovieDetail,
    reqClass: String.self, 
    respClass: AnyObject.self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    public override func registerGetTopRatedMoviesRequestHandler(handler:  @escaping ElectrodeBridgeRequestCompletionHandler) -> UUID?{
        let requestHandlerProcessor = ElectrodeRequestHandlerProcessor(requestName: MoviesAPI.kRequestGetTopRatedMovies,
    reqClass: None.self, 
    respClass: [Movie].self,
    requestCompletionHandler: handler)
        return requestHandlerProcessor.execute()
    }

    //------------------------------------------------------------------------------------------------------------------------------------



    public override func unregisterGetMovieDetailRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterGetTopRatedMoviesRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func getMovieDetail(movieId: String, responseCompletionHandler: @escaping (AnyObject?, ElectrodeFailureMessage?) -> ()) {
        let requestProcessor = ElectrodeRequestProcessor<String, AnyObject, Any>(
            requestName: MoviesAPI.kRequestGetMovieDetail,
            requestPayload: movieId,
            respClass: AnyObject.self,
            responseItemType: nil,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? AnyObject, errorMessage) })

        requestProcessor.execute()
    }


    public override func unregisterGetMovieDetailRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func unregisterGetTopRatedMoviesRequestHandler(uuid: UUID) -> ElectrodeBridgeRequestCompletionHandler? {
      return ElectrodeBridgeHolder.unregisterRequestHandler(with: uuid)
    }

    public override func getTopRatedMovies( responseCompletionHandler: @escaping ([Movie]?, ElectrodeFailureMessage?) -> ()) {
        let requestProcessor = ElectrodeRequestProcessor<None, [Movie], Any>(
            requestName: MoviesAPI.kRequestGetTopRatedMovies,
            requestPayload: nil, 
            respClass: [Movie].self,
            responseItemType: Movie.self,
            responseCompletionHandler: { data, errorMessage in responseCompletionHandler(data as? [Movie], errorMessage) })

        requestProcessor.execute()
    }
}
#endif
