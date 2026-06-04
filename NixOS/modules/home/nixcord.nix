{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    discord = {
      # enable = false;
      vencord.enable = false;
      equicord.enable = true;

      commandLineArgs = [
        "--start-minimized"
        "--ozone-platform=wayland"
        "--enable-features=VaapiVideoDecoder,MiddleClickAutoscroll"
        # "--enable-blink-features=MiddleClickAutoscroll"
      ];
    };

    equibop = {
      enable = true;
      autoscroll.enable = true;
    };

    config = let
      system24 = "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/flavors/system24-catppuccin-mocha.theme.css";
    in
    {
      useQuickCss = true;
      enabledThemeLinks = [
        system24
      ];

      themeLinks = [
        system24
      ];

      frameless = true;

      plugins = {
        bannersEverywhere.enable = true;
        BlurNSFW.enable = true;
        callTimer.enable = true;
        channelTabs.enable = true;
        characterCounter.enable = true;
        ClearURLs.enable = true;
        crashHandler.enable = true;
        decor.enable = true;
        experiments.enable = true;
        expressionCloner.enable = true;
        fakeNitro.enable = true;
        fixSpotifyEmbeds.enable = true;
        fontLoader = {
          enable = true;
          selectedFont = "JetBrains Mono";
          applyOnCodeBlocks = true;
        };
        forceOwnerCrown.enable = true;
        friendCodes.enable = true;
        friendsSince.enable = true;
        FullVCPFP.enable = true;
        gifPaste.enable = true;
        gitHubRepos.enable = true;
        imageZoom.enable = true;
        # imgToGif.enable = true;
        keyboardSounds = {
          enable = true;
          soundPack = "osu";
        };
        messageColors.enable = true;
        # moreKaomoji.enable = true;
        moyai.enable = true;
        noReplyMention.enable = true;
        openInApp.enable = true;
        petpet.enable = true;
        pictureInPicture.enable = true;
        moreCommands.enable = true;
        PinDMs = {
          enable = true;
          canCollapseDmSection = true;
          userBasedCategoryList."593822661105156135" = [
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
