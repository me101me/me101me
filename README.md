me101me
=======

me101me is a cross-platform meme generator. It can take a photo from your webcam or import an existing image as background.

It is written in HTML + Javascript + CSS.
There are Desktop App and Web App flavors.

## Desktop App
It supports Windows and Linux.
It runs with `nw.js` runtime.
The entry point is `bin/me101me`.
By default, the meme images are stored in a `~/.local/share/me101me` directory.
Config file is stored in `~/.config/me101me/config`.

It has git integration script `me101me-git` that allows you to take photo after creating your git commit.
To enable git integration to a git repository, add `me101me-git` to the hook script `.git/hooks/post-commit`.
Per-repository meme images are stored in `.git/me101me` directory.

## Web App
It can be viewed in a desktop or mobile web browser. The entry point is `app.html`. For Firefox, the page can be loaded from a web server or the file system. For Chrome, if you need to use webcam, the page must be loaded from an HTTPS server, due to its security model.

## Installation
- Desktop App: Download the zip / tarball of corresponding platform from Github release and extract the files to any directory.
- Web App: Download the source zip / tarball from Github release and extra the files to any directory. A web server like Apache / Nginx or any simple web server can serve the static resources. Please configure web server to point to `app` directory.

## Contribution
Github Pull requests are welcome.

## License
MIT
