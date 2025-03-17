import Vapor
import Fluent
import FluentMongoDriver


// configures your application
public func configure(_ app: Application) async throws {

    //MARK: - Add the logging middleware.
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.middleware.use(LogMiddleware())
    app.logger.logLevel = .error

    /// set max body size
    app.routes.defaultMaxBodySize = "100mb"
    
    //MARK: - Add the Mongo database driver to the Vapor server.  (If you pulled my code from GitHub, you will need to update this to point to your own k8/docker instance running mongo.)
    try app.databases.use(.mongo(connectionString: "mongodb://192.168.78.179:27017/sitesandmembership"), as: .mongo)
    
    //MARK: - Add migrations.
    app.migrations.add(CreateAddress())
    app.migrations.add(CreateCoordinate())
    app.migrations.add(CreateGalaxy())
    app.migrations.add(CreateStar())
    
//    if app.environment == .development {
//        try await app.autoMigrate().get()
//    }
    
    //MARK: - Configure encoding / decoding strategy
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .useDefaultKeys
    encoder.dateEncodingStrategy = .iso8601
    ContentConfiguration.global.use(encoder: encoder, for: .json)
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    decoder.dateDecodingStrategy = .iso8601
    ContentConfiguration.global.use(decoder: decoder, for: .json)
    
    //MARK: -  Configure the Vapor Server
    app.http.server.configuration.port = 8089
    app.http.server.configuration.serverName = "EdsSuperDuperTestServer0x01"
    app.http.server.configuration.requestDecompression = .enabled
    app.http.server.configuration.responseCompression = .enabled
    
    //MARK: - Register routes with Vapor server instance.
    try registerRoutes(app)
}


/*
 Sometimes the debugger crashes and you need to find the process that is still running, listing on your port (8089) and kill it.
 
 lsof -iTCP -sTCP:LISTEN -n -P | grep 8089
 */



