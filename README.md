mimosa
======

Build and serve web development meta-languages.

Not quite ready for prime-time, but feel free to play around.

## Installation

    $ npm install -g mimosa

# Quick Start

 The easiest way to get started with mimosa is to use the command line to
 create a new application skeleton. By default, mimosa will create a basic
 express app configured to match all of mimosa's defaults.

 First navigate to a directory within which you want to place your application.

 Create the default app:

    $ mimosa new -n nameOfApplicationHere

 This will:

   * Create a directory for the name you've given the application
   * Place an application skeleton inside that directory.
   * run a npm install on that directory

 Change into the directory that was created and execute:

    $ mimosa watch --server

 This will start mimosa watching the assets directory for changes to files, and copying the results over to the public directory.