# Dotfiles

### Before

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-cloud directories?
- Did you save all of your work from apps which aren't synced?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up macOS

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
5. Copy your public and private SSH keys to `~/.ssh`
6. Clone this repo to `~/.dotfiles`
7. Run `install.sh` to start the installation
8. Start `Herd.app` and run its install process
9. Restore preferences by running `mackup restore`
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
            - Trackpad: Gestures<br>
            - Keyboard<br>
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
            - Sort By Title
        </td>
    </tr>
</table>
