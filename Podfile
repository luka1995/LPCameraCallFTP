platform :ios, '7.0'
inhibit_all_warnings!

pod 'FTPManager', '~> 1.6'
pod 'SIAlertView', '~> 1.2'
pod 'MSDynamicsDrawerViewController', '~> 1.5.1'
pod 'Reachability', '~> 3.1.1'

post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Pods-Acknowledgements.plist', 'LPCameraCallFTP/Application/Settings.bundle/Acknowledgements.plist', :remove_destination => true)
end