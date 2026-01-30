# with import <nixpkgs> { };
{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  libevdev,
  udev,
  udevCheckHook,
  acl,
}:

stdenv.mkDerivation {
  pname = "joycond";
  version = "unstable-2021-07-30";

  src = fetchFromGitHub {
    owner = "DanielOgorchock";
    repo = "joycond";
    rev = "39d5728d41b70840342ddc116a59125b337fbde2";
    sha256 = "sha256-VT433rrgZ6ltdXLQRjtjRy7rhMl1g9dan9SRqlsCPTk=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
    udevCheckHook
  ];
  buildInputs = [
    libevdev
    udev
  ];

  doInstallCheck = true;

  # CMake has hardcoded install paths
  installPhase = ''
    mkdir -p $out/{bin,etc/{systemd/system,udev/rules.d},lib/modules-load.d}

    cp ./joycond $out/bin
    cp $src/udev/{89,72}-joycond.rules $out/etc/udev/rules.d
    cp $src/systemd/joycond.service $out/etc/systemd/system
    cp $src/systemd/joycond.conf $out/lib/modules-load.d

    substituteInPlace $out/etc/systemd/system/joycond.service --replace \
      "ExecStart=/usr/bin/joycond" "ExecStart=$out/bin/joycond"

    substituteInPlace $out/etc/udev/rules.d/89-joycond.rules --replace \
      "/bin/setfacl"  "${acl}/bin/setfacl"
  '';

  meta = {
    homepage = "https://github.com/DanielOgorchock/joycond";
    description = "Userspace daemon to combine joy-cons from the hid-nintendo kernel driver";
    mainProgram = "joycond";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
    platforms = lib.platforms.linux;
  };
}
