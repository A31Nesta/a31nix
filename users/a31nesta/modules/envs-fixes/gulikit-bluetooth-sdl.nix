{ ... }: {
  # Makes SDL detect input from the Gulikit King Kong 2 Pro Controller when in Xinput wireless mode
  # Only disables HIDAPI for XBOX so Nintendo Switch mode will still work :)
  home.sessionVariables = {
    SDL_JOYSTICK_HIDAPI_XBOX = "0";
  };
}
