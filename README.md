# SourceBots Documentation

[![CI](https://github.com/sourcebots/docs/actions/workflows/ci.yml/badge.svg)](https://github.com/sourcebots/docs/actions/workflows/ci.yml)

URL: https://docs.sourcebots.co.uk

## Installation

To run this project locally, you'll need:

- Python (`>=3.6, <3.12`)
- `pip`

## Usage

### Installing dependencies

It's recommended to use a [virtual environment](https://docs.python.org/3/tutorial/venv.html):

```
python -m venv env
env\Scripts\activate.bat  # on windows
source env/bin/activate  # on macOS / Linux
```

Then, install dependencies:

```
pip install -r requirements.txt
```

### Running development server

```
mkdocs serve
```

This will launch a server on http://localhost:8000. Content in the server will live-reload as changes are made. If large refactors of the site structure are made, it's advisable to stop the server, make the changes, then restart it.

### Production build

```
mkdocs build
```

This will build the site once, and place it in `site/` in the root of the project. This may be useful to see which files are rendered, and how exactly to access them.

### Spell checking

This project uses `markdown-spellcheck` for spell checking. Plugins are
available for a variety of editors and a command line runner is available
through `npm`:

```
npm install
```

```
npm run spellcheck
```

Words that `markdown-spellcheck` is unaware of can be added to the `.spelling` file.
