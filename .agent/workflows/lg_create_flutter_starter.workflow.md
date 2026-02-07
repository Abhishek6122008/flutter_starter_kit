---
name: Create Flutter Liquid Galaxy Starter Kit
description: End-to-end workflow to bootstrap, plan, generate and validate a Flutter Liquid Galaxy starter kit using agent skills.
---

# 🧭 Workflow – Create Flutter Liquid Galaxy Starter Kit

## Purpose

This workflow orchestrates the full creation of a Flutter-based Liquid Galaxy starter kit and a demo application using agentic workflows and Gemini.

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

---

### Step 2 – Project bootstrap and structure validation

Skill:
- lg-flutter-project-bootstrap

Goal:
- Verify starter-kit folder structure
- Verify skeleton contracts
- Verify no platform or runtime plugins are present

---

### Step 3 – Experience and visual design

Skills:
- lg-experience-designer
- lg-kml-artist

Goal:
- Define experience structure
- Define spatial and visual KML design

---

### Step 4 – Flutter planning

Skill:
- lg-flutter-plan-writer

Goal:
- Produce a Flutter-specific implementation plan
- Store the plan in docs/plans/

---

### Step 5 – Educational verification

Skill:
- lg-flutter-plan-writer

Goal:
- Run the educational verification phase
- Ensure architectural understanding before execution

---

### Step 6 – Execution

Skill:
- lg-flutter-exec

Goal:
- Execute the plan task-by-task using the technical skills

---

### Step 7 – Review

Skill:
- lg-review

Goal:
- Validate architecture
- Validate layering
- Validate documentation and clarity

---

### Step 8 – Quiz and reflection

Skill:
- lg-quiz-maker

Goal:
- Generate learning quiz
- Validate learning objectives

---

## Mandatory rules

- All steps must be executed in order.
- Security guardrails must be applied before any code is generated.
- The Flutter starter-kit architecture must not be altered.
- All outputs must remain compatible with the contest requirements.
