# Tutorial - Angular Tour of Heroes

## 0. Overview

## 1. Create new Angular Application

``` PowerShell title="PowerShell"
# Create a new angular project
# 1. Make sure you're in the root folder.
ng new angular-tour-of-heroes

# Default Options to choose:
? Would you like to add Angaulr routing? yes
? Which stylesheet format would you like to use? CSS
```

## 2. Serve the default application

``` PowerShell title="PowerShell"
# Serve the Angular Project on port 4000, and also open the website (https://localhost:<port>) in default web browser.
ng serve --port 4000 --open
```

Goal: Check that the application works.

## 3. Remove boiler plate code in App Component

1. Open file `angular-tour-of-heroes > src > app`.
2. Delete contents of `app.component.html`.
    1. Leave the `<router-outlet></router-outlet>` text.

## 4. Change default landing page

1. Change the `title` variable in the component.
2. Change the `Page` to use this `title` variable.

``` ts title="src\app\app.component.ts" linenums="1" hl_lines="9"
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Tour of Heroes';
}

```

``` html title="src\app\app.component.html" linenums="1" hl_lines="1"
<h1>{{title}}</h1>
<router-outlet></router-outlet>
```

## 5. Add application styles

Most apps strive for a consistent look across the application. ng new created an empty styles.css for this purpose. Put your application-wide styles there.

Open `src/styles.css` and add the code to the file.

## 6. Generate new hero component

``` PowerShell title="angular-tour-of-hereos\src\app"
ng g c hereos
```

## 7. Edit the hero component

## General Notes

- Pipes are a good way to format strings, currency amounts, dates, and other display data. Angular ships with several built-in pipes and you can create your own.
  - `<h2>{{hero.name | uppercase}} Details</h2>` - `uppercase` is the pipe.
- 

## References

- <https://angular.io/tutorial/tour-of-heroes/toh-pt0>