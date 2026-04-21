tee logging-and-output.md << 'EOF'
# Logging and Output Control Commands

This document covers essential Linux commands for handling output, logging, and stream redirection.

---

## 1. tee command

### Overview
`tee` reads from standard input and writes to both standard output and one or more files.

It is commonly used to save output while still displaying it on the terminal.

### Syntax
tee [OPTION]... [FILE]...

---

### Examples

#### Save output to a file
$ ls | tee output.txt

#### Append output to a file
$ ls | tee -a output.txt

#### Save and display command output
$ echo "Hello World" | tee hello.txt

#### Use with sudo (important in real environments)
$ echo "config" | sudo tee /etc/sample.conf

---

### Options
| Option | Description |
|--------|------------|
| -a | Append to file instead of overwrite |
| -i | Ignore interrupt signals |

---

### Use Cases

- Save command output while viewing it
- Create logs during execution
- Write to protected files using sudo
- Debug pipelines

---

### Practical Insight

`tee` is frequently used in real-world environments for logging and configuration.

Example:

$ some_command | tee log.txt

This allows engineers to:
- Monitor output in real time
- Save logs for later analysis

Important scenario:

$ echo "data" > /root/file   ❌ permission denied

Solution:

$ echo "data" | sudo tee /root/file   ✅ works

---

## 2. Output Redirection

### Overview
Linux provides powerful redirection features to control input and output streams.

---

### Standard Streams

| Stream | Description |
|--------|------------|
| stdin (0) | Standard input |
| stdout (1) | Standard output |
| stderr (2) | Error output |

---

### Examples

#### Redirect output to a file (overwrite)
$ ls > output.txt

#### Append output
$ ls >> output.txt

#### Redirect errors
$ ls invalid_file 2> error.txt

#### Redirect both stdout and stderr
$ ls invalid_file > all.txt 2>&1

---

### Use Cases

- Save command results
- Separate logs and errors
- Automate scripts
- Debug issues

---

## 3. /dev/null

### Overview
`/dev/null` is a special file that discards all data written to it.

---

### Examples

#### Discard output
$ ls > /dev/null

#### Discard errors
$ ls invalid_file 2> /dev/null

#### Discard everything
$ ls invalid_file > /dev/null 2>&1

---

### Use Cases

- Suppress unnecessary output
- Clean script execution
- Ignore expected errors

---

## 4. Workflow (Real-world Logging)

### Typical workflow

1. Run command with logging  
   → `command | tee output.log`

2. Append logs over time  
   → `command | tee -a output.log`

3. Suppress unnecessary output  
   → `command > /dev/null`

4. Capture errors  
   → `command 2> error.log`

---

## Comparison

| Feature | Command |
|--------|--------|
| Save & display output | tee |
| Overwrite output | > |
| Append output | >> |
| Redirect errors | 2> |
| Discard output | /dev/null |

---

## Summary

`tee` and redirection commands are essential for handling output and logs in Linux systems.

They are heavily used in:

- System administration
- Cloud engineering
- DevOps pipelines
- Debugging and monitoring

Mastering these commands significantly improves your ability to operate in real-world environments.

EOF
