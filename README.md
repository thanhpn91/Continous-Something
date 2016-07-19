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

Appfile, which store app identifier and apple_id and also developer portal team Id

Fastfile, which manages the defined lanes

Snapfile, which lets you specify the devices and languages you want to provide screenshots for.
