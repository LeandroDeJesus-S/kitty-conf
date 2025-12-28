# type: ignore
from kitty.boss import Boss  # noqa: I001
from kittens.tui.handler import result_handler
from kittens.tui.loop import debug


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss) -> None:
    """Toggle tab bar visibility. It accepts two arguments that is the tab bar
    style to use when visible and if using powerline, the tab_powerline_style. Defaults to
    powerline and angled.
    """
    tab = getattr(boss, "active_tab", None)
    tm = getattr(boss, "active_tab_manager", None)
    win = boss.window_id_map.get(target_window_id)

    if tm is None or tab is None:
        debug("No active tab or tab manager found")
        return

    is_hidden = tm.tab_bar_hidden
    bar_style = args[1] if len(args) >= 2 else "powerline"  # noqa: PLR2004

    tab_bar_style = bar_style if is_hidden else "hidden"
    powerline_style = args[2] if len(args) >= 3 else "angled"  # noqa: PLR2004

    cmd = ["load-config"]
    cmd += ["-o", f"tab_bar_style={tab_bar_style}"]
    bar_style == "powerline" and cmd.extend(["-o", f"tab_powerline_style={powerline_style}"])
    boss.call_remote_control(win, cmd)
