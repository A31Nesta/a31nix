{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.android-studio
    pkgs.androidenv.androidPkgs.androidsdk
  ];

  nixpkgs.config.android_sdk.accept_license = true;
}
