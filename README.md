
==========================================
Balance Query Service via SIP Voice Call
==========================================

📌 Overview:
-------------
The Balance Query Service allows users to check their balance through a SIP voice call. 
Users can call a specific extension from their SIP client (mobile or PC) and interact 
via DTMF (keypad input) to retrieve their current balance.

✅ Key Features:
----------------
- Users hear a welcome message upon calling the SIP extension.
- Users input their phone number (MSISDN) via DTMF.
- The system fetches the balance using a RESTful Web Service.
- The balance is read back to the user via voice.
- The call ends with a thank-you message.
- Admins can manage user data (ID, MSISDN, Balance) via a web application (CRUD operations).

🛠 Technologies Used:
----------------------
- Java (Servlet, AGI Scripting)
- JDBC (Java Database Connectivity)
- RESTful Web Service (Jersey)
- Asterisk PBX with AGI for voice call handling
- PostgreSQL Database
- SIP Client (e.g., Zoiper, Linphone)
- HTML, CSS, JavaScript (for web interface)
- NetBeans IDE (Recommended for development)
- CentOS 9 (VMware) [for deployment]

🔧 Components:
--------------
1. **Asterisk AGI Java Script**:
   - Handles incoming SIP call.
   - Plays welcome and end voice prompts.
   - Accepts DTMF input (MSISDN).
   - Calls REST API to fetch balance.
   - Reads out balance to the user.

2. **REST Web Service**:
   - Endpoint to query balance by MSISDN.
   - Developed using Java (Jersey Framework).

3. **PostgreSQL Database**:
   - Stores user records: ID, MSISDN, Balance.

4. **Web Application**:
   - Developed using Java Servlets.
   - Provides a user-friendly interface for CRUD operations.
   - Allows admin to view, add, update, and delete user records.

📁 Project Structure:
---------------------
/BalanceQueryService
│
├── /agi-scripts             # Java AGI script for Asterisk
├── /rest-service            # RESTful web service
├── /web-app                 # Servlet-based CRUD application
├── /sql                     # SQL script for DB setup
├── /resources               # Audio prompts (welcome, balance, goodbye)
└── README.txt               # Project description (this file)

🚀 Deployment Tips:
--------------------
- Ensure Asterisk and PostgreSQL are properly installed and configured on CentOS.
- Register SIP clients and assign proper extensions in Asterisk dialplan.
- Deploy REST service on a local application server (e.g., Tomcat).
- Compile and link AGI Java script with Asterisk (use FastAGI or AGI-Java).
- Use pgAdmin or psql to manage PostgreSQL schema.
- Launch the web app in your browser to perform CRUD operations.

📞 Example User Flow:
----------------------
1. User calls extension (e.g., 1000) via SIP client.
2. System plays: “Welcome! Please enter your phone number.”
3. User inputs MSISDN via DTMF.
4. System calls REST API: `/balance?msisdn=xxxxxxxxxx`
5. Database returns balance.
6. System says: “Your current balance is 50 units. Thank you!”
7. Call ends.

📌 Notes:
----------
- Ensure ports for SIP, HTTP, and PostgreSQL are open and accessible.
- Customize audio prompts for better UX.
- Validate user inputs in both AGI script and web app.



