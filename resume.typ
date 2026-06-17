#set page(
	header: align(center)[
		#set text(28pt)
		#text(weight: "thin")[Erik]
		#text(weight: "bold")[Rasmussen]
	],
	footer: align(right)[
		#set text(gray, 6pt)
		View the source code for this resume on #link("https://github.com/UnstoppableMango/resume")[GitHub]
	]
)
#set text(
  font: "Roboto",
  weight: "thin",
  size: 8pt
)

#let list(l) = {
	for x in l [
		- #text(weight: "medium")[#x.name]: #x.value
	]
}

#let phone = sys.inputs.at("phone", default: "(+1) (555) 555-5555")

#align(center)[
	#text(gray)[Software Engineer | Des Moines, IA]

	#set text(6pt)

	#grid(
		columns: (1fr, 1fr, 1fr, 1fr),
		align(center)[ #phone],
		align(center)[ #link("mailto:erik.rasmussen@unmango.dev")],
		align(center)[ #link("https://www.linkedin.com/in/unstoppablemango")[linkedin.com/in/unstoppablemango]],
		align(center)[ #link("https://github.com/UnstoppableMango")[github.com/UnstoppableMango]],
	)
]

= #text(blue)[Sum]mary

Open-source enthusiast from Des Moines with a decade of experience developing cloud-native solutions and line-of-business enterprise applications.
Hobby sysadmin with a passion for functional programming, software architecture, and language design.

= #text(blue)[Sta]ck

#list(yaml("qualifications/stack.yml"))

= #text(blue)[Exp]erience

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
	yaml("qualifications/experience.yml")
)

#pagebreak()

= #text(blue)[Sid]e Projects

#text(gray, 8pt, style: "italic")[All projects are hosted on GitHub]

#list(yaml("qualifications/projects.yml"))

== #text(blue)[Edu]cation

#let education = yaml("qualifications/education.yml").at(0)

#grid(
  columns: (1fr, 1fr),
  align(left)[
    #text(weight: "medium")[#education.organization]\
    #education.degree
  ],
  align(right)[
    #set text(style: "italic")
    #text(blue)[#education.location]\
    #education.duration
  ]
)

#for accomplishment in education.accomplishments [
  - #accomplishment
]
