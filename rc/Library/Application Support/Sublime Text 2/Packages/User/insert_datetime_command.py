import sublime, sublime_plugin, time, locale

locale.setlocale(locale.LC_TIME, 'es_ES')

class InsertDatetimeCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        sel = self.view.sel();
        for s in sel:
            self.view.replace(edit, s, time.strftime("%A %d-%m-%Y %H:%M:%S", time.gmtime()))
