platform :ios, '9.0'
use_frameworks!

target 'Elo7Test' do
    pod 'Alamofire'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'AlamofireNetworkActivityIndicator'
    pod 'AlamofireImage', '~> 3.1'
    pod 'ReachabilitySwift'

    pod 'RxSwift', '~> 3.0.0-beta.2'
    pod 'RxCocoa', '~> 3.0.0-beta.2'
    pod 'RxDataSources', '1.0.0-beta.2'
    
    pod 'SwiftyJSON'
    
    pod 'SnapKit'
    pod 'GSKStretchyHeaderView'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.10'
    end
  end
end

