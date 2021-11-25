package com.reactnativeherowsdkmodule

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

import io.herow.sdk.connection.HerowPlatform
import io.herow.sdk.detection.HerowInitializer

import java.lang.Exception

class HerowSdkModuleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  private val herowInitializer: HerowInitializer = HerowInitializer.getInstance(reactContext)

  override fun getName() = "HerowSdkModule"

  @ReactMethod
  fun initialize(herowPlatform: String, username: String, password: String) {
    try {
      herowInitializer
        .configApp(username, password)
        .configPlatform(HerowPlatform.valueOf(herowPlatform))
        .synchronize()
    } catch (e : Exception) {
      println("Exception caught: ${e.message}")
    }
  }

  @ReactMethod
  fun setCustomId(customId: String) = herowInitializer.setCustomId(customId)

  @ReactMethod
  fun removeCustomId() = herowInitializer.removeCustomId()

  @ReactMethod
  fun acceptOptin() {
    try {
      herowInitializer.acceptOptin()
    } catch (e : Exception) {
      println("Exception caught: ${e.message}")
    }
  }

  @ReactMethod
  fun refuseOptin() {
    try {
      herowInitializer.refuseOptin()
    } catch (e : Exception) {
      println("Exception caught: ${e.message}")
    }
  }

  @ReactMethod
  fun launchClickAndCollect() = herowInitializer.launchClickAndCollect()

  @ReactMethod
  fun stopClickAndCollect() = herowInitializer.stopClickAndCollect()
}
