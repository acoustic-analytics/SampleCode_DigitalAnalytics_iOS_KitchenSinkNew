# SampleCode_DigitalAnalytics_iOS_KitchenSinkNew
iOS KitchenSinkNew instrumented with Digital Analytics sdk.

## Getting Started

### Prerequisites

You need to have recent cocoapods version install on your Mac OS. Current version is 1.4.0. Please refer to cocoapods website for the details.

For SDK prerequisites and documentation, please refer to the SDK documentation [here](https://developer.goacoustic.com/acoustic-dig-analytics/docs/getting-started-with-the-digital-analytics-sdk-for-ios)

### Installing

Clone the sample app code from git hub location

`git clone https://github.com/acoustic-analytics/SampleCode_DigitalAnalytics_iOS_KitchenSinkNew.git`

Go to the sample app location

`cd KitchenSinkNew`

Also note the platform in the Podfile iOS 12

`platform :ios, '12.0'`

Note that use_frameworks is commented

`# use_frameworks!`

In the respective targets for your project in the Podfile add the following line if you want to use Digital Analytics SDK's release version

`pod 'DigitalAnalytics'`

In the respective targets for your project in the Podfile add the following line if you want to use Digital Analytics SDK's debug version

`pod 'DigitalAnalyticsDebug'`

You will notice that by default the sample application uses `pod 'DigitalAnalyticsDebug'`

Note that you can use only one of  `pod 'DigitalAnalytics'` and `pod 'DigitalAnalyticsDebug'`. Do not use both at the same time.

Now you need to install the pods by running one of the following commands.

`pod install`

or to update

`pod update`

Above pod command (install or update) should complete with no errors. If you do see errors run the same command with `--verbose` option and share the error log with us.

Open `KitchenSinkNew.xcworkspace` file and not the `KitchenSinkNew.xcodeproj` file. Once you open the workspace file, please use target WebExample to build the sample app and run it. There are multiple targets in the project however the only one that serves for this example is the WebExample target.

## Update Post Location
Go to `BasicConfig.plist`, then update `ClientId` for correct client id. Also update `PostMessageUrl` to correct post url.

## Troubleshooting

If you are using Debug version of Tealeaf SDK. i.e. `pod 'DigitalAnalyticsDebug'` , then you may edit your project's scheme in XCode and add environmental variable `EODebug`and set its value to 1; also add environmental variable `DIGITAL_ANALYTICS_DEBUG` and set its value to 1. This will make the SDK to start writing debug logs to your xcode console window. If and when you want to report issues, the Tealeaf support engineers will ask you for these logs.


## Versioning


## License

License files can be read [here](https://github.com/acoustic-analytics/SampleCode_DigitalAnalytics_iOS_KitchenSinkNew/blob/master/Licenses/License)
