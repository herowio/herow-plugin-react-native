import herow_sdk_ios
@objc(HerowSdkModule)
class HerowSdkModule: NSObject {
    let herowInitializer = HerowInitializer.instance
    @objc(initialize:withUsername:withPassword:)
    func initialize(herowPlatform: String, username: String, password: String) -> Void {
        var platform = HerowPlatform.prod
        if herowPlatform == "preprod" || herowPlatform == "PRE_PROD" {
            platform = HerowPlatform.preprod
        }
        herowInitializer.configPlatform(platform).configApp(identifier: username, sdkKey: password).synchronize()
        GlobalLogger.shared.startDebug()
    }

    @objc(setCustomId:)
    func setCustomId(customId: String) -> Void {
        herowInitializer.setCustomId(customId: customId)
    }

    @objc(removeCustomId)
    func removeCustomId() -> Void {
        herowInitializer.removeCustomId()
    }

    @objc(acceptOptin)
    func acceptOptin() -> Void {
        herowInitializer.acceptOptin()
    }

    @objc(refuseOptin)
    func refuseOptin() -> Void {
        herowInitializer.refuseOptin()
    }

    @objc(launchClickAndCollect)
    func launchClickAndCollect() -> Void {
      herowInitializer.launchClickAndCollect()
    }

    @objc(stopClickAndCollect)
    func stopClickAndCollect() -> Void {
        herowInitializer.stopClickAndCollect()
    }

    @objc(askWhenInUseLocationPermission)
    func askWhenInUseLocationPermission() -> Void {
        let permissionManager = herowInitializer.getPermissionManager()
        permissionManager.requestLocation(LocationPermission.whenInUse, completion: nil)

    }

    @objc(askAlwaysLocationPermission)
    func askAlwaysLocationPermission() -> Void {
        let permissionManager = herowInitializer.getPermissionManager()
        permissionManager.requestLocation(LocationPermission.always, completion: nil)

    }

    @objc(askNotificationsPermission)
    func askNotificationsPermission() -> Void {
        let permissionManager = herowInitializer.getPermissionManager()
        permissionManager.requestNotificationPermission(completion: nil)

    }

    @objc(requestIDFA)
    func requestIDFA() -> Void {
        let permissionManager = herowInitializer.getPermissionManager()
        permissionManager.requestIDFA(completion: nil)

    }
}

