import Vapor

func registerRoutes(_ app: Application) throws {
    
    //Add non-authenticated routes
    try app.register(collection: GalaxiesController())
    try app.register(collection: StarsController())
    try app.register(collection: AttachmentController())
    
    //Add authenticated routes.
    try app.grouped(AuthenticationMiddleware()).register(collection: AddressController())
        
    //Print out the registered routes to the console
    if app.environment != .production {
        print("")
        print("_________________________________________")
        print("Registered Routes:")
        print("-----------------------------------------")
        var output: [String] = []
        app.routes.all.forEach { route in
            let controllerName = route.path[1].description
            if output.contains(controllerName) == false {
                print("")
                print("======== \(controllerName) ========")
                output.append(controllerName)
            }
            print(route)
        }
        print("_________________________________________")
        print("")
    }
}
