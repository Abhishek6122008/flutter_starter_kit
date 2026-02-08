---
name: Liquid Galaxy Flutter Project Bootstrap
description: Entry-point agent for creating and evolving a Flutter-based Liquid Galaxy project using an interactive intake and agent-driven workflows.
---

# 🚀 Liquid Galaxy Flutter Project Bootstrap

## Overview

This skill is the mandatory entry point for every new Liquid Galaxy Flutter project.

Its purpose is to:

- collect the project intent from the user
- define the global project scope
- decide which agent workflows will be used
- prepare a multi-feature project roadmap before any planning or execution

This skill must run before:

- lg-flutter-plan-writer
- lg-flutter-exec
- any feature workflow

Announce at start:

"I'm using the lg-flutter-project-bootstrap skill to initialize your Liquid Galaxy Flutter project."

---

## 🧭 Interactive intake (MANDATORY)

You must ask the following questions in order and wait for the user’s answer after each question.

### Step 1 – Project name

Ask:

What is the name of your Liquid Galaxy Flutter project?

Do not continue until a name is provided.

---

### Step 2 – Project goal

Ask:

In one or two sentences, what is the main goal of this project?

Do not continue until a clear goal is provided.

---

### Step 3 – Feature scope (multi-feature support)

Ask:

Which features do you want in this project?
List them as short feature ideas.

Example:
- earthquake visualization
- volcano visualization
- city tour
- satellite overlays

The user may provide one or many features.

You must treat each listed feature as an independent feature module to be generated later by workflows.

---

### Step 4 – Required capabilities

Ask the user to select the needed capabilities by number:

Which capabilities does your project require?

1. External open data API integration
2. KML visualization on Liquid Galaxy
3. Camera choreography (flyTo, orbit, focus targets)
4. Flutter UI screens and navigation
5. Agent-driven automation workflows
6. Testing and verification

---

### Step 5 – Environment and constraints

Ask:

Do you have any special constraints?

Examples:
- real Liquid Galaxy cluster
- Linux virtual machines
- offline demo
- limited network
- demo-only project

---

## 📦 Intake result aggregation

After collecting all answers, you must summarize them in a short structured block:

- Project name
- Project goal
- List of features
- Selected capabilities
- Constraints

This summary becomes the project context.

---

## 🧱 Project structure rule

The project must use the existing Flutter skeleton and its layers only:

- lib/api
- lib/kmls
- lib/lg
- lib/presentation
- lib/widgets

No other application layers may be introduced.

---

## 🗺️ Multi-feature project handling (MANDATORY)

This project is not limited to a single feature.

For each feature provided during intake:

- treat it as a separate feature pipeline
- generate its own plan using lg-flutter-plan-writer
- generate its own UI screen(s)
- reuse common API, KML and LG connection layers when possible

You must never merge multiple features into a single unstructured screen.

Each feature must be traceable as a distinct workflow execution.

---

## 🔁 Workflow orchestration

After the intake is complete, you must:

1. Forward the aggregated intake summary to lg-flutter-plan-writer.
2. Instruct the planner to create one plan per feature.
3. Ensure that each plan:
   - respects the existing Flutter skeleton
   - uses only the allowed layers
   - reuses existing KML builders and LGConnection
   - follows the task structure defined by lg-flutter-plan-writer

---

## 🚫 Hard constraints

You must not:

- generate Flutter code
- generate KML
- generate API clients
- modify files

This skill is only responsible for project initialization and orchestration.

---

## 🎓 Educational alignment

You must remind the next agent (lg-flutter-plan-writer) that:

- the Educational verification phase is mandatory
- no execution may start before verification succeeds

---

## Handoff

Once the intake phase is complete and the project summary is produced, hand off to:

lg-flutter-plan-writer

with the full aggregated intake context and the list of features to be planned.
