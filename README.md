# ThemovieDB App

<img src="https://www.themoviedb.org/static_cache/v4/logos/primary-green-d70eebe18a5eb5b166d5c1ef0796715b8d1a2cbc698f96d311d62f894ae87085.svg" width="100">


## Description
The Movie Database (TMDb) is a community built movie and TV database. This IOS App allows looking for your favourites films informations and tv shows informations.

## Features
- Activity Indicator
- Each character detail screen is Presenter
- Cast navigation to character detail screen
- Top search bar with character detail info

## Requires

- [Get your API key](https://developers.themoviedb.org/3/getting-started/introduction)
- [carthage](https://github.com/Carthage/Carthage)
- Xcode 9.2

## Install
```
$ git clone git@github.com:AbGLopez/TheMovieDB_App.git
$ cd TheMovieDB_App
$ carthage build --platform iOS
```
Add api key in `../TMDbCore/Config/Keys.xcconfig`.

```
TMDB_API_KEY = <ApiKey>
```
[Get your API key](https://developers.themoviedb.org/3/getting-started/introduction)
