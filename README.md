
Sage Studio
===========
A complete development environment inside of a Docker image!

Base Edition
------------
The base edition focuses on Go, C++, C, and Python development and DevOps. This studio container is tested in Terminal.app with the [Solarized color scheme](https://github.com/tomislav/osx-terminal.app-colors-solarized).

- Based on [Fedora 26](https://hub.docker.com/_/fedora/)
- Vim with plenty of [plugins](https://github.com/ericsage/os/blob/master/configfiles/.vimrc#L29-L76)
- Fuzzy finding in Vim and Bash with fzf, searching with ag
- [These packages](https://github.com/ericsage/os/blob/master/configfiles/.packages#L1-L59) with documentation
- Golang 1.8.3
- Python2 & Python3 with setuptools, virtualenv, and wheel
- AWS && Google Cloud SDK
- Docker, Docker Compose, and Kubectl
- Bash inside of tmux
- Colors set for the [solarized colorscheme](http://ethanschoonover.com/solarized)

Example:
```
docker run -it --name studio --rm ericsage/studio
```

Language Editions
---------
Child images are built from the base edition and uploaded as tags on the base repository. This drastically reduces the size of the studio for some langauges and creates better sandboxing between development environments.

| Tag           | Description             | Version                    |
| ------------- | ----------------------- | -------------------------- |
| javascript    | Nodejs with NPM         | Node 7.x with NPM 5.x      |
| rust          | Rust, Cargo, and rustup | Latest stable and nightly  |
| haskell       | Haskell Stack           | Latest Stack sans compiler |
| ocaml         | Ocaml and OPAM          | Latest opam                |
| ruby          | Ruby                    | Latest stable source build |
| java          | Java with Maven         | JDK8u141 & Maven 3.5.0     |
| erlang        | Erlang                  | Installed from Fedora Repo |
| elixir        | Elixir                  | Installed from Fedora Repo |
| r             | R                       | Installed from Fedora Repo |

Example:
```
docker run -it --name studio-js ericsage/studio:javascript
```

Usage
-----
The studio is designed to mount a host directory with software projects onto `/root/Code/src/github.com/ericsage`. This persists projects across container lifetimes and allows tools external to the container to interact with the projects. It's also a good idea to mount the Docker socket so that Docker can be used normally for development inside the studio. Anything else that should be persistant like ssh keys or AWS credentials can be mounted from the host, and ports can be opened to test web applications from a host browser.

Full Example:
```
docker run -it --name studio --rm \
-v ~/Documents/Secrets/aws:/root/.aws \
-v ~/Documents/Secrets/key:/root/.key \
-v ~/Documents/Code/Golang:/root/Code/src \
-v /var/run/docker.sock:/var/run/docker.sock \
ericsage/studio
```
