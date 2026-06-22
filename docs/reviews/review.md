# Resume Review — Platform Team EM Perspective

## Overall Impression

Strong signal on the technical fundamentals — CKA/CKAD, custom operators, Pulumi providers, 60+ node clusters — but the resume undersells you. A lot of this reads like a duty log rather than an impact story. I'd want to interview you, but I'd be uncertain about scope and depth going in.

---

## High Priority

**1. Summary needs a rewrite**

> "Open-source enthusiast from Des Moines... Hobby sysadmin..."

`resume.typ:42-43`

For a principal-level platform role, this is self-deprecating in the wrong direction. "Hobby sysadmin" undersells the 60-node production clusters you ran. Lead with your platform identity and your most compelling credentials. Something like:

> *Principal engineer with 8+ years building cloud-native platforms on Kubernetes. Certified Kubernetes Administrator and Developer with hands-on experience authoring custom operators, Pulumi providers, and self-service CI/CD infrastructure serving multiple application teams.*

**2. Almost zero quantified outcomes**

Every bullet in experience.yml describes a duty, not a result. Platform EMs want to see impact on developer velocity, reliability, or cost. For every bullet, ask: *so what?* Examples:

- "Administered 60+ node Kubernetes clusters" → add: uptime target, number of teams served, migration timeline
- "Maintained efficient and re-usable CI/CD pipelines" → add: how many teams? deployment frequency before/after?
- "Architected large scale data pipelines" → add: data volume, latency, team size

Even rough numbers beat nothing.

**3. Header title undersells your level**

`resume.typ:27` — "Software Engineer" doesn't match "Team Lead and Principal Consultant." For a platform team application, consider "Principal Platform Engineer" or "Staff Engineer, Platform."

---

## Medium Priority

**4. Source Allies bullets need curation for platform roles**

You have 11 bullets at Source Allies that span mobile benchmarking, React Native, data pipelines, rewards apps, and Kubernetes operators. That breadth signals generalist consultant, not platform specialist. For platform roles, front-load the infrastructure bullets and either cut or de-emphasize the mobile/app bullets.

**5. Projects section is too terse**

`projects.yml` — your side projects are actually very impressive for a platform role (custom Pulumi providers, k8s operators, baremetal provisioning) but the descriptions read like package.json descriptions. Add 1-2 sentences on *why you built it* and any adoption/impact. `the-cluster` especially — link to it and describe what it runs.

**6. Missing: observability / reliability context**

No mention of Prometheus, Grafana, OpenTelemetry, PagerDuty, SLOs, or incident response. Platform teams own reliability; the absence of this vocabulary is noticeable.

---

## Lower Priority

**7. Stack section ordering**

Certifications (CKA, CKAD) are buried in the middle of the stack list. Either move them to their own line or put them first — they're hard credentials that a recruiter or ATS will scan for.

**8. Interests section**

"Compilers, language design" are interesting but off-topic for platform work and may confuse a recruiter. "DevOps, Linux, event-driven architecture" are on-brand — consider trimming to just the platform-relevant ones.

**9. Kum & Go has no platform angle**

The bullets there are all product/app dev. If you built any internal tooling, introduced standardized pipelines, or improved developer experience during that tenure, those belong on a platform-targeted resume.

---

## One Framing Suggestion

The most compelling narrative for a platform team is: *"I've been on the application side and I know what developers need, and I've built the platforms that serve them."* Your career arc actually supports this well — app dev at Kum & Go, then platform/infra work at Source Allies — but the resume doesn't tell that story. The summary and bullet framing are where you'd make that arc legible.
