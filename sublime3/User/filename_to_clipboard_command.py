#Add this to the User Keybindings
#{ "keys": ["ctrl+super+t"], "command": "filename_to_clipboard" },

import sublime, sublime_plugin, os, re

class FilenameToClipboardCommand(sublime_plugin.TextCommand):
    def spec(self, s):
      return s if s.find("spec/") == -1 else s[s.find('spec'):]

    def test(self, s):
      return s if s.find("test/") == -1 else s[s.find('test'):]

    def migrate(self, s):
      return s if s.find("migrate/") == -1 else s.split("/")[-1].split("_")[0]

    def feature(self, s):
      return s if s.find("features/") == -1 else s[s.find('features'):]

    def run(self, edit):
      s = str(self.view.file_name())
      s = self.migrate(s)
      s = self.spec(s)
      s = self.test(s)
      s = self.feature(s)
      sublime.set_clipboard(s)
