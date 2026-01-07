{ inputs, pkgs, lib, ... }:

{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;

    equibop = {
      enable = true;
      autoscroll.enable = true;
      
      package = pkgs.equibop.overrideAttrs (_: {
        postBuild = ''
          pushd build
          ${lib.getExe' pkgs.python313Packages.icnsutil "icnsutil"} e icon.icns
          popd
        '';

        installPhase = ''
          runHook preInstall
          mkdir -p $out/opt/Equibop
          cp -r dist/*unpacked/resources $out/opt/Equibop/

          for file in build/icon.icns.export/*\@2x.png; do
            base=''${file##*/}
            size=''${base/x*/}
            targetSize=$((size * 2))
            install -Dm0644 $file $out/share/icons/hicolor/''${targetSize}x''${targetSize}/apps/equibop.png
          done

          runHook postInstall
        '';
      });
      };

      config = {
        useQuickCss = true;
        enabledThemes = [ "dank-discord.css" ];

        plugins = {
          bannersEverywhere.enable = true;
          BlurNSFW.enable = true;
          callTimer.enable = true;
          channelTabs.enable = true;
          characterCounter.enable = true;
          ClearURLs.enable = true;
          crashHandler.enable = true;
          # CursorBuddy.enable = true;
          decor.enable = true;
          experiments.enable = true;
          expressionCloner.enable = true;
          fakeNitro.enable = true;
          fixSpotifyEmbeds.enable = true;
          fontLoader = {
            enable = true;
            fontSearch = {
              selectedFont = "JetBrains Mono";
            };
            applyOnCodeBlocks = true;
          };
          forceOwnerCrown.enable= true;
          friendCodes.enable = true;
          friendsSince.enable = true;
          FullVCPFP.enable = true;
          gifPaste.enable = true;
          gitHubRepos.enable = true;
          imageZoom.enable = true;
          imgToGif.enable = true;
          keyboardSounds = {
            enable = true;
            soundPack = "osu";
          };
          messageColors.enable = true;
          moreKaomoji.enable = true;
          moyai.enable = true;
          noReplyMention.enable = true;
          openInApp.enable = true;
          petpet.enable = true;
          pictureInPicture.enable = true;
          PinDMs = {
            enable = true;
            canCollapseDmSection = true;
            userBasedCategoryList."593822661105156135" = [
              {
                id = "ptd8xgu9ax8";
                name = "AIRIIIII!!!!";
                color = 15277667;
                collapsed = false;
                channels = [
                  "1375490137760206913"
                ];
              }
              {
                id = "im6e23ihyaf";
                name = "Important people";
                color = 15844367;
                collapsed = false;
                channels = [
                  "1140777812870049944"
                  "1145734095217897533"
                  "1189005452739092510"
                  "1336302201999462421"
                ];
              }
            ];
            pinOrder = 0;
          };
          quickReply.enable = true;
          readAllNotificationsButton.enable = true;
          spotifyCrack.enable = true;
          translate = {
            enable = true;
            service = "deepl";
          };
          typingIndicator.enable = true;
          unlockedAvatarZoom.enable = true;
          USRBG.enable = true;
          viewIcons = {
            enable = true;
            format = "png";
          };
          voiceButtons.enable = true;
          voiceChatDoubleClick.enable = true;
          voiceDownload.enable = true;
          voiceMessages.enable = true;
          volumeBooster.enable = true;
          webKeybinds.enable = true;
          webScreenShareFixes.enable = true;
          whoReacted.enable = true;
          youtubeAdblock.enable = true;
        };
      
    };
  };
}
