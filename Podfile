source 'https://cdn.cocoapods.org/'

project './DemoTableView/DemoTableView.xcodeproj'

use_frameworks!

# Pods shared across all targets
def shared_pods

  # Core
  pod 'RealmSwift', '~> 4.3'

  pod 'SwiftyUserDefaults', '~> 5.0.0'
  pod 'SwiftDate', '~> 5.1'
  
  # Utilities
  pod 'SwiftyBeaver', '~> 1.8'
  pod 'SwiftGen', '~> 6.1'
  pod 'SwiftLint', '~> 0.38'
  
end

inhibit_all_warnings!

abstract_target 'AppCommon' do

  platform :ios, '11.0'

  shared_pods

  target 'DemoTableViewCore' do

  end

  target 'DemoTableView' do

    # UI
    pod 'Reusable', '~> 4.1'
    pod 'Kingfisher', '~> 5.12'

  end

end
