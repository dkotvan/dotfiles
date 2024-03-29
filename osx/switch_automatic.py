#!/usr/bin/env python3
# Copied from https://gist.github.com/FradSer/de1ca0989a9d615bd15dc6eaf712eb93

import asyncio
import iterm2
from os.path import expanduser

async def changeTheme(theme_parts, connection):
    background = ""
    # Themes have space-delimited attributes, one of which will be light or dark.
    if "dark" in theme_parts:
        background = 'dark'
        preset = await iterm2.ColorPreset.async_get(connection, "gruvbox-dark")
    else:
        background = 'light'
        preset = await iterm2.ColorPreset.async_get(connection, "gruvbox-light")

    home = expanduser("~")
    f = open(home + "/.background","w")
    f.write(background)
    f.close()

    # Update the list of all profiles and iterate over them.
    profiles=await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the full profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)

async def main(connection):
    # Set color scheme correctly at app start
    app = await iterm2.async_get_app(connection)
    parts = await app.async_get_theme()
    await changeTheme(parts, connection)


    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()
            parts = theme.split(" ")
            await changeTheme(parts, connection)


iterm2.run_forever(main)
