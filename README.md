# This project is no longer maintained

After years of using this project I realized I was only using one feature it
has, so I decided to move it under a script inside my dotfiles. If you are
interested in checking it out, you can [find it here](https://github.com/nglgzz/dots/blob/master/dots/.bin/find_project).

# Project Utils

Here's a set of scripts to help navigating and keeping organized a projects folder.

## Installation

To install just execute the following commands.

    # cd in your projects folder
    git clone https://github.com/nglgzz/project-utils.git
    cd project-utils
    ./init.sh

The `init.sh` script will add two entries to your `.bashrc` file: one exports the PROJECTS variable, with the path to where you cloned this repo; and the second one sources the config file. It will also ask for superuser permission to edit the `/etc/bash_completion.d/projects` file and add autocompletion to the commands. **Important**: do not execute `init.sh` as sudo, unless you want the script to edit `/root/.bashrc` instead of `~/.bashrc`.

An alias on poweroff is created to autosave the projects before shutting down the PC (it can be changed on the config file).

## Folder Structure

Most commands are independent from the folder structure.

- `save` and `update` require the projects folder to be a git repository, and to have configured origin and origin-r remote servers (default is origin).

- `templates` and `init` require a `.templates` folder containing templates for starting up projects.

Here's an example of a valid projects folder, containing two templates, and three projects.

    projects/
    ├── .git/
    ├── .templates/
    │   ├── node-app/
    │   └── webpack.config.js
    ├── project-utils/
    ├── random/
    │   ├── random-project/
    │   └── another-random-project/
    └── my-awesome-project/

## Commands

All commands can be executed in two ways: `projects [command] [args]` or the short version `p[command] [args]`. Autocompletion works only using the short version.
Below a list of all possible commands and their usage, arguments between brackets are optional.

- `help` print all commands
- `find foo` find path of project foo
- `cd foo` cd in project foo (works only using the short version)
- `ls foo [bar]` list files [in path bar] in project foo
- `la foo [bar]` list all files [in path bar] in project foo
- `cat foo bar` show content of file bar in project foo
- `save [remote]` git add, commit, push [origin-r]
- `update` git pull
- `templates` show templates available for init command
- `init template [foo]` creates a new project from template [named foo]

When entering a project name is not necessary to enter the full name, or to enter the dashes.

### Examples

Assuming the folder structure presented above is located in the home folder, here's a few example commands and their bash translation.

- `pcd awesome` → `cd $HOME/projects/my-awesome-project`
- `pla anotherrand` → `ls -la $HOME/projects/random/another-random-project`
- `pinit node-app new-app` → `cp -r $HOME/projects/.templates/node-app ./new-app`
