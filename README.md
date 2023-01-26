# Amanuensis

_"An amanuensis is a person employed to write or type what another dictates or to copy what has been written by another."_ 

<br>

There's a problem I'm constantly facing: I can't restart my computer or update stuff that might ask for restart because there's always a ton o open tabs in my browser.
Copy each url to a file would be tedious (and we know that programmers are lazy). I've tried a third party solution as well and didn't like. So I decided to implement a solution myself.

Amanuensis combine a Bash script and a Python script to save the urls of open tabs in your browser and later restore them.

## Requisites

- The scripts were written on a Linux environment but I'm working on a Windows version 
- At this point, Firefox is the only browser supported but I'm also working on that
- You must have Python 3 installed
- You must have lz4 lib installed and you can get it by running `pip install lz4`

## Usage

Make sure that both Bash and Python scripts are in the same directory. Then run: <br>
`bash amanuensis.sh save` to save the urls <br>
`bash amanuensis.sh restore` to restore the tabs

When saving, a text file called "saved_urls.txt" will be created. Make sure this file exists when trying to restore.

*Tip: You can also export the Bash script as an environment variable so you can call it anywhere.*