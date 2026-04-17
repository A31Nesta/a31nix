{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.lmstudio
    pkgs.ollama-rocm
  ];

  # services.ollama = {
  #   enable = true;
  #   package = pkgs.ollama-rocm;
  #   environmentVariables = {
  #     HCC_AMDGPU_TARGET = "gfx1201"; # used to be necessary, but doesn't seem to anymore
  #   };
  #   # results in environment variable "HSA_OVERRIDE_GFX_VERSION=12.0.0"
  #   rocmOverrideGfx = "12.0.0";
  # };
}
