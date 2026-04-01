# Shell Environment Commands

This document covers commands used for managing environment variables  
and shell behavior in Linux systems.

---

## 1. export command

### Overview
`export` is used to set environment variables and make them available  
to child processes.

### Syntax
export VARIABLE=value

---

### Examples

#### Set environment variable
$ export APP_ENV=production

#### Verify variable
$ echo $APP_ENV

---

### Use Cases

- Define environment variables for applications
- Pass variables to scripts and subprocesses

---

### Practical Insight

Variables set with `export` are inherited by child processes.

Example:

$ export MY_VAR=test  
$ bash  
$ echo $MY_VAR   → available  

Without `export`, variables are not passed to subshells.

---

## 2. echo command

### Overview
`echo` prints text or variable values to standard output.

### Syntax
echo [STRING]

---

### Examples

#### Print text
$ echo Hello

#### Print variable
$ echo $HOME

---

### Use Cases

- Debug scripts
- Display variable values
- Output messages

---

### Practical Insight

`echo` is frequently used to confirm environment variables:

$ echo $PATH

This helps verify whether variables are set correctly.

---

## 3. unset command

### Overview
`unset` removes variables or functions from the shell.

### Syntax
unset VARIABLE

---

### Examples

#### Remove variable
$ unset APP_ENV

#### Verify removal
$ echo $APP_ENV   → empty

---

### Use Cases

- Clean environment variables
- Avoid conflicts in scripts

---

### Practical Insight

Used when a variable causes unexpected behavior.

Example:

$ export PATH=/custom/path  
→ command not found issues  

$ unset PATH  
→ restore normal behavior (after re-login or reset)

---

## 4. set command

### Overview
`set` displays or configures shell variables and options.

### Syntax
set [OPTION]

---

### Examples

#### Show all variables
$ set

#### Enable debug mode
$ set -x

#### Disable debug mode
$ set +x

---

### Use Cases

- Debug shell scripts
- View all shell variables
- Configure shell behavior

---

### Practical Insight

`set -x` is often used in troubleshooting scripts:

$ set -x  
$ ./script.sh  

This prints each command before execution, making debugging easier.

---

## 5. env command

### Overview
`env` runs a command in a modified environment or displays environment variables.

### Syntax
env [VARIABLE=value] command

---

### Examples

#### Show environment variables
$ env

#### Run command with temporary variable
$ env APP_ENV=dev ./app

---

### Use Cases

- Run programs with temporary environment variables
- Inspect environment settings

---

### Practical Insight

`env` is useful when testing without permanently changing variables.

Example:

$ env PATH=/tmp ./script  

This overrides PATH only for that execution.

---

## 6. printenv command

### Overview
`printenv` displays environment variables.

### Syntax
printenv [VARIABLE]

---

### Examples

#### Show all variables
$ printenv

#### Show specific variable
$ printenv HOME

---

### Use Cases

- Check environment variables
- Script debugging

---

### Practical Insight

`printenv` is safer than `set` when you only need environment variables,  
as `set` also includes shell functions and local variables.

---

## Workflow (Environment Variable Management)

### Real-world usage flow

1. Set variable  
   → `export VAR=value`

2. Verify  
   → `echo $VAR` or `printenv VAR`

3. Test temporarily  
   → `env VAR=value command`

4. Debug issues  
   → `set -x`

5. Remove variable  
   → `unset VAR`

---

## Comparison

| Command | Purpose |
|--------|--------|
| export | Set environment variable |
| echo | Display variable value |
| unset | Remove variable |
| set | Show/configure shell variables |
| env | Run command with env or display |
| printenv | Display environment variables |

---

## Summary

These commands are essential for managing environment variables  
and debugging shell behavior.

Understanding how variables are set, inherited, and modified  
is critical for scripting and system administration in real-world environments.
