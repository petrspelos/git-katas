# git Katas

> A code kata is an exercise in programming which helps programmers hone their skills through practice and repetition.
[source](https://en.wikipedia.org/wiki/Kata_(programming))

This repository contains scripts that are able to generate a git repository in different situations in order to allow you to practice resolving them.

## What do I need?

In order for these scripts to work, you will need to have `git` installed. You can download it [here](https://git-scm.com/).

There are slight differences between Windows' Batch scripts and Shell scripts that run on GNU/Linux. Make sure you run the scripts for your system.

## What situations are available?

Currently there are the following situations:

- Merge conflict
- Accidental commit into a wrong branch
- A branch with one of the older commits being unwanted (should move to a different branch)
- 💡 **Some you came up with.** _If you have an idea, create an issue or pull request the script._ 😊

## How does it work?

These scripts utilize the `git` command and common system tools to create a new repo, write files, commit them as different fake users, create branches, etc. To quickly setup the desired state.

When you make a mistake, or just want to start over, you can delete the repository folder generated and generate it with the script again.

## Contributing

Please feel free to contribute your own situation, refactor the existing ones, create issue for ideas, questions, or comments you have about the project.

Anyone is welcome to participate. ❤
