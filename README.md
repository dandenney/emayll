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

A static site generator allows for a better workflow and still results in what is necessary for the sending services: a single HTML file with all of the code for the email.

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

| File | Purpose |
| ------------- | ----------- |
| default.html | The HTML structure for the landing page of emayll. |
| email.html | The basic structure for every email you send. Things like doctype, html, body, etc. Code that may change per email are put into includes. |

### Includes

| File                                | Purpose |
| ----------------------------------- | ----------- |
| style.css                           | The global CSS that needs to be included in the head, primarily media queries. It's an include so that it is output into the the HTML file for each email. |
| email-header.haml                   | HTML for the header of a group of emails. If you have multiple types of headers, create more. An example may be mailchimp-header.haml and mandrill-header.haml |
| email-footer.haml                   | HTML for the footer of a group of emails. If you have multiple types of headers, create more. An example may be mailchimp-footer.haml and mandrill-footer.haml |
| head.html, header.html, footer.html | Will these stay? Review after styling can be done. |

### Emails
Each email is a Haml file in a collections folder. The folders initially set up are **_promotional** and **_transactional**. Haml files that are saved in those folders will be output as HTML every time that the build runs.

### YAML Front Matter
Front matter is used to set information about an email, to control its layout, and to use variables for repeated code and values.

| Name | Purpose |
| ------------- | ----------- |
| ``` layout ```     | Sets the layout, which needs to be a file in the _layouts folder. |
| ``` title ```      | Sets the title of the email for displaying in emayll |
| ``` categories ``` | Sets the categories used for filtering in emayll |
| ``` service ``` | Displays the service being used for sent as meta information in emayll |
| ``` status ``` | Displays the status of the email as meta information in emayll. Requires manual configuration for anything beyond the default: inactive, active, retired |
| ``` Purpose ``` | Displays the purpose of the email as meta information in emayll |

The following are style defaults and will work only if the calls for them are used in a file. They allow for rapidly changing the look of an individual email.

| Name | Purpose |
| ------------------ | ----------- |
| ``` hdr-c-base ``` | Sets the base text color for the header table |
| ``` hdr-c-bg ``` | Sets the base background color for the header table |
| ``` hdr-c-link ``` | Sets the base link color for the header table |
| ``` hdr-border ``` | Sets the CSS for a border for the header. Defaults to having one and can be overridden in an individual email by changing to ```border-bottom: 0;``` |
| ``` ftr-c-base ``` | Sets the base text color for the footer table |
| ``` ftr-c-bg ``` | Sets the base background color for the footer table |
| ``` ftr-c-link ``` | Sets the base link color for the footer table |
| ``` ftr-border ``` | Sets the CSS for a border for the footer table. Defaults to having one and can be overridden in an individual email by changing to ```border-bottom: 0;``` |
| ``` tbl-base ``` | Sets base HTML attributes that need to be on every table. Used to reduce code a bit. |
| ``` tbl-typeset ``` | Sets the base font stack, size, and line-height in any table with ```{{ page.tbl-typeset }}``` in the style tag. Used to reduce code. |
| ``` c-bg ``` | Sets the background color of the primary container table in the layout, setting the background color of the email. |
| ``` c-base ``` | Sets the font color for all tables containing ```{{ page.c-base }}``` as a CSS color. |
| ``` c-link ``` | Sets the color for all links containing ```{{ page.c-link }}``` as a CSS color. |
| ``` c-title ``` | Sets the color for any title containing ```{{ page.c-title }}``` as a CSS color. |
| ``` gutter ``` | Sets the pixel width of spacer cells, which are used to keep content off the edges in clients. It was created after Mailbox app changed their rendering, but also fixes issues with Gmail at smaller resolutions. |
| ``` btn-c-base ``` | Sets the font color for button tables containing ```{{ page.btn-c-base }}``` as a CSS color. |
| ``` btn-c-bg ``` | Sets the background color for button tables containing ```{{ page.btn-c-bg }}``` as a CSS color. |
| ``` btn-c-shadow ``` | Sets the shadow color for button tables containing ```{{ page.btn-c-shadow }}``` as a CSS color. |
