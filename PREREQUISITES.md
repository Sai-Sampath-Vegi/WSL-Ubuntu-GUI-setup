# Step 1: Windows Prerequisites

Before installing Ubuntu, we must enable the Windows features that allow Linux to run.

### 1. Open PowerShell as Administrator

Right-click your **Start Menu**, select **Terminal (Admin)** or **PowerShell (Admin)**.

### 2. Enable Windows Subsystem for Linux

Copy and paste this command to enable the core WSL feature:

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

```

### 3. Enable Virtual Machine Platform

This feature is required for WSL 2 to support a Graphical Desktop environment and hardware virtualization.

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

```

---

### 4. Install the WSL Software

This command ensures the latest WSL kernel and management tools are installed on your system.

```powershell
wsl --install

```

---

### 5. Restart Your PC

> [!IMPORTANT]
> **You must restart your computer now.** The features enabled in the steps above will not be active until the system reboots.

---

**Next Step:** Once your PC has restarted, proceed to [INSTALLATION.md](https://www.google.com/search?q=INSTALLATION.md).
