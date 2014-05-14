emayll
======

A Jekyll instance for organizing and building HTML emails offline using Haml

## Dependencies

- [Jekyll 2.0](https://github.com/jekyll/jekyll)
- [Haml Converter Jekyll plugin](https://gist.github.com/dtjm/517556)

## Getting Started
- [Install Jekyll](http://jekyllrb.com/docs/quickstart/) (if you don't have it yet)
- Clone the repo
- Start the Jekyll server (jekyll serve)
- Watch the Jekyll build (jekyll build --w or [other options](http://jekyllrb.com/docs/usage/))

## Why would you ever do this?
I'm most comfortable working locally, in my editor. While I had done some occasional emails, creating them on a regular basis didn't become part of my job until I had been a front-end dev in MVC environments for a while.

## Methodologies

### Write emails in Haml
Haml is more terse than HTML and the white space requirement helps keep nested tables clean.

### Use HTML attributes whenever possible
As much as possible, I use HTML attributes. One example is bgcolor="" instead of applying a CSS background color. Another example is that separating paragraphs with spacer table rows.

### Use front matter as a combo of includes and variables
Yaml front matter is used for meta about each email. It is also used to reduce repetitive code and to control the styles of regular patterns.

### No automated inlining
A common practice is to write CSS in a stylesheet and then use something to automatically inline the CSS throughout your HTML. For the time being, I don't do that as I prefer to use a combo of YAML front matter and writing the code.

### Basic Organization
By default, emails are organized into promotional and transactional categories. This will likely work for about 10 of each before it gets unwieldy. It's enough for you to jump in and figure out if building in this way works well for you.

## Structure

### Layouts

#### default.html
The HTML structure for the landing page of emayll.

#### email.html
The basic structure for every email you send. Things like doctype, html, body, etc. Code that may change per email are put into includes.

### Includes

#### style.css
The global CSS that needs to be included in the head, primarily media queries. It's an include so that it is output into the the HTML file for each email.

#### email-header.haml
HTML for the header of a group of emails. If you have multiple types of headers, create more. An example may be mailchimp-header.haml and mandrill-header.haml

#### email-footer.haml
HTML for the footer of a group of emails. If you have multiple types of headers, create more. An example may be mailchimp-footer.haml and mandrill-footer.haml

#### head.html, header.html, footer.html
Will these stay? Review after styling can be done.

### Emails
Each email is a Haml file in a collections folder. The folders set up as a base are **_promotional** and **_transactional**. Haml files that are saved in those folders will be output as HTML every time that the build runs.
