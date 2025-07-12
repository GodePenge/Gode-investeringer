# Overview

This Project contains the website source code for the website <https://godeinvesteringer.dk>. This was made to display relevant investment information.

This Project was carried out by Thor Dueholm to create a website for *[Gode Penge](https://www.godepenge.dk/)*. The website is hosted at <https://godeinvesteringer.dk>.
The project was made in Vue 3 and runs as a GitHub Pages application deployed on a separate branch named "gh-pages". The domain is configured through  *[GoDaddy](https://www.godaddy.com/)*, which redirects the traffic to the corresponding GitHub Pages domain.

The following sections will go through how to alter the information displayed on the website.

## Project setup

First and foremost, the project found here must be cloned to your local device. This can be done using

  git clone https://github.com/GodePenge/Gode-investeringer.git

To run the website locally, Node must be installed, which can be done here <https://nodejs.org/en>. After Node has been installed run

    npm --version

To check that the npm command works. (As a side note Node version 9.6.1 was used for the development of the project; however, any newer version should work. It is recommended to simply take the latest stable release.)

Now, install all the relevant packages with

    npm install

After this is done, run either

    vue serve

or

    npm run serve

If successful, this should serve as a local version of the website, usually at <http://localhost:8080/>.

Now we can begin altering information on the website. All major text components is found at /Gode-investeringer/src/assets/Data. For example, the cards.json found here contains all of the info used in the ArticlePageNew.vue component, which is the red squares with rounded images on top. If the data in these is altered, it will affect the website; additionally, more could be added by simply adding the following to the file:

```
,
  {
    "title": "[Insert title for front page here]",
    "text": "[Insert text for front page here]",
    "image": "[Insert path to image on front page here]",
    "fullTitle": "[Insert title shown in the next page here]",
    "fullText: "[Insert all of the text displayed in the next page here]"
    ]
  }
```

Be aware that the fullText is intepreted as HTML code this means that if a link such as <https://www.google.com/> should be attached to the words "this is google" it can be done as follows

    <a href='https://www.google.com/'>this is google</a>

Simply embed this directly into the text written in the fullText field. Additionally each line ending with a , creates a newline in the final rendering of the text.

It works similarly for the bloc posts and the articles.

### Deploying the changes

Before deploying the changes, be aware that you must be able to commit changes using git. This means a valid ssh key must be uploaded to your GitHub profile. This can be checked at your profile settings. If a ssh key is not present, one must be generated. There are plenty of guides online so I will not describe how to do this here.

When the desired changes have been made and the website looks correct in the locally served version. The changes can be committed to the repo. in order to streamline this process a shell file have been created there for you can simply run:

    ./deploy.sh "[Describe the changes made here]"

If all goes well, the changes should appear at <https://godeinvesteringer.dk> after a couple of minutes.


## Repo structure

The repository is split into views and components, which can be found in their respective folders, that is /Gode-investeringer/src/views and /Gode-investeringer/src/components. One component that holds all the other views is HomeView.vue. If a page is removed from here, it will no longer appear on the website. Additionally, the ordering of components determines the ordering displayed on the website.

