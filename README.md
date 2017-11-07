# Secure SSH Agent 

These two scripts allow one to keep ssh private keys separate when using an agent. Each connection creates a new SSH Agent, which only holds a single key as chosen by the user. I wrote a [blog post](https://noconroy.net/a-more-secure-ssh-agent.html) on the design of this.

This has been something I've wanted for quite a while, but haven't been able to figure out until I was inspired by the Qubes [Split GPG](https://www.qubes-os.org/doc/split-gpg/) and [sshecret](https://github.com/thcipriani/sshecret).

It is designed as a drop in replacement for ssh-agent, and as such is restricted by the ssh-agent [protocol](http://api.libssh.org/rfc/PROTOCOL.agent). The biggest effect of this is that you won't be able to read what you're signing/who you're connecting to.

Other details:
- This was developed on Qubes, and then ported to general OSes
- You will be prompted to confirm each request, though  you won't see what was requested
- This is really only useful if you want separate keys for each service you connect to. Say you don't want people to be able to tie your public key to your github account (Try: `curl https://github.com/<username>.keys`).

# Installation

## Make

You can install with either `make install`

## Manual

- Copy both scripts to /usr/bin/
- To run it automatically, add `. secure-ssh-agent` to your .profile or .bashrc

# Key generation

- By default the agent looks for keys in ~/.ssa/
- Generate a key like: `ssh-keygen -t ed25519 -N "" -f ~/.ssa/user3@host4.com`

# Todo

- (possibly distant future) Figure out a way to display info on what is being signed
- Run secure-ssh-agent.agent as another user, to stop a regular user being able to access private keys (in case of compromise)
