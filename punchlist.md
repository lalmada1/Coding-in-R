Items to update. Thank you, Jesse! 

- [ ] On the main page / syllabus, can the instructor name "Lorenzo Almada" be linked to my gsu page (https://aysps.gsu.edu/profile/lorenzo-almada/)? 
- [X] On the main page / syllabus, can we make the black font white when the background is blue on the headers and footers?

In assets/css/custom.css add: 

```
/* NAVBAR TEXT COLOR */
div.uk-navbar a {
    color: white !important;
}
```

- [X] On the main page / syllabus, can we turn the sun icon to a panther paw icon?

In layouts/default.html, change: 

```
<a href="{{ site.program-website | absolute_url }}" target = "_blank"> <i class="fas fa-sun" id="github_icon"></i></a>
# TO: 
<a href="{{ site.program-website | absolute_url }}" target = "_blank"> <i class="fas fa-paw" id="github_icon"></i></a>
```


- [X] On the main page / syllabus, can we resize the GSU logo so it doesn't look stretched? 

In layouts/default.html near the bottom: 

```
<img  id="logo" src="{{site.course_url}}/assets/img/{{site.program-logo}}" align="left" style="width:600px;height:180px;" >
# TO:
<img  id="logo" src="{{site.course_url}}/assets/img/{{site.program-logo}}" align="left" style="width:400px;height:220px;" >
```

- [ ] On the schedule, can we render all the lab instructions to be in html? Also, please make lab instructions course agnostic. For example, labs 4 and 7 instructions (and maybe others) have references to CPP 526 with links. Please remove to avoid confusion. Also, some lab instructions contain old links for template downloads. Please remove these as well to avoid confusion. 
- [ ] Please upload Code-Through lab instructions and template (currently not found in the Template repo). 
 
