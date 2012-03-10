# updated, eula-accept dmg handling thanks to j2fly, https://github.com/benhoskings/babushka/issues/136#issuecomment-2177849

meta 'eula_app' do
  accepts_value_for :app_name, :basename
  accepts_value_for :source, :source
  accepts_value_for :dmg_name

  template {
    met? {
      "/Applications/#{app_name}".p.exist?
    }
    meet {
      log "Using Babushka's Resource.get to snatch #{app_name}"
      Babushka::Resource.get("#{source}") do end
      log_shell "Stripping EULA","/usr/bin/hdiutil convert -quiet ~/.babushka/downloads/#{dmg_name} -format UDTO -o ~/.babushka/downloads/app"
      log_shell "Mounting and creating local folder with contents of DMG","/usr/bin/hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint ~/.babushka/downloads/app ~/.babushka/downloads/app.cdr"
      log_shell "Copying into /Applications","sudo cp -r ~/.babushka/downloads/app/*.app /Applications", :spinner => true

      after {
        log "Detaching DMG and deleting the .cdr we created"
        shell("/usr/bin/hdiutil detach ~/.babushka/downloads/app/")
        "~/.babushka/downloads/app.cdr".p.remove
      }
    }
  }
end

dep 'aruRawrSetup' do
  requires 'Firefox.app', 'Google Chrome.app', 'Remote Desktop Connection.installer', 'ScreenSharingMenulet.app', 'Server Admin Tools.installer', 'Carbon Copy Cloner.app', 'Adium.app', 'VirtualBox.installer', 'nmap.installer', 'Mactracker.app', 'TextMate.app', 'TextExpander.app'
end
dep 'Firefox.app' do
  source 'http://mirrors.coreix.net/mozilla/firefox/releases/10.0.2/mac/en-US/Firefox%2010.0.2.dmg'
end
dep 'Google Chrome.app' do
  source 'https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg'
end
dep 'Remote Desktop Connection.installer' do
 source 'http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg'
 met? { "/Applications/Remote Desktop Connection.app".p.exists? }
end
dep 'ScreenSharingMenulet.app' do
  source 'http://www.klieme.com/Downloads/ScreenSharingMenulet/ScreenSharingMenulet_2.2.zip'
end
# OmniGroup Products require EULA acceptance
# dep 'OmniGraffle Professional 5.app', :template => 'eula_app' do
#   source 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.5/OmniGrafflePro-5.3.6-English.dmg'
#   dmg_name 'OmniGrafflePro-5.3.6.dmg'
# end
dep 'Server Admin Tools.installer' do
  source 'http://support.apple.com/downloads/DL1488/en_US/AdminTools10.7.3.dmg'
  met? { "/Applications/Server".p.exists? }
end
dep 'Carbon Copy Cloner.app' do
  source 'http://web.mac.com/bombich/ccc-3.4.4.dmg'
end
dep 'Adium.app' do
  source 'http://download.adium.im/Adium_1.4.4.dmg'
end
dep 'VirtualBox.installer' do
  source 'http://download.virtualbox.org/virtualbox/4.1.8/VirtualBox-4.1.8-75467-OSX.dmg'
end
dep 'nmap.installer' do
  source 'http://nmap.org/dist/nmap-5.51.dmg'
end
dep 'TextExpander.app' do
  source 'http://cdn.smilesoftware.com/TextExpander_3.3.0.1.zip'
end
dep 'Mactracker.app' do
  source 'http://www.mactracker.ca/downloads/Mactracker_6.0.2.zip'
end
dep 'TextMate.app' do
  source 'http://download.macromates.com/TextMate_1.5.10.zip'
end



# dep 'OmniDiskSweeper.app', :template => 'eula_app' do
#   source 'http://www.omnigroup.com/ftp1/pub/software/MacOSX/10.4/OmniDiskSweeper-1.7.2.dmg'
#   dmg_name 'OmniGrafflePro-5.3.3.dmg'
# end
#
# + iWork from local network, 
# http://support.apple.com/downloads/DL1097/en_US/iWork9.0.5Update.dmg
# Xcode and PackageMaker from offline pkg
# ARD, ServerAdmin Tools, command line tools for Xcode from  dev site
# 'Right' version of VMWare from my Dropbox
# Repackaged SuspisciousPackage(meta!)
# TODO: do a before mkdir for ~/Library/Extensions to add http://www.verticalforest.com/youtube5/YouTube5.safariextz
# http://www.charlessoft.com/Pacifist_2.6.4.dmg
# http://download.microsoft.com/download/A/A/7/AA7AB701-B35D-4EA7-A02A-BAAD536EA8CF/Microsoft%20Mouse_d291.dmg

# dep 'YoruFukurou.app' do
#   source 'http://aki-null.net/yf/YoruFukurou_SL.zip'
# end
# dep 'ZimbraDesktop.installer' do
#   source 'http://files2.zimbra.com/downloads/zdesktop/7.0.1/b10791/zdesktop_7_0_1_b10791_macos_intel.dmg'
# # Test that the actual .app bundle is in the right place.
#   met? { "/Applications/Zimbra Desktop/Zimbra Desktop.app".p.exists? }
# end
# dep 'Growl.installer' do
#   source 'http://growl.cachefly.net/Growl-1.2.2.dmg'
#   provides 'growlnotify'
#   # Test that the prefPane is in the right place.
#   # TODO: get HardwareGrowler out of Extras folder in DMG, add to login items, run, and hide dock icon
#   met? { "/Library/PreferencePanes/Growl.prefPane".p.exists? }
# end
# dep 'CrashPlan.installer' do
#   source 'http://download.crashplan.com/installs/mac/install/CrashPlanPRO/CrashPlanPRO_2010-03-08_Mac.dmg'
#   met? { "/Applications/CrashPlan.app".p.exists? }
# end
