# node-html-to-pdf-with-handlebars-and-wkhtmltopdf

This module shows how to convert an HTML ([Handlebars](https://github.com/wycats/handlebars.js)) template to a PDF file using [wkhtmltopdf](https://wkhtmltopdf.org/).

Example:
```
vagrant up
vagrant ssh
cd /vagrant
yarn start
```

Open your browser and go to `http://localhost:3000/?name=Alice`. This will open a PDF-file with Alice on the initial line.

## Vagrant

The example uses Vagrant to install [xvfb](https://packages.debian.org/nl/sid/xvfb) & [wkhtmltopdf](https://wkhtmltopdf.org/).

## Heroku

It is required to add a Buildpack to use [wkhtmltopdf](https://wkhtmltopdf.org/).

This can be done by manually adding the buildpack on your Heroku App in "Settings" → "Buildpacks".
```
https://github.com/allardvanderouw/heroku-buildpack-wkhtmltopdf.git
```

Or execute it on the Heroku CLI:
```
heroku buildpacks:add https://github.com/allardvanderouw/heroku-buildpack-wkhtmltopdf.git
```

Open your browser and go to `https://<<your-app>>.herokuapp.com/?name=Alice`. This will open a PDF-file with Alice on the initial line.