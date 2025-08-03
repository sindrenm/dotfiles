## My Dotfiles with Chezmoi

This repository stores my personal dotfiles, managed by the [Chezmoi][chezmoi]
library. Chezmoi allows for easy configuration management across multiple
machines.

### Getting Started

1. **Install Chezmoi:** Follow the installation guide for your operating system
   on the [Chezmoi website][chezmoi].
2. **Clone this Repository:** Clone this repository to your local machine using
   Git.
3. **Initialize Chezmoi:** Run `chezmoi init <username>` (replace `<username>`
   with your Git username) to initialize Chezmoi and configure the remote
   repository.
4. **Apply Changes:** Run `chezmoi apply` to apply your dotfiles to your home
   directory.

### Usage

This repository uses Chezmoi's special file naming convention (e.g.,
`dot_bashrc`). Chezmoi will automatically map these files to their intended
locations in your home directory (e.g., `.bashrc`).

#### Adding Dotfiles

* Add your dotfiles to this repository and commit your changes.
* Run `chezmoi add <filename>` to add a specific file to Chezmoi's tracking.

#### Ignoring Files

* Create a file named `.chezmoiignore` at the root of this repository.
* This file functions similarly to a `.gitignore` file, but patterns should
  match the source file path, not the destination.

#### Templating

* Chezmoi supports templating using [Go Templates][go-templates].
* Use files with the `.tmpl` extension for templated dotfiles.
* Define environment variables within your templates for dynamic configuration.

### Additional Resources

* Chezmoi documentation: [Chezmoi website][chezmoi]
* Chezmoi templating: [Go Templates][go-templates]
* Chezmoi ignore files: [.chezmoiignore][chezmoi-ignore]

[chezmoi]: https://chezmoi.io/
[chezmoi-ignore]: https://chezmoi.io/reference/special-files-and-directories/chezmoiignore/
[go-templates]: https://pkg.go.dev/text/template
