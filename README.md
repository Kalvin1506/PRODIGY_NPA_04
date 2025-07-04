# PRODIGY_NPA_04

# PRODIGY_NPA_04
# 🛡️ Bash Network Packet Sniffer

A lightweight command-line packet sniffer written in **Bash**, using `tcpdump` to capture and log live network traffic. Built as part of **Task 4** of the **Prodigy Infotech Internship**, this tool demonstrates basic packet monitoring and filtering through scripting.

---

## 📌 Features

- ✅ Real-time packet capture using `tcpdump`
- ✅ Source and destination IP extraction
- ✅ Protocol and payload summary display
- ✅ Filter by IP address and/or port
- ✅ Save output to a readable log file
- ✅ Root-access and permission checks

---

## 📷 Screenshot

[12:45:10.234567] 192.168.1.2 -> 8.8.8.8
Flags [S], seq 123456789, win 29200, length 0
yaml
Copy
Edit

---

## 🛠️ Requirements

- Linux-based system
- `tcpdump` installed  
  Install it via:
  ```bash
  sudo apt install tcpdump
  🚀 How to Use
Clone this repository:

bash
Copy
Edit
git clone https://github.com/your-username/network-packet-sniffer.git
cd network-packet-sniffer
Make the script executable:

bash
Copy
Edit
chmod +x filtered_sniffer.sh
Run the script:

bash
Copy
Edit
sudo ./filtered_sniffer.sh
Enter an IP or port when prompted, or leave blank to capture all traffic.

⚙️ Script Options
INTERFACE: Network interface to listen on (default is eth0, change as needed)

DURATION: Duration in seconds to capture packets (default is 30)

FILTER_IP: IP address to filter traffic (optional)

FILTER_PORT: Port number to filter traffic (optional)

📁 Output
The captured and processed traffic is saved in filtered_packets.txt, with a readable summary for each packet captured during the session.

✅ Example
bash
Copy
Edit
Enter IP to filter (press Enter to skip): 8.8.8.8
Enter port to filter (press Enter to skip): 53
This will only capture packets to/from 8.8.8.8 on port 53 (DNS).

Clone this repository:

bash
Copy
Edit
git clone https://github.com/your-username/network-packet-sniffer.git
cd network-packet-sniffer
Make the script executable:

bash
Copy
Edit
chmod +x filtered_sniffer.sh
Run the script:

bash
Copy
Edit
sudo ./filtered_sniffer.sh
Enter an IP or port when prompted, or leave blank to capture all traffic.

⚙️ Script Options
INTERFACE: Network interface to listen on (default is eth0, change as needed)

DURATION: Duration in seconds to capture packets (default is 30)

FILTER_IP: IP address to filter traffic (optional)

FILTER_PORT: Port number to filter traffic (optional)

📁 Output
The captured and processed traffic is saved in filtered_packets.txt, with a readable summary for each packet captured during the session.
✅ Example
bash
Copy
Edit
Enter IP to filter (press Enter to skip): 8.8.8.8
Enter port to filter (press Enter to skip): 53
This will only capture packets to/from 8.8.8.8 on port 53 (DNS).





⚠️ Disclaimer
This tool is intended for educational and authorized use only. Capturing network traffic without permission may violate privacy laws or organizational policies. Use responsibly.

📚 Internship Context
This project was completed as Task 4 of the Cybersecurity Internship under Prodigy Infotech. It showcases the application of core Linux tools and scripting to network analysis tasks.

📌 License
This project is open-source and free to use under the MIT License.

🙌 Acknowledgements
Thanks to Prodigy Infotech for the guidance and opportunity.
