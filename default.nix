{ lib
, stdenv
, meson
, ninja
, ncurses
}:

stdenv.mkDerivation {
  pname = "izumi";
  version = lib.strings.trim (builtins.readFile ./.version);

  src = ./.;

  nativeBuildInputs = [
    meson
    ninja
  ];

  buildInputs = [
    ncurses
  ];

  mesonBuildType = "release";

  mesonFlags = [
    (lib.strings.mesonOption "b_sanitize" "none")
  ];

  meta = with lib; {
    description = "An instruction pipeline visualizer for Onikiri2-Kanata format based on Konata";
    homepage = "https://github.com/theOfficeCat/Izumi/";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
