# Automated GitHub Builds

Source https://medium.com/@seshasai_30381/flutter-github-actions-a-ci-cd-pipeline-for-flutter-apps-with-github-actions-fastlane-and-7e34d9727b2a

This document describes how to set up automated builds for your GitHub repository. Automated builds are useful for ensuring that your code is always in a working state, and for automatically generating releases.

## Step 1: Generate signing key
Generate a signing key for your app. This key is used to sign the APK file, which is required for uploading to the Google Play Store.

```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release
```

You might need to install the Java Development Kit (JDK) to use the `keytool` command (using brew run `brew install openjdk`)

Copy key.jks to `<yourproject>/android` folder.

Save the keystore password as a github secret, call it `ANDROID_KEY_STORE_PASSWORD`

## Step 2: Configure gradle
Add the following to your `android/app/build.gradle` file:

```gradle
signingConfigs{
   release {
     keyAlias keystoreProperties['keyAlias']
     keyPassword keystoreProperties['keyPassword']
    storeFile keystoreProperties['storeFile'] ?         file(keystoreProperties['storeFile']) : nullstorePassword keystoreProperties['storePassword']
    }
  }
buildTypes {
  release {
    signingConfig signingConfigs.release
    }
}
```

Add the following to your `android/key.properties` file:

```properties
storePassword=<password>
keyPassword=<password>
keyAlias=release
storeFile=../key.jks
```

Also, update android/build.gradle to use the key.properties to load the signing certificate

```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
  keystoreProperties.load(new     FileInputStream(keystorePropertiesFile))
}
```

## Step 3: Encrypting keystore
We’ll be using Secrets to store our sensitive data on GitHub for app build generation. Let’s start with the keystore file we use to sign our application builds with.

Encrypt the Keystore on the client safely with gpg:
```
gpg -c --armor key.jks
```

Create the output of this command as a secret in your GitHub repository, call it `RELEASE_KEYSTORE_FILE`.

## Step 4: Generate service account
Follow steps at: https://docs.fastlane.tools/actions/supply/#setup

Save the service account json file as `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON`

Invite the service account email to your Google Play Console and give it: `Release apps to testing tracks` and `Create and publish private apps to your organization`

Enable the API: https://console.developers.google.com/apis/api/androidpublisher.googleapis.com/overview?project=360076556094