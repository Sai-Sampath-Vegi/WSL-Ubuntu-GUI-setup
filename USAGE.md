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
