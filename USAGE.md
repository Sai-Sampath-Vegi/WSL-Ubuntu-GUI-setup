# 🚀 Quick Start & Usage Guide

Now that you have completed the installation, use this guide as a quick reference for managing your Ubuntu GUI.

---

### 🟢 How to Start the GUI

You no longer need to run long commands. Simply open your Ubuntu terminal and type the alias we created:

```bash
StartUbuntuGUI
```

**What happens:** 1. The script clears any old "zombie" sessions to prevent the blank screen bug.
2. The XRDP service starts automatically.
3. The Windows Remote Desktop (RDP) window will pop up on your screen.

---

### 🔴 How to Stop the GUI

When you are finished working, it is important to shut down the session to free up your computer's RAM.

```bash
StopUbuntuGUI
```

**What happens:** 1. All GUI-related processes are safely terminated.
2. The XRDP service is stopped to save system resources.

---

### Once the Remote Desktop window opens.

1. **Session:** Ensure the dropdown menu is set to **Xorg** (this should be the top/default option).
2. **Credentials:** Enter the **Ubuntu Username** and **Password** you created during the installation.
3. **Click OK:** The Ubuntu Desktop will now initialize.

> [!TIP]
> If you see a second password prompt inside the desktop asking to "Create a color profile," you can usually just click **Cancel** or **Enter**—this is a standard Linux security check that doesn't affect your work.

---

### 🛠️ Troubleshooting the "Blank Screen"

If you open the GUI and see only a **black or blue screen** with no desktop icons, don't worry—this is a common WSL sync issue that I also encountered frequently during the development of this setup.

**Try these steps in order:**

1. **The Quick Reset:** Close the Remote Desktop window, go back to your terminal, and run:

```bash
StopUbuntuGUI && StartUbuntuGUI
```

*This kills any "zombie" processes and starts a fresh session.*

2. **The "Kill All" Method:** If the script doesn't fix it, manually clear the XRDP cache by running:

```bash
sudo pkill -u $USER xrdp
sudo pkill -u $USER Xvnc
```

Then run `StartUbuntuGUI` again.

3. **The Ultimate Fix:**
> [!IMPORTANT]
> **Note from the Creator:** I personally faced this issue many times. If the steps above don't work, simply **restart your Windows machine**. This clears the Virtual Machine Platform's memory and fixes the blank screen 100% of the time.

---

### 🛠️ GUI Troubleshooting & Fixes

If your Ubuntu Desktop fails to launch correctly, use the following solutions:

1. **Instant Remote Desktop Crash**
 * **Symptom:** The Remote Desktop window opens, you enter your credentials, click "OK," and the app immediately closes.
 * **Cause:** This is usually due to a missing System Machine ID or a D-Bus communication failure.
 * **The Fix:** Run these commands in your Ubuntu terminal:

```bash
sudo systemd-machine-id-setup
sudo dbus-uuidgen --ensure
```

2. **White Screen / "Something has gone wrong"**
 * **Symptom:** You log in successfully, but instead of the desktop, you see a white screen with a "sad computer" icon.
 * **Cause:** The GNOME session is failing to initialize or is trying to launch an incompatible session type.
 * **The Fix:** Force the session to use GNOME by running:

```bash
echo "gnome-session" > ~/.xsession
sudo service xrdp restart
```
