```bash
#!/bin/bash

# =========================
# alias
# =========================
alias ll='ls -l'

# =========================
# function
# =========================

log() {
  echo "[LOG] $1"
}

check_disk() {
  usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

  if [ "$usage" -ge 80 ]; then
    log "Disk usage HIGH: ${usage}%"
  else
    log "Disk usage OK: ${usage}%"
  fi
}

check_file() {
  if [ -f /etc/passwd ]; then
    log "passwd file exists"
  fi
}

check_time() {
  if [ /etc/passwd -nt /tmp ]; then
    log "passwd is newer"
  fi
}

# =========================
# main
# =========================

log "Start"

check_disk
check_file
check_time

log "Done"
