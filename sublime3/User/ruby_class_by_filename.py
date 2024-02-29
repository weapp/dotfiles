import sublime
import sublime_plugin
from re import sub

class RubyClassByFilename(sublime_plugin.EventListener):

    def camel_case(self, s):
      s = sub(r"(_|-)+", " ", s).title().replace(" ", "")
      return ''.join([s[0].lower(), s[1:]])

    def pascal_case(self, s):
      s = sub(r"(_|-)+", " ", s).title().replace(" ", "")
      return ''.join([s[0].upper(), s[1:]])

    def on_query_completions(self, view, prefix, locations):
        file_name = view.window().active_view().file_name()

        if not file_name:
            return []

        name = self.pascal_case(file_name.split("/")[-1].split(".")[0])
        mod1 = self.pascal_case(file_name.split("/")[-2])
        mod2 = self.pascal_case(file_name.split("/")[-3])

        if not view.match_selector(locations[0], "source.ruby"):
            return []

        available_completions = [
            "class %s\nend" % name,
            "module %s\n  class %s\n  end\nend" % (mod1, name),
            "module  %s\n  module %s\n    class %s\n    end\n  end\nend" % (mod2, mod1, name),
        ]

        prefix = prefix.lower()

        out = []
        for comp in available_completions:
            if comp.lower().startswith(prefix):
                out.append(comp)

        return out

# https://www.sublimetext.com/docs/completions.html
# https://www.sublimetext.com/docs/api_reference.html

# [
#     sublime.CompletionItem(
#         "fn",
#         annotation="def",
#         completion="def ${1:name}($2) { $0 }",
#         completion_format=sublime.COMPLETION_FORMAT_SNIPPET,
#         kind=sublime.KIND_SNIPPET
#     ),
#     sublime.CompletionItem(
#         "for",
#         completion="for ($1; $2; $3) { $0 }",
#         completion_format=sublime.COMPLETION_FORMAT_SNIPPET,
#         kind=sublime.KIND_SNIPPET
#     ),
# ]
