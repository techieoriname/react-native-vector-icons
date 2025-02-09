require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = 'react-native-vector-icons-<%= packageName %>'
  s.version      = package['version']
  s.summary      = package['description']
  s.homepage     = package['homepage']
  s.license      = package['license']
  s.authors      = package['author']

  s.platforms    = { ios: min_ios_version_supported, tvos: '9.0', visionos: '1.0' }
  s.source       = { git: package['repository']['url'], tag: "v#{s.version}" }

  s.resources = 'fonts/*.ttf'
<% if (copyCustomFonts) { -%>

  s.script_phase = {
    :name => 'Copy Custom Fonts',
    :script => <<~SCRIPT
      set -e

      WITH_ENVIRONMENT="$REACT_NATIVE_PATH/scripts/xcode/with-environment.sh"

      printenv


      /bin/sh -c "\"$WITH_ENVIRONMENT\" \"${PODS_TARGET_SRCROOT}/scripts/copy-fonts.sh\""
    SCRIPT
  }
<% } -%>
end
