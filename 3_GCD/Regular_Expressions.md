Notes: Regular Expressions
================
Katie M Brown
January 30, 2019

Regular Expressions
-------------------

-   Combination of literals and *metacharacters*
-   Literals are like the TEXT of a language and metacharacters are like the GRAMMAR
-   Regular expressions have a rich set of metacharacters

### Literals

Simple pattern consists of only literals.

    **Literal**

    "Lydia"

will match the lines:

> I found it in Lydia

> Lydia, oh! Lydia, say have you met Lydia

> Oh! Lydia, the tattooed lady

### Metacharacters

    **Line Start**

    ^i think

will match the lines:

> i think we all rule for participating

> i think i have been outed

> i think i need to go to work

    **Line End**

    morning$

will match the lines:

> well they had something this morning

> good morning

> I walked in the rain this morning

    **Between[]**

    [Bb][Uu][Ss][Hh]

will match the lines:

> Name the worst thing about Bush!

> BBQ and bushwalking at Molonglo Gorge

> I smelled the desert creosote bush, brownies and BBQ chicken

    **Between[]**

    ^[Ii] am

will match the lines:

> i am so angry

> I am boycotting the apple store

> i am so over this

    **Between[]**

    ^[0-9][a-zA-Z]

will match the lines:

> 7th inning stretch

> 1st sign of starvation

> 2nd half soon to begin

    **Between[] with ^ (means not)**

    [^?.]$ 

will match the lines:

> i like basketballs

> don't worry ... we all die anyway

> helicopter? hmmm!


    ** '.' Any Character **

    9.11 

will match the lines:

> 9-11 rules

> 9:11:46

> 01191020199113423


    ** | (or) **

    flood|fire

will match the lines:

> is firewire like usb on non macs

> the global flood makes sense within the context of the bible

> yeah i had the fire on tonight
