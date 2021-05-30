# Startwith

A helper utility for bash scripting.

# Examples

```bash
$ startswith araba a
raba

$ startswith market mark
et

$ startswith araba rb
startswith: rb: not found in 'araba'
```


# Build

Run cargo install, this will compile the code and create a new **executable** 'startswith'.

```
cargo install --path .  
```
