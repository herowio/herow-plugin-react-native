package com.reactnativeherowsdkmodule

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

import io.herow.sdk.connection.HerowPlatform
import io.herow.sdk.detection.HerowInitializer

class HerowSdkModuleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  private val herowInitializer: HerowInitializer = HerowInitializer.getInstance(reactContext)

  override fun getName() = "HerowSdkModule"

  @ReactMethod
  fun initialize(herowPlatform: String, username: String, password: String) = herowInitializer
      .configApp(username, password)
      .configPlatform(HerowPlatform.valueOf(herowPlatform))
      .synchronize()

  @ReactMethod
  fun setCustomId(customId: String) = herowInitializer.setCustomId(customId)

  @ReactMethod
  fun removeCustomId() = herowInitializer.removeCustomId()

  @ReactMethod
  fun acceptOptin() = herowInitializer.acceptOptin()

  @ReactMethod
  fun refuseOptin() = herowInitializer.refuseOptin()

  @ReactMethod
  fun launchClickAndCollect() = herowInitializer.launchClickAndCollect()

  @ReactMethod
  fun stopClickAndCollect() = herowInitializer.stopClickAndCollect()
}
