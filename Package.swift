// swift-tools-version:5.9

/*
 To Kill rogue processes:
 ------------------------
 lsof -n -i4TCP:8089
 
 
 Docker Run:
 -----------
 docker run --hostname=0b25e7e0d658 --mac-address=02:42:ac:11:00:02 --env=MONGO_INITDB_DATABASE=vapor --env=PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin --env=GOSU_VERSION=1.16 --env=JSYAML_VERSION=3.13.1 --env=MONGO_PACKAGE=mongodb-org --env=MONGO_REPO=repo.mongodb.org --env=MONGO_MAJOR=7.0 --env=MONGO_VERSION=7.0.3 --env=HOME=/data/db --volume=/data/configdb --volume=/data/db -p 27017:27017 --restart=no --label='org.opencontainers.image.ref.name=ubuntu' --label='org.opencontainers.image.version=22.04' --runtime=runc -d mongo
 
 */

import PackageDescription

let package = Package(
    name: "vapor-server",
    platforms: [
        .macOS(.v14)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.113.2"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.12.0"),
        .package(url: "https://github.com/vapor/fluent-mongo-driver.git", from: "1.4.0"),
        //.package(url: "https://github.com/brokenhandsio/vapor-oauth", from: "1.0.0-beta.2"),
        //.package(url: "https://github.com/vapor/jwt.git", from: "5.0.0-rc"),
        //.package(url: "https://github.com/vapor-community/Imperial.git", from: "1.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "EdsVaporServer",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentMongoDriver", package: "fluent-mongo-driver"),
                //.product(name: "OAuth", package: "vapor-oauth"),
                //.product(name: "JWT", package: "jwt"),
                //.product (name: "ImperialGitHub", package: "Imperial"),
                //.product (name: "ImperialGoogle", package: "Imperial"),
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "EdsVaporServer"),
            .product(name: "XCTVapor", package: "vapor"),
            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            //.product(name: "Vapor", package: "vapor"),
        ])
    ]
)
