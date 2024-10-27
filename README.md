<h2 align="center">Bookmarks Manager</h2>

<p align="center">
  <img src="Mockup.jpg" alt="Responsive Mockup">
</p>

### 🎯 Goal

Bookmarks Manager centralizes all bookmarks, providing a single place for users to store and retrieve links. The project emphasizes organized, easy access to online resources.

---

### 💻 Stack

- HTML
- CSS
- Bootstrap
- jQuery
- jQuery UI
- AJAX
- PHP
- MySQL

> The project is fully responsive, ensuring it works across all devices.

---

### 🏗️ Installation

Follow these steps to set up and run the project using XAMPP.

#### Step 1: Install XAMPP

- Download XAMPP: Go to the [XAMPP download page](https://www.apachefriends.org/download.html) and download the installer for your operating system.
- Run the Installer: Open the downloaded installer and follow the prompts to install XAMPP. Choose the default options for a smooth setup.
- Verify Installation: After installation, open the XAMPP control panel to ensure XAMPP is installed correctly.

#### Step 2: Prepare the Project Files

- Fork the repository by clicking the `Fork` button at the top-right of the repository page.
- Clone your forked repository locally
```bash
git clone https://github.com/your-username/repo-name.git
```
- Navigate to the project directory
```bash
cd repo-name
```
- Move Project to XAMPP: Copy the `repo-name` directory to the `htdocs` directory, typically found at `C:\xampp\htdocs` on Windows or `/opt/lampp/htdocs` on Linux.

#### Step 3: Start the XAMPP Apache Server

- Open XAMPP Control Panel: Start the XAMPP control panel application.
- Start Apache: In the control panel, locate the Apache service and click "Start" to start the web server. Ensure that Apache is running (its status should be "Running" in green).

#### Step 4: Set Up a Virtual Host (Optional but Recommended)

- Edit the vhosts file `C:\xampp\apache\conf\extra\httpd-vhosts.conf` (Windows) or `/opt/lampp/etc/extra/httpd-vhosts.conf` (Linux).
- Add the following lines at the bottom of the file:

```apache
<VirtualHost *:80>
    DocumentRoot "C:/xampp/htdocs/repo-name"
    ServerName repo-name.local
    DirectoryIndex index.html index.php

    <Directory "C:/xampp/htdocs/repo-name">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

> Adjust the file paths if your XAMPP is installed in a different directory.

- Add an entry for `repo-name.local` in your system’s `hosts` file:
  - On Windows, open `C:\Windows\System32\drivers\etc\hosts` in a text editor with administrator privileges.
  - On Linux, edit `/etc/hosts` with root privileges.
- Add the following line, `127.0.0.1 repo-name.local`
- Restart Apache: After saving these changes, go back to the XAMPP control panel and restart Apache to apply the new virtual host configuration.

#### Step 5: Import Database Using phpMyAdmin

- Start MySQL Server: In the XAMPP control panel, click "Start" next to MySQL to start the MySQL database server.
- Open phpMyAdmin: In your browser, go to [http://localhost/phpmyadmin](http://localhost/phpmyadmin).
- Click on the Databases tab at the top.
- Enter a name for the database (e.g., `repo-name`) and select `utf8_general_ci` as the collation. Click Create.
- Select the newly created database from the left sidebar.
- Click on the Import tab at the top.
- Under File to Import, click Choose File and select the SQL file provided with the project.
- Ensure the format is set to SQL, then click Go to start the import.
- Once the import completes, you should see a success message. Verify that the tables have been created by browsing the database.

> You can find the SQL file in the `sql` directory of the project.

> Change the DB name and credentials in the `include/database.php` file.

#### Step 6: Access the Application

- Open a Web Browser: Launch your preferred web browser.
- Visit the Application: Go to `http://repo-name.local` (or `http://localhost/repo-name` if you didn’t set up a virtual host).
- Verify the Setup: The homepage of the application should now load, indicating the application is ready to use.

---

### ⚓ Contributing

Contributions are welcome and greatly appreciated! If you'd like to contribute to this project, please follow these steps:

- Fork the repository by clicking the `Fork` button at the top-right of the repository page.
- Clone your forked repository locally
```bash
git clone https://github.com/your-username/repo-name.git
```
- Create a new branch for your contribution
```bash
git checkout -b feature/your-feature-name
```
- Make your changes and ensure your code is clean and properly formatted.
- Commit your changes
```bash
git commit -m "feat: your feature description"
```
- Push your branch to your forked repository
```bash
git push origin feature/your-feature-name
```
- Submit a Pull Request (PR) by going to the original repository and clicking the "New Pull Request" button.

---

### 📋 Contribution Guidelines

- Ensure your changes are well-tested and documented.
- Adhere to the existing code style and project structure.
- Provide clear descriptions in your PR regarding the changes and enhancements.
- Be open to feedback and discussion in the PR review process.

---

### ✉️ Contact

[![LinkTree](https://img.shields.io/badge/-Checkout%20My%20LinkTree-404040?style=flat&logo=linktree&logoColor=ffffff)](https://linktree.salahineo.com)

---

### 🔓 License

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

---

**If you find my work good, consider giving it a ⭐ or fork-ing to show some ❤️. It helps me stay on track and be motivated.**
