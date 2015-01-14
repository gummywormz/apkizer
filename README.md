# apkizer
Shell script for ARChon extensions

**Usage**: 
```
apkizer.sh /path/to/apk.apk /full/output/directory
```

**Limitations**

* aapt must be in your path.
* Mac and Linux only. [JARC-APK 1.3](https://github.com/gummywormz/JARC-APK) will be released to accept command line arguments so you can use that on Windows.
* Only one extension per directory, since this was designed with Android Studio in mind.

**Android Studio Template**

You can modify the base build.gradle template in Android Studio to add a task to launch the app in Chrome. The sample is in build.gradle.ftl
Replace ##USERNAME## with your account's username. Change the path to apkizer.sh if needed, and the path to Chrome (it is set up for Mac OS right now).

Now, go to where you installed Android Studio. On Macs, this is in the executeable itself (right click > show package contents).
Navigate to plugins/android/lib/templates/gradle-projects/NewAndroidModule/root/ and replace the build.gradle.ftl file and you should see a task called archondebug. Just run it and you're good to go. (Make sure you have the gradle tab on the side open.)

**License**

Do whatever you want with it...
