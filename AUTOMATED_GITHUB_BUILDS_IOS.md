# Automated GitHub Builds

This document describes how to set up automated builds for your GitHub repository. Automated builds are useful for ensuring that your code is always in a working state, and for automatically generating releases.

## Step 1: Init fastlane
Go to your ios/ directory in your project, and run `fastlane init`

The Appfile should look like this
```bash
app_identifier(ENV["DEVELOPER_APP_IDENTIFIER"])
apple_id(ENV["FASTLANE_APPLE_ID"])

itc_team_id(ENV["APP_STORE_CONNECT_TEAM_ID"])
team_id(ENV["DEVELOPER_PORTAL_TEAM_ID"])
```

## Step 2: Create a new Apple Bundle ID
Go to the Apple Developer Portal and create a new Bundle ID for your app. You can use the same Bundle ID as your existing app, but you will need to create a new App ID if you have not already done so.

[Apple Developer Portal -> Identifers](https://developer.apple.com/account/resources/identifiers/bundleId/) (select App IDs then App when asked what type of identifier you want to create)

## Step 3: Create a new App in App Store Connect
Go to [App Store Connect](https://appstoreconnect.apple.com/apps) and create your app, if you have not already done so.

## Step 4: Create a repository for certificates and profiles

### Generate Matchfile
Go to your `ios/` folder and run `fastlane match init`. This will create a new repository in your GitHub account to store your certificates and profiles.

Choose the git option. I use SSH, so I pasted the SSH URL of the repository.

This will create a Matchfile in your ios/fastline directory. The Matchfile should look like this:

```bash
git_url("git@github.com:acute-triage/app-certificates-and-profiles.git")
storage_mode("git")
type("appstore") # The default type, can be: appstore, adhoc, enterprise or development

app_identifier(["dk.acutetriage.app"])
# username("your@appleid.com") # Your Apple Developer Portal username

# For all available options run `fastlane match --help`
# Remove the # in the beginning of the line to enable the other options

# The docs are available on https://docs.fastlane.tools/actions/match
```

### Create .env file
Create a `.env` file in your `ios/fastlane` directory with the following content:

```bash
ASC_KEY_ID=""
ASC_ISSUER_ID=""
ASC_KEY_P8=""
MATCH_PASSWORD=""
MATCH_GIT_BASIC_AUTHORIZATION=""
```

We'll fill in the values for these variables runningly. Later we'll add them to our GitHub repository secrets.

### Create a personal GitHub access token
Create a classic personal access token in your GitHub account. You can do this by going to [GitHub -> Settings -> Developer settings -> Personal access tokens](https://github.com/settings/tokens/new).

Select the `repo` scope, and copy the token. Now convert the token to a base64 string by running the following command in your terminal:

```bash
echo -n 'your_github_username:your_personal_access_token' | base64 | pbcopy
```

The base64 string will be copied to your clipboard. Set the `MATCH_GIT_BASIC_AUTHORIZATION` variable in your `.env` file to this value.

### Create API keys for App Store Connect
Go to [App Store Connect -> Users and Access -> Keys](https://appstoreconnect.apple.com/access/api) and create a new key. Select "Team".

Set the `ASC_KEY_ID`, `ASC_ISSUER_ID` variables in your `.env` file to the values displayed on the key page.

The `ASC_KEY_P8` value should be the contents of the `.p8` file that you downloaded when you created the key, base64 encoded. You can do this by running the following command in your terminal:

```bash
cat /path/to/your/key.p8 | base64 | pbcopy
```

### Adjust signing for release mode
1. Open XCWorkspace in Xcode (`open ios/Runner.xcworkspace`)
2. Select the Runner project in the left sidebar, and select the "Runner" target in the main window.
3. Go to the "Signing & Capabilities".
4. Go to "Release" and untick "Automatically manage signing".
5. From Provisioning Profile you might need to click "Download" to download the profile.
6. Select the "match AppStore [your app identifier]" profile.



# Credits
- https://dev.to/danielgomezrico/how-to-build-flutter-apps-on-ci-with-fastlane-and-reuse-some-code-2np3
- https://medium.com/@manoelsrs/setting-up-a-ci-cd-pipeline-for-ios-using-fastlane-and-github-actions-in-a-flutter-project-8fd350237c33