# BetterBagsItemDumper: a World of Warcraft plugin for the BetterBags addon

Adds all bag and bank items to a table in the WTF directory to make it
easier to see what data is available to plugins to parse.

After logging in and out, inspect the addon's WTF file to see the item
objects passed to plugins.

BetterBags does NOT pass tooltip info to the registered plugin's
callback. As some plugins may need to filter based on tooltip info,
this plugin appends that info to its table entries in its WTF file.
See the source code for this plugin to see how to query that info in
your own plugin.

Prerequisite: https://github.com/Cidan/BetterBags
