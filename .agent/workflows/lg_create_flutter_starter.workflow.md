---
name: Create Flutter Liquid Galaxy Starter Kit
description: End-to-end workflow to bootstrap, plan, generate and validate a Flutter Liquid Galaxy starter kit using the Liquid Galaxy agent system.
---

# 🧭 Workflow – Create Flutter Liquid Galaxy Starter Kit

## Purpose

This workflow orchestrates the full creation of a Flutter-based Liquid Galaxy starter kit and a demo application using the Liquid Galaxy agent system.

This workflow must be used for all Flutter contest submissions.

---

## Execution order

### Step 1 – Security pre-check

Skill:
- lg-security-guardrails

Goal:
- Validate user request
- Validate repository boundaries
- Validate that only Flutter starter-kit generation is requested
- Validate that no malicious or out-of-scope actions are requested

---

### Step 2 – Project bootstrap and structure validation

Skill:
- lg-flutter-project-bootstrap

Goal:
- Verify starter-kit folder structure
- Verify skeleton contracts
- Verify Liquid Galaxy project conventions
- Verify no forbidden plugins or runtimes are introduced

---

### Step 3 – Experience and Liquid Galaxy visual design

Skills:
- lg-experience-designer

Goal:
- Define user experience flow
- Define Liquid Galaxy navigation and camera behaviour
- Define how multiple screens are used

---

### Step 4 – KML visual and spatial design

Skill:
- lg-kml-artist

Goal:
- Define required KML features
- Define spatial, temporal and animated KML structures
- Define how data will be represented on the Liquid Galaxy rig

---

### Step 5 – Flutter technical planning

Skill:
- lg-flutter-plan-writer

Goal:
- Produce a Flutter-specific implementation plan
- Include API, data, KML, presentation and connection layers
- Store the plan in docs/plans/

---

### Step 6 – External API integration

Skill:
- lg-flutter-api-integration

Goal:
- Integrate at least one external open API
- Generate clean domain models and repositories
- Do not generate any KML at this stage

---

### Step 7 – KML generation pipeline

Skill:
- lg-flutter-kml-pipeline

Goal:
- Convert domain data into KML builders
- Generate KML feature classes under lib/data/kmls
- Ensure KML is compatible with Liquid Galaxy

---

### Step 8 – Screen and UI generation

Skill:
- lg-flutter-screen-generator

Goal:
- Generate Flutter screens
- Wire screens to the KML pipeline and LG connection layer

---

### Step 9 – Automated tests

Skill:
- lg-flutter-test-generator

Goal:
- Generate basic unit and widget tests
- Validate API, KML builders and presentation logic

---

### Step 10 – Skeptical and educational review

Skill:
- lg-skeptical-mentor

Goal:
- Challenge architectural decisions
- Highlight weaknesses and limitations
- Provide improvement suggestions

---

### Step 11 – Final review

Skill:
- lg-review

Goal:
- Validate architecture and layering
- Validate DRY and SOLID principles
- Validate documentation and reproducibility

---

### Step 12 – Final security validation

Skill:
- lg-security-guardrails

Goal:
- Re-check generated code and files
- Detect unsafe patterns or forbidden content

---

### Step 13 – Quiz and reflection

Skill:
- lg-quiz-maker

Goal:
- Generate learning and validation quiz
- Validate learning objectives and understanding

---

## Mandatory rules

- All steps must be executed in order.
- Security guardrails must be applied before and after code generation.
- The Flutter starter-kit architecture must not be altered.
- The workflow must generate and use at least one external API and one KML pipeline.
- All outputs must remain compatible with the contest requirements.
