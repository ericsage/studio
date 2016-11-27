
 Sage OS
=========

My collection of development environments inside a set of container images. Language specific derived images build off of a highly customized Fedora image that includes all of my dot files and favorite applications. Feel free to fork this project to create your own set of portable development environments or experiment with my own.

Base Includes
-------------

- Tmux, Vim with Lua, Git
- CLI Internet applications (elinks, irssi, rtorrent, elinks, lynx, mutt)
- Python & Python3 with setuptools, virtualenv, and wheel
- Man pages
- Google Cloud SDK
- AWS SDK
- Docker client
- Kubernetes client

Languages
---------
Sage OS includes my favorite languages as images derived from the base. Docker Hub builds these images automatically with names as tags.

| Tag           | Description           | Version |
| ------------- | --------------------- | ------- |
| erlang        | Erlang                | 19.1.5  |
| golang        | Golang                | 1.7.3   |
| haskell       | Haskell with Stack    | Latest  |
| java          | Java with Maven       | 8u111   |
| javascript    | Nodejs with NPM       | 6.x     |
| ocaml         | Ocaml                 | Latest  |
| r             | R                     | 3.3.1   |
| Ruby          | Ruby                  | Latest  |
| Rust          | Rust with Cargo       | Latest  |

Usage
-----
To use the base image:

``` docker run -it --name linux ericsage/os ```

> Add the `--priviliged` flag to control the docker daemon from inside the container.

To use a specific language derived from the base:

``` docker run -it --name golang ericsage/os:golang ```
