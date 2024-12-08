{
    SDL2,
    boost,
    bullet,
    cmake,
    fetchFromGitHub,
    fetchFromGitLab,
    ffmpeg,
    inputs,
    libxml2,
    luajit,
    lz4,
    minizip,
    openal,
    openscenegraph,
    pkg-config,
    qt6,
    readline,
    recastnavigation,
    stdenv,
    unshield,
    wrapQtAppsHook,
    xorg,
    yaml-cpp,
    ...
}:

let
    GL = "GLVND";

    collada-dom = stdenv.mkDerivation {
        pname = "collada-dom";
        version = "master";

        src = fetchFromGitHub {
            owner = "rdiankov";
            repo = "collada-dom";
            rev = "c1e20b7d6ff806237030fe82f126cb86d661f063";
            sha256 = "A1ne/D6S0shwCzb9spd1MoSt/238HWA8dvgd+DC9cXc=";
        };

        postInstall = ''
            chmod +w -R $out
            mv $out/include/*/* $out/include
        '';

        nativeBuildInputs = [ cmake ];

        buildInputs = [
            boost
            libxml2
            minizip
            readline
        ];
    };

    osg' = (openscenegraph.override { colladaSupport = true; }).overrideDerivation (old: {
        COLLADA_DIR = collada-dom;
        cmakeFlags = (old.cmakeFlags or []) ++ [
            "-Wno-dev"
            "-DOpenGL_GL_PREFERENCE=${GL}"
            "-DBUILD_OSG_PLUGINS_BY_DEFAULT=0"
            "-DBUILD_OSG_DEPRECATED_SERIALIZERS=0"
        ] ++ (map (e: "-DBUILD_OSG_PLUGIN_${e}=1") [ "BMP" "DAE" "DDS" "FREETYPE" "JPEG" "OSG" "PNG" "TGA" ]);
    });

    bullet' = bullet.overrideDerivation (old: {
        cmakeFlags = (old.cmakeFlags or []) ++ [
            "-Wno-dev"
            "-DOpenGL_GL_PREFERENCE=${GL}"
            "-DUSE_DOUBLE_PRECISION=ON"
            "-DBULLET2_MULTITHREADING=ON"
        ];
    });

    mygui' = inputs.mygui.legacyPackages.x86_64-linux.mygui.overrideDerivation (old: {
        cmakeFlags = (old.cmakeFlags or []) ++ [
            "-DMYGUI_DONT_USE_OBSOLETE=ON"
        ];
    });

in
stdenv.mkDerivation {
    pname = "openmw";
    version = "0.49.0";

    src = fetchFromGitLab {
        owner = "OpenMW";
        repo = "openmw";
        # rev = "2aa249e82a964e44e48e5704303824dde54fbf44";
        rev = "c207397c568996ad7eff581bdaed23256c92c674";
        hash = "sha256-xkSD5yKWJQwTPE4soiL9SvrT0kbWRFgMUqehF0/9QpI=";
    };

    nativeBuildInputs = [ cmake pkg-config wrapQtAppsHook ];

    buildInputs = [
        SDL2
        boost
        bullet'
        ffmpeg
        luajit
        lz4
        mygui'
        openal
        osg'
        qt6.full
        qt6.qtbase
        recastnavigation
        unshield
        xorg.libXt
        yaml-cpp
    ];

    cmakeFlags = [
        "-DOpenGL_GL_PREFERENCE=${GL}"
        "-DOPENMW_USE_SYSTEM_RECASTNAVIGATION=1"
    ];
}
