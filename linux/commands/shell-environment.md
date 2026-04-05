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
## 7. Quoting (Shell Quotes)

### Overview
Quoting in the shell controls how special characters and variables are interpreted.

It is essential for handling strings, variables, and command execution correctly.

---

### Types of Quotes

#### 1. Single Quotes (' ')

### Description
Single quotes preserve the literal value of all characters inside them.  
Variables and commands are not expanded.

### Example

$ echo '$HOME'  
→ $HOME

---

### Use Cases

- Prevent variable expansion
- Handle strings with special characters

---

### Practical Insight

Used when you want exact text output:

$ echo 'Path is $PATH'  
→ Path is $PATH

---

#### 2. Double Quotes (" ")

### Description
Double quotes allow variable and command expansion,  
but preserve spaces and most special characters.

### Example

$ echo "$HOME"  
→ /home/user

---

### Use Cases

- Use variables safely
- Handle strings with spaces

---

### Practical Insight

Without quotes:

$ echo $VAR  
→ may break if spaces exist

With quotes:

$ echo "$VAR"  
→ safe output

---

#### 3. Backticks (` `) and Command Substitution

### Description
Backticks or `$()` execute a command and return its output.

### Examples

$ echo `date`  
$ echo $(date)

---

### Use Cases

- Capture command output
- Use command results in scripts

---

### Practical Insight

`$()` is preferred over backticks because it is more readable and nestable:

$ echo $(echo $(date))

---

#### 4. Escape Character (\)

### Description
The backslash `\` escapes special characters.

### Example

$ echo \$HOME  
→ $HOME

---

### Use Cases

- Prevent interpretation of special characters
- Handle symbols like `$`, `"`, `'`

---

### Practical Insight

Useful when mixing quotes:

$ echo "This is a \"quoted\" word"

---

## Workflow (Real-world Usage)

### Common scenarios

1. Output literal text  
   → `' '`  

2. Use variables safely  
   → `" "`  

3. Execute command inside string  
   → `$()`  

4. Escape special characters  
   → `\`  

---

## Common Pitfalls

### 1. Unquoted variables

$ FILE="my file.txt"  
$ cat $FILE   → error  

Fix:

$ cat "$FILE"

---

### 2. Unexpected expansion

$ echo *  
→ expands to all files  

Fix:

$ echo "*"

---

### 3. Mixing quotes incorrectly

$ echo "It's broken"   ← OK  
$ echo 'It's broken'   ← error  

Fix:

$ echo "It's broken"

---

## Summary

Quoting is fundamental to shell usage.

Understanding how single quotes, double quotes, command substitution,  
and escape characters work is essential for writing reliable scripts  
and avoiding unexpected behavior in real-world environments.
Note: Improper quoting is one of the most common causes of bugs in shell scripts.
