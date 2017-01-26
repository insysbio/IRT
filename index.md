_social networks_

_email subscription_

_try demo_

_look at video_

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

The database is distributed under two revisions: (1) demo version is available [online](online) for free under [CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/legalcode)lisence. (2) the full version is can be obtained under commercial license after request to **irt@insysbio.ru**

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

## Read more

Download: [IRT main features booklet](doc/IRT 1.0 2016 booklet A5 online.pdf)

Download: [IRT summary presentation](doc/160901_IRT_presentation_ISB.pdf)

## Team
**Oleg Demin Jr.: idea, modeling, coordination**
<br/><img src="images/oleg.png" style="width:200px;"/>

**Antonina Nikitich: analytics, modeling, literature search**
<br/><img src="images/sansa.png" style="width:200px;"/>

**Evgeny @metelkin: database schema, scripting, "design"**
<br/><img src="images/evgeny.png" style="width:200px;"/>

Other ISBM folks: **Oleg Demin, Alexander Stepanov**
PR, schemes, testing
