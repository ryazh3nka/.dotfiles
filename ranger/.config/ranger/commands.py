from __future__ import (absolute_import, division, print_function)

import os
from ranger.api.commands import Command

class copy_to_clipboard(Command):
    """
    :copy_to_clipboard
    copies the currently selected files to the Wayland clipboard as file URIs
    """
    def execute(self):
        files = [f.realpath for f in self.fm.thistab.get_selection()]
        if files:
            file_paths = [f'"{file}"' for file in files]
            cmd = f'~/.config/ranger/copy_to_clipboard {" ".join(file_paths)}'
            os.system(cmd)
            self.fm.notify("Copied to clipboard")
        else:
            self.fm.notify("No files selected", bad=True)

