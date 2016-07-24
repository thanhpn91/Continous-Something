#FastLane


FastLane is a set of tools that simplify the deployment and release process. By creating a custom list of build tasks call lanes. Now you can forget the pain when create a ton of provisioning profile, certificates, screenshoot ...

# The Lanes 

![alt text](https://github.com/thanhpn91/Continous-Something/blob/master/lanes.png "Lanes")

Installation can be found in Fastlane github: https://github.com/fastlane/fastlane

After everything setup, you can start by running 
fastlane init

Fastlane will work you through a setup process that ask some question as bellow:
1. 
2.
3.
4.
5.

![alt text] "picture of folder")
Fastlane will be created with 3 files:
```
app_identifier "com.siclo.selfie-cube" # The bundle identifier of your app
apple_id "maxime.pouwels@siclo-mobile.com" # Your Apple email address

team_id "R5JFCDHMFY"  # Developer Portal Team ID

# you can even provide different app identifiers, Apple IDs and team names per lane:
# More information: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Appfile.md

Fastfile, which manages the defined lanes

Appfile, which store app identifier and apple_id and also developer portal team Id
```
lane :beta do 
  #Version Increment
  increment_version_number
  commit_version_bump
  push_to_git_remote
  
  # Building and Signing
  cert
  sigh
  gym
  
  #Upload and Notify
  crashlytics
  slack
end
Snapfile, which lets you specify the devices and languages you want to provide screenshots for.
