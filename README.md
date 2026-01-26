# Dotfiles

### Installing macOS

Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up macOS

1. Update macOS to the latest version
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
5. Copy your public and private SSH keys to `~/.ssh`
6. Clone this repo to `~/.dotfiles`
7. Run `bin/install.sh` to start the installation
8. Start `Herd.app` and run its install process
10. Restart your computer to finalize the process

### After (not automated; opinionated)

Unfortunately, there are still some things we have to set manually:

<table>
    <tr>
        <td valign="top"><strong>System Preferences</strong></td>
        <td>
            - Background: Wallpaper<br>
            - Control Panel<br>
            - Display: Night Shift (22:00 - 08:00)<br>
            - Lock Screen: Battery (5m), Power (5m)<br>
            - Notifications<br>
            - Trackpad: Gestures
        </td>
    </tr>
    <tr>
        <td valign="top"><strong>Keyboard</strong></td>
        <td>
            - Correct spelling automatically<br>
            - Capitalize words automatically<br>
            - Add period with double-space<br>
            - Smart quotes
        </td>
    </tr>
    <tr>
        <td valign="top"><strong>Widgets</strong></td>
        <td>
            - Calendar<br>
            - Reminders<br>
            - Weather
        </td>
    </tr>
    <tr>
        <td valign="top"><strong>Finder</strong></td>
        <td>
            - Toolbar<br>
            - Sidebar
        </td>
    </tr>
    <tr>
        <td valign="top"><strong>Calendar</strong></td>
        <td>
            - Default Calendar
        </td>
    </tr>
    <tr>
        <td valign="top"><strong>Notes</strong></td>
        <td>
            - Sort by Title
        </td>
    </tr>
</table>
