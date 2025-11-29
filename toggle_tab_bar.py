from kitty.boss import Boss
from kittens.tui.handler import result_handler
from kittens.tui.loop import debug
from kitty.fast_data_types import get_options, set_options


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(args: list[str], answer: str, target_window_id: int, boss: Boss) -> None:
    """Toggle tab bar visibility. It accepts a single argument that is the name of the tab bar
    style to use when visible. Defaults to "powerline"."""
    tab = getattr(boss, "active_tab", None)
    tm = getattr(boss, "active_tab_manager", None)

    if tm is None or tab is None:
        debug("No active tab or tab manager found")
        return

    debug(f"Active tab manager: {tm}")
    is_hidden = tm.tab_bar_hidden

    bar_style = args[0] if args else "powerline"
    opts = get_options()
    opts.tab_bar_style = bar_style if is_hidden else "hidden"
    set_options(opts)

    debug(f"Setting tab bar style to {opts.tab_bar_style}")
    debug(f"Toggled tab bar visibility for tab {tm.tab_bar_hidden}")

    boss.apply_new_options(opts)
    tab.apply_options(True)
    tab.mark_tab_bar_dirty()
    tm.tab_bar.apply_options()
