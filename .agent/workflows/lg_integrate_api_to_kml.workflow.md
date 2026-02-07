---
name: Integrate External API Data to KML for Flutter Liquid Galaxy
description: Orchestrates the end-to-end pipeline that converts open API data into KML using Flutter builders and sends it to Liquid Galaxy via the LG connection driver.
---

# 🧭 Workflow – Integrate API Data to KML (Flutter)

## Purpose

This workflow connects:

external open data API  
→ structured Flutter API layer  
→ Flutter KML builders and KmlPayload  
→ Liquid Galaxy connection driver

It is the mandatory workflow for any feature that visualizes external data on Liquid Galaxy screens.

---

## Execution order

### Step 1 – Security and scope validation

Skill:
- lg-security-guardrails

Goal:
- Validate that the request uses only open data
- Validate that no secrets, credentials or device plugins are required
- Validate that changes are restricted to allowed folders

---

### Step 2 – Data requirement clarification

Skill:
- lg-experience-designer

Goal:
- Clarify what real-world data is needed
- Clarify spatial meaning of the data
- Clarify which visual elements must be produced

---

### Step 3 – Visual and spatial design

Skill:
- lg-kml-artist

Goal:
- Design the spatial representation
- Identify which KML geometry types are required
- Identify camera focus targets and spatial composition

---

### Step 4 – Flutter planning

Skill:
- lg-flutter-plan-writer

Goal:
- Produce a Flutter-specific plan describing:
  - API layer changes
  - KML layer changes
  - LG driver orchestration
  - UI hooks
- Save the plan in docs/plans/

---

### Step 5 – Educational verification

Skill:
- lg-flutter-plan-writer

Goal:
- Run the educational verification phase
- Ensure the student understands:
  - data flow
  - layer responsibilities
  - KML builder usage

---

### Step 6 – API integration

Skill:
- lg-flutter-api-integration

Goal:
- Integrate the selected open API
- Produce structured domain models
- Expose clean API contracts inside lib/api/

---

### Step 7 – KML generation pipeline

Skill:
- lg-flutter-kml-pipeline

Goal:
- Convert structured API output into KML using only:
  - PointKmlBuilder
  - PolygonKmlBuilder
  - RouteKmlBuilder
  - PyramidKmlModel
  - KmlLogo
- Produce KmlPayload objects when required

---

### Step 8 – Liquid Galaxy driver binding

Skill:
- lg-lg-connection-driver

Goal:
- Bind generated KmlPayload objects to the LGConnection contract
- Orchestrate camera and overlay actions

---

### Step 9 – UI workflow exposure

Skill:
- lg-flutter-screen-generator

Goal:
- Expose workflow triggers in the Flutter UI
- Provide user inputs and execution feedback
- Keep UI free from business and KML logic

---

### Step 10 – Testing

Skill:
- lg-flutter-test-generator

Goal:
- Generate tests for:
  - API layer contracts
  - KML generation logic
  - UI workflow hooks
  - LG driver orchestration (mocked)

---

### Step 11 – Review

Skill:
- lg-review

Goal:
- Verify architectural boundaries
- Verify code clarity and documentation
- Verify compliance with the starter-kit structure

---

### Step 12 – Learning quiz

Skill:
- lg-quiz-maker

Goal:
- Generate a learning quiz focused on:
  - API to KML data flow
  - spatial reasoning
  - Flutter layering
  - Liquid Galaxy visualization concepts

---

## Mandatory rules

- All steps must be executed in order.
- Only open data APIs are allowed.
- Only the existing Flutter starter-kit layers may be modified.
- Only the existing KML builders and models may be used.
- The LGConnection contract must not be bypassed or replaced.
- Security guardrails must be applied before and after execution.
- No secrets, credentials or device plugins are allowed.
