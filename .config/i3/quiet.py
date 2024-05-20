#!/home/sean/.local/bin/uv run
# /// script
# dependencies = [
#   "i3ipc",
# ]
# ///

import logging
import json
from subprocess import run
from typing import Any

log = logging.getLogger()
logging.basicConfig(level=logging.INFO)

DEFAULT_SIZE = "medium"
DEFAULT_BORDER = "normal"


def enable_zen_mode(workspace: dict[str, Any]):
    wp, hp, wm, hm = [100, 100, 1600, 1600]
    width = round(min(workspace["rect"]["width"] * wp / 100, wm))
    height = round(min(workspace["rect"]["height"] * hp / 100, hm))
    msg = ";".join(
        [
            "mark zen",
            "floating enable",
            "resize set width {}".format(width),
            "resize set height {}".format(height),
            "move position center",
        ]
    )
    run(["i3-msg", msg])


def disable_zen_mode():
    msg = ";".join(["floating disable", "unmark"])
    run(["i3-msg", msg])


def toggle():
    out = run(["i3-msg", "-t", "get_marks"], capture_output=True)
    marks = json.loads(out.stdout)
    is_zen = "zen" in marks
    focused_ws = get_active_ws()
    log.info("Is Zen %s", is_zen)
    if is_zen:
        disable_zen_mode()
    else:
        enable_zen_mode(focused_ws)


def get_active_ws():
    out = run(["i3-msg", "-t", "get_workspaces"], capture_output=True)
    workspaces = json.loads(out.stdout)
    workspace_current = list(filter(lambda w: w["focused"], workspaces))[0]
    return workspace_current


if __name__ == "__main__":
    toggle()
