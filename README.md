
 Sage OS
=========

A complete development environment inside a docker container. Use as the base for environment specific containers, to ship your development environment, or install locally on osx.

Includes
--------

- Tmux
- Vim with a highly customized vimrc
- Man pages and man command
- The EPEL Repository and Docker Repository
- Google Cloud SDK
- AWS SDK
- Pip
- Docker client
- Docker machine
- Docker compose
- Development Tools Group
- Console Internet Tools Group

Installation
------------

This environment requires either the [solarized or gruvbox terminal theme](https://github.com/ericsage/os/blob/master/terminal) color schemes and a [patched powerline font](https://github.com/ericsage/os/blob/master/font) to make tmux and vim look right. (Other color schemes not tested, but may look fine).

To drop into the environment, point a docker client to a running docker daemon and then:

``` docker run -it -priviliged ericsage/os ```

Or to install locally on osx, run install/osx.sh

Configuration
-------------

You can pass an environment file to docker run's --env-file. You can also modify this file with export statements and source it in your bash_profile for native installs. Many tools like the SDKs have their own long list of variables, but here's an example file with all of the variables needed to make the bashrc fully functional:

```
AWS_ACCESS_KEY=......
AWS_DEFAULT_REGION=......
AWS_ACCESS_KEY_ID=......
AWS_SECRET_KEY=......
AWS_VPC_ID=......
GOOGLE_CLOUD_PROJECT=......
```
