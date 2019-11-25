# Dotfiles

### Before

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
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
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install.sh` to start the installation
8. Restore preferences by running `mackup restore`
9. Restart your computer to finalize the process

### After (Needs Automation)

There are some thing we have to set manually:

**CLI:**
- [ ] Mackup (restore/backup)

**Desktop:**
- [ ] Wallpaper

**Menubar:**
- [ ] Hide Language
- [ ] Hide User
- [ ] Show Icons (Bluetooth, Time Machine, ...)

**Finder:**
- [ ] Toolbar
- [ ] Sidebar

**System:**
- [ ] Trackpad Gestures
- [ ] Display Resolution
- [ ] Disable Apps On Startup
- [ ] Enable Night Shift
- [ ] Install aptX

**FaceTime:**
- [ ] Disable Calling

**Spotlight:**
- [ ] Hide Suggestions

**Calendar:**
- [ ] Default Calendar
- [ ] Show Week Numbers
- [ ] Show Birthdays

**Contacts**
- [ ] Disable Siri Suggestions

**Notifications:**
- [ ] Preferences
- [ ] Widgets (Notifications Center)

**Time Machine:**
- [ ] Setup
- [ ] Exceptions
