let version = http get https://api.canary.fluxer.app/dl/desktop/canary/linux/x64/latest/appimage
  | metadata
  | get http_response.headers
  | where name == 'content-disposition'
  | get value
  | parse --regex '(\d\.\d\.\d+)'

print $version
