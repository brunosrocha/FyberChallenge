# Fyber Challenge

#### Before all:

This application was developed using the newest version of XCode(6.0) and also use Pods to manage dependencies.

#### CocoaPods

CocoaPods is the dependency manager for Objective-C projects. More info [at CocoaPods](https://cocoapods.org/)

How to install: 

 * Update your RubyGems to make sure you have the lastest version.
 		
      **sudo gem update --system**
        
 * Install CocoaPods
 		
      **sudo gem install cocoapods**

* Setup CocoaPods
 		
      **pod setup**
        
* Navigate to your project folder and run
		  
      **pod init**

* Run Pod Install
		  
      **pod install**
        
 After all these steps you might see something like this:
 
		**[!] From now on use `PROJECT_NAME.xcworkspace`.**
 
From now on you should have use PROJECT_NAME.xcworkspace instead PROJECT_NAME.xcodeproj
       

#### Knowing Issues:

Sometimes the functional tests stop working on simulator it is a XCode(6.0) bug.
Fix: Reset simulator content and settings.

On device they always work
