#set page()
#set text(
  font: "Roboto",
  weight: "thin",
  size: 8pt
)

#let address = sys.inputs.at("address", default: "42 Wallaby Way Sydney, NSW")
#let phone = sys.inputs.at("phone", default: "(+1) (555) 555-5555")

#align(center)[
  #text(28pt)[
    #text(weight: "thin")[Erik]
    #text(weight: "bold")[Rasmussen]
  ]

  #text(blue, 8pt, weight: "regular")[
    #grid(
      columns: (1fr, 1fr),
      align(center)[Software Engineer],
      align(center)[Application Developer]
    )
  ]

  #text(gray, 6pt)[#address]

  #grid(
    columns: (1fr, 1fr, 1fr),
    column-gutter: 1pt,
    align(center)[ #phone],
    align(center)[ #link("mailto:ecr.referee@hotmail.com")],
    align(center)[ #link("https://www.linkedin.com/in/unstoppablemango")[unstoppablemango]]
  )
]

= #text(blue)[Sum]mary

Current Application Developer at Kum & Go in Des Moines. 4 years experience specializing in full stack development with a focus on
backend systems and architecture. Passion programmer, hobby sysadmin, and Linux enthusiast. Interested in complex problem-
solving and procuring the right tools for the job.

= #text(blue)[Ski]lls

#grid(
  columns: (1fr, 10pt, 7fr),
  align(right)[
    #set text(weight: "bold")
    DevOps\ Back-end\ Front-end\ Programming
  ],
  align(center)[],
  align(left)[
    Azure, Azure DevOps, Docker, Jenkins\
    ASP.NET Core, MVC, gRPC\
    Angular, Blazor, HTML5, SASS\
    C\#, Typescript, SQL, Node.js, Java, C++/C
  ]
)

= #text(blue)[Wor]k Experience

#let experience(e) = {
	grid(
		columns: (1fr, 1fr),
		align(left)[
			== #e.employer
			#e.role
		],
		align(right)[
			#set text(style: "italic")
			#text(blue)[#e.location]\
			#e.duration
		]
	)

	for accomplishment in e.accomplishments [
		- #accomplishment
	]
}

#let workExperience(e) = {
	for exp in e {

		experience(exp)
	}
}

#workExperience(
	yaml("qualifications/current/experience.yml")
)

= #text(blue)[Edu]cation

#grid(
  columns: (1fr, 1fr),
  align(left)[
    == University of Wisconsin Platteville
    B.S. IN SOFTWARE ENGINEERING
  ],
  align(right)[
    #set text(style: "italic")
    #text(blue)[Platteville, Wisconsin]\
    Sep. 2013 - Dec. 2017
  ]
)

- Dean's Honours List
