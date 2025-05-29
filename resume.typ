#set page(
	header: align(center)[
		#set text(28pt)
		#text(weight: "thin")[Erik]
		#text(weight: "bold")[Rasmussen]
	],
	footer: align(right)[
		#set text(gray, 6pt)
		View the source code for this resume on GitHub #link("https://github.com/UnstoppableMango/resume")
	]
)
#set text(
  font: "Roboto",
  weight: "thin",
  size: 8pt
)

#let address = sys.inputs.at("address", default: "42 Wallaby Way Sydney, NSW")
#let phone = sys.inputs.at("phone", default: "(+1) (555) 555-5555")

#align(center)[
  #text(gray)[#address]

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

== #text(blue)[Edu]cation

#grid(
  columns: (1fr, 1fr),
  align(left)[
    #text(weight: "medium")[University of Wisconsin Platteville]\
    B.S. IN SOFTWARE ENGINEERING
  ],
  align(right)[
    #set text(style: "italic")
    #text(blue)[Platteville, Wisconsin]\
    Sep. 2013 - Dec. 2017
  ]
)

- Dean's Honours List

= #text(blue)[Sta]ck

- #text(weight: "medium")[Languages:] Go, TypeScript, C\#, F\#, Rust, Haskell, C, C++, Java
- #text(weight: "medium")[Technologies:] Kubernetes, React (Native), Angular, TailwindCSS, Pulumi, Terraform
- #text(weight: "medium")[Certifications:] Certified Kubernetes Application Developer (CKAD), Certified Kubernetes Administrator (CKA)

= #text(blue)[Per]sonal Projects

- #text(weight: "medium")[unmango/go-make]: Makefile AST and parser in Go.
- #text(weight: "medium")[advent-of-code]: Advent of Code solutions.
- #text(weight: "medium")[pulumiverse/pulumi-talos]: Pulumi provider for Talos.
- #text(weight: "medium")[unmango/cloudflare-operator]: A kubernetes operator for managing Cloudflare resources.
- #text(weight: "medium")[CliWrap.FSharp]: F\# bindings for CliWrap.
- #text(weight: "medium")[the-cluster]: Homelab infrastructure using Pulumi.

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
	yaml("qualifications/current/experience.yml")
)
