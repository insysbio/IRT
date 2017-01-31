**TEST VERSION**

## Immune Response Template

IRT is a project aimed to collect, analyze and visualize available data on immune cells, cytokine, chemokines and other mediators interactions in humans. The unique feature of the project is its focus on quantitative systems pharmacology (QSP) modeling. The goal of the project is a tool for investigation of immune system and its multiple interactions, and for development of QSP models/platforms related to immune in human.

IRT team makes efforts in two directions: the development of database on human immune cells interaction (**IRT database**) and the development of tools for navigation and model creation (**IRT navigator**).

## IRT database

Current release **IRT database 1.0** describes about 10 types of cells, 10 surface molecules, 20 cytokines and 300 processes in 3 compartments: blood/plasma, lymph nodes and unspecified tissue.

IRT database includes:

* interactive schemes (**passport of immune cell** and **cytokine source profile**) for database navigation;
* annotation of each process, cell and cytokine with cross references and links to the external databases;
* rate equations of key processes involved in immune response derived on the basis of existing knowledge; 
* values of parameters of the rate equations identified via fitting of the specific "in vitro" models against _in vitro_ data or calculated using _in vivo_ data measured for **healthy human**;
* extended annotation of rate equations and parameters.

The database is distributed under two revisions: (1) demo version is available [online](online) for free under [CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/legalcode) lisence. (2) the full version is can be obtained under commercial license after request to **irt@insysbio.ru**

<table class="share-buttons">
<tr>
<td>text for first option</td>
<td>text for second option</td>
</tr>
<tr>
<td><a href="online"><img alt="try demo online" src="images/1/demo_button.svg"></a></td>
<td><a href="mailto:IRT%20team<irt@insysbio.ru>?subject=Request%20for%20Immune%20Response%20Template"><img alt="request for full version" src="images/1/full_button.svg"></a></td>
</tr>
</table>

**immune cell passport**
![immune cell passport](images/cell passport.png)

**cytokines sources profile**
![cytokines sources profile](images/cytokine profile.png)

## IRT navigator

**IRT navigator** provides the intuitive interface for searching the information and model template creation.  IRT navigator functionality:

* visualization of description and annotation of IRT database components: equations, species, parameters;
* access to supplementary materials including files related to in vitro models (used for parameters fitting against _in vitro_ data), files with description of parameters calculation and estimation of initial values for species;
* navigation across multiple interactions of immune cells;
* automatic generation of model template based on the user selection which can be downloaded as SBML L2/L3 file with or without full or partial annotation;
* "filter" search across whole database including interactive representation of search results on the schemes;
* various capabilities to include/exclude and check elements in the model of your choice;
* the ability to upload and continue to work with your previously downloaded model template;
* generation of summary with ODE system for chosen elements;
* running of IRT in one click in different OS (Windows, Mac OS, Linux).

**IRT navigator**
![IRT navigator](images/general view.png)

## Let people know about us

<ul class="share-buttons">
  <li><a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Firt.insysbio.ru&t=Immune%20Response%20Template" title="Share on Facebook" target="_blank"><img alt="Share on Facebook" src="images/social_flat_rounded_rects_svg/Facebook.svg"></a></li>
  <li><a href="https://twitter.com/intent/tweet?source=http%3A%2F%2Firt.insysbio.ru&text=Immune%20Response%20Template:%20http%3A%2F%2Firt.insysbio.ru&via=insysbio" target="_blank" title="Tweet"><img alt="Tweet" src="images/social_flat_rounded_rects_svg/Twitter.svg"></a></li>
  <li><a href="https://plus.google.com/share?url=http%3A%2F%2Firt.insysbio.ru" target="_blank" title="Share on Google+"><img alt="Share on Google+" src="images/social_flat_rounded_rects_svg/Google+.svg"></a></li>
  <li><a href="http://www.linkedin.com/shareArticle?mini=true&url=http%3A%2F%2Firt.insysbio.ru&title=Immune%20Response%20Template&summary=annotation%20and%20numerical%20description%20of%20immune%20response%20in%20humans&source=http%3A%2F%2Firt.insysbio.ru" target="_blank" title="Share on LinkedIn"><img alt="Share on LinkedIn" src="images/social_flat_rounded_rects_svg/LinkedIn.svg"></a></li>
  <li><a href="mailto:?subject=Immune%20Response%20Template&body=annotation%20and%20numerical%20description%20of%20immune%20response%20in%20humans:%20http%3A%2F%2Firt.insysbio.ru" target="_blank" title="Send email"><img alt="Send email" src="images/social_flat_rounded_rects_svg/Email.svg"></a></li>
</ul>

## Be in touch

_<a href="http://eepurl.com/b8w-v5" target="_blank">Subscribe for project updates</a>_

## Learn more

* [IRT main features booklet](doc/IRT 1.0 2016 booklet A5 online.pdf)

* [IRT summary presentation](doc/160901_IRT_presentation_ISB.pdf)

* _tutotial will be later_

## Team

- [Oleg Demin Jr.](https://www.linkedin.com/in/demin-jr): idea, modeling, coordination

- **Antonina Nikitich:** analytics, modeling, literature search

- @metelkin: database schema, scripting, "design"

- Other [ISBM](http://insysbio.ru/en) folks: **Oleg Demin**, **Alexander Stepanov**, **Maria Maximova**