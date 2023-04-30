//
//  AppDelegate.swift
//  WalletWise
//
//  Created by Daize Njounkeng on 4/7/23.
//

import ParseSwift
import UIKit



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ParseSwift.initialize(applicationId: "QUX9AjmJsbjcOnlJWfkKfjqCJaPx8iErZlV2TD58",
                              clientKey: "HDNLu6wq1UXI7Q408A2VilP5Nm0iWfZdDoPCcy5G",
                              serverURL: URL(string: "https://parseapi.back4app.com")!)
        return true

        // https://github.com/parse-community/Parse-Swift/blob/main/ParseSwift.playground/Sources/Common.swift
//        ParseSwift.initialize(applicationId: "Z8WYOJ22LRuChlemsxLot9eJefWwBlmC6lNPPWeB",
//                              clientKey: "gNwm5gVjtMtUQyNxnKGA5hX6cNhfbtN2weuPr5jc",
//                              serverURL: URL(string: "https://parseapi.back4app.com")!)

       
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L121

        // Instantiate the test parse object
        var score = GameScore()
        score.playerName = "Kingsley"
        score.points = 13

        // Save to your server asynchronously (preferred way) - Performs work on background queue and returns to specified callbackQueue.
        // If no callbackQueue is specified it returns to main queue.
        score.save { result in
            switch result {
            case .success(let savedScore):
                print("✅ Parse Object SAVED!: Player: \(String(describing: savedScore.playerName)), Score: \(String(describing: savedScore.points))")
            case .failure(let error):
                assertionFailure("Error saving: \(error)")
            }
        }
        return true
    }



    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }
}


// https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/1%20-%20Your%20first%20Object.xcplaygroundpage/Contents.swift#L33
// Create your own value type `ParseObject`.
struct GameScore: ParseObject {
    // These are required by ParseObject
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?

    // Your own custom properties.
    // All custom properties must be optional.
    var playerName: String?
    var points: Int?
}


extension GameScore {

    
    init(playerName: String, points: Int) {
        self.playerName = playerName
        self.points = points
    }
}

