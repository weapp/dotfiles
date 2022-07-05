# Place inside Data\Packages\User
# Run: view.run_command("close_saved")

#  Place the two files - closesaved.py and Tab Context.sublime-menu files inside Data\Packages\User.
# Data\Packages\User folder can be open from Preferences -> Browse packages
# To view the output of the script press Ctrl + `
# To execute the script, right click on any tab and select "Close Saved Files" in the context menu.
# Run: view.run_command("close_saved")

import sublime
import sublime_plugin


class CloseSavedCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        activeWindow = sublime.active_window()
        views = sublime.Window.views(activeWindow)
        for each in views:
            if each.is_dirty() == False:
                # print("Dirty: " + str(each.is_dirty())) - DOn't need this as we know that file is not dirty.
                if each.file_name() != None:
                    print("Closing " + each.file_name())
                    each.close()

