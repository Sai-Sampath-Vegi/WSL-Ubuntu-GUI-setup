# Step 2: Ubuntu & GUI Installation

Now that Windows is prepared, we will install Ubuntu and set up the Graphical Interface.

> [!NOTE]
> **Storage Requirement:** Ensure you have at least **20GB - 50GB** of free space on your C: drive before proceeding.

---

### 1. Install Ubuntu

Run this command in your open PowerShell window to download the latest Ubuntu distribution:

```powershell

wsl --install -d Ubuntu

```

### 2. Launch Ubuntu (Inside this Terminal)

Run this command to enter the Ubuntu environment.

```powershell

ubuntu

```

### 3. Setup User Credentials

Once Ubuntu starts, it will ask you to create a **Username** and **Password**.

> [!WARNING]
> When typing your password, **no characters will appear on the screen**. This is a standard Linux security feature. Just type it and press Enter.

---

### 4. Optimize for GUI (Prioritize Apt over Snap)

**Snap** packages often have permission issues in WSL. This will configure your system to prioritize **apt**, ensuring your GUI apps work perfectly.

Run this first to block Snap and prioritize Apt.

```bash

# Create a policy file to prioritize apt
sudo tee /etc/apt/preferences.d/nosnap.pref << 'EOF'
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

```

---

### 5. Install the Ubuntu Desktop Environment

Now that the system is optimized, we will install the actual Graphical User Interface (GUI). This process may take **5-10 minutes** depending on your internet speed.

```bash

# Update the system
sudo apt update && sudo apt upgrade -y

```

```bash

# Install the Native Ubuntu Desktop Environment
sudo apt install ubuntu-desktop-minimal xrdp -y

```

```bash

# Configure the GUI to use GNOME
echo "gnome-session" > ~/.xsession

```

---

### 6. Install Automation Scripts

We will now download the scripts that handle the "One-Click" startup and cleanup.

```bash

# Download the Start and Stop scripts
curl -L https://raw.githubusercontent.com/Sai-Sampath-Vegi/WSL-Ubuntu-GUI-setup/main/StartUbuntuGUI.sh > ~/StartUbuntuGUI.sh
curl -L https://raw.githubusercontent.com/Sai-Sampath-Vegi/WSL-Ubuntu-GUI-setup/main/StopUbuntuGUI.sh > ~/StopUbuntuGUI.sh

# Grant execution permissions
chmod +x ~/StartUbuntuGUI.sh ~/StopUbuntuGUI.sh

```

---

### 7. Create Permanent Shortcuts (Aliases)

To make launching the GUI easy, we will create shortcuts that match the filenames.

```bash

echo "alias StartUbuntuGUI='source ~/StartUbuntuGUI.sh'" >> ~/.bashrc
echo "alias StopUbuntuGUI='source ~/StopUbuntuGUI.sh'" >> ~/.bashrc
source ~/.bashrc

```

---

### 8. Launch & Test your GUI

You are all set! Here is how to manage your new Ubuntu Desktop:

* **To Start the GUI:** Type `StartUbuntuGUI` and press Enter. Windows Remote Desktop will open automatically.
* **To Stop the GUI:** Type `StopUbuntuGUI` to safely close the session and free up RAM.

**Congratulations! You now have a fully functional WSL2 Ubuntu GUI.**

---

### 9. Launching Ubuntu Like a Pro

Now that everything is set up, you don't need to look for a specific app. You can open your Ubuntu terminal from anywhere in Windows.

* **From the Start Menu:** Just press the `Windows Key`, type `Ubuntu`, and hit Enter.
* **From any Terminal:** If you already have a PowerShell or Command Prompt open, simply type `ubuntu` and press Enter to instantly switch into Linux.
* **Set as Default:** If you use the **Windows Terminal** app, you can click the dropdown arrow `v` at the top and go to **Settings** to set Ubuntu as your default profile.

---

### Final Check of the "Success" Flow

Your user's daily routine will now look like this:

1. Open **Windows Terminal**.
2. Type `StartUbuntuGUI` (The alias you created!).
3. Work in the GUI.
4. Type `StopUbuntuGUI` when finished to save RAM.
