# mapping out new machine setup

dep 'aruRawrSetup' do
  requires 'Google Chrome.app', 'Firefox.app', 'YoruFukurou.app', 'Carbon Copy Cloner.app', 'Colloquy.app', 'KisMAC.app', 'Adium.app', 'TextExpander.app', 'Mactracker.app', 'ZimbraDesktop.installer', 'TextMate.app', 'nmap.installer', 'Growl.installer', 'CrashPlan.installer', 'Remote Desktop Connection.installer'
end
dep 'Google Chrome.app' do
  source 'https://dl-ssl.google.com/chrome/mac/stable/CHFA/googlechrome.dmg'
end
dep 'Firefox.app' do
  source 'http://3347-mozilla.voxcdn.com/pub/mozilla.org/firefox/releases/5.0/mac/en-US/Firefox%205.0.dmg'
end
dep 'YoruFukurou.app' do
  source 'http://aki-null.net/yf/YoruFukurou_SL.zip'
end
dep 'Carbon Copy Cloner.app' do
  source 'http://web.mac.com/bombich/ccc-3.3.7.dmg'
end
dep 'Colloquy.app' do
  source 'http://colloquy.info/downloads/colloquy-latest.zip'
end
dep 'KisMAC.app' do
  source 'http://update.kismacmirror.com/binaries/KisMAC-0.3.3.dmg'
end
dep 'Adium.app' do
  source 'http://download.adium.im/Adium_1.4.2.dmg'
end
dep 'TextExpander.app' do
  source 'http://cdn.smilesoftware.com/TextExpander_3.3.0.1.zip'
end
dep 'Mactracker.app' do
  source 'http://www.mactracker.ca/downloads/Mactracker_6.0.2.zip'
end
dep 'ZimbraDesktop.installer' do
  source 'http://files2.zimbra.com/downloads/zdesktop/7.0.1/b10791/zdesktop_7_0_1_b10791_macos_intel.dmg'
# Test that the actual .app bundle is in the right place.
  met? { "/Applications/Zimbra Desktop/Zimbra Desktop.app".p.exists? }
end
dep 'TextMate.app' do
  source 'http://download.macromates.com/TextMate_1.5.10.zip'
end
dep 'nmap.installer' do
  source 'http://nmap.org/dist/nmap-5.51.dmg'
end
dep 'Growl.installer' do
  source 'http://growl.cachefly.net/Growl-1.2.2.dmg'
  provides 'growlnotify'
  # Test that the prefPane is in the right place.
  # TODO: get HardwareGrowler out of Extras folder in DMG, add to login items, run, and hide dock icon
  met? { "/Library/PreferencePanes/Growl.prefPane".p.exists? }
end
dep 'CrashPlan.installer' do
  source 'http://download.crashplan.com/installs/mac/install/CrashPlanPRO/CrashPlanPRO_2010-03-08_Mac.dmg'
end
dep 'Remote Desktop Connection.installer' do
  source 'http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg'
end
# These both require license agreements before drag-drop
# dep 'OmniGraffle.app' do
#   source 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.5/OmniGrafflePro-5.2.3-English.dmg'
# end
# dep 'OmniDiskSweeper.app' do
#   source 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.4/OmniDiskSweeper-1.7.2.dmg'
# end
#
# + iWork from local network, 
# http://support.apple.com/downloads/DL1097/en_US/iWork9.0.5Update.dmg
# + ARD and ServerAdmin Tools from  dev site
# + DeployStudio admin/runtime once I test new rev
# + VPNTracker requires acct login to download, http://www.equinux.com/us/products/vpntracker/download.html
# TODO: do a before mkdir for ~/Library/Extensions to add http://www.verticalforest.com/youtube5/YouTube5.safariextz