# Liquid Galaxy – Agentic Flutter Starter Kit  
Gemini Summer of Code – Agentic Programming Contest 2026

This repository provides an agent-first Flutter starter kit for building Liquid Galaxy applications using Google Antigravity and Gemini.

The goal of this repository is not to deliver a single Flutter app.  
The goal is to deliver an agentic development environment capable of planning, generating, validating and evolving Liquid Galaxy Flutter applications and KML pipelines.

---

## Project goals

- Provide a clean Flutter starter kit aligned with Liquid Galaxy best practices
- Provide an agent system built on Google Antigravity
- Enable agents to design Liquid Galaxy experiences
- Enable agents to integrate external open APIs
- Enable agents to generate KML features and pipelines
- Enable agents to generate Flutter screens
- Enable agents to validate architecture and safety
- Demonstrate the system with a small example application

---

## Agentic architecture

The agent system lives inside the .agent directory.

Folder structure:

.agent  
 ├─ skills  
 ├─ workflows  
 └─ rules  

All planning, generation and validation steps are executed by agents.

Gemini is used only inside the Google Antigravity agent environment.  
The Flutter project is treated as a generation target.

---

## Main workflow

The main workflow used to build Flutter projects is:

.agent/workflows/create_flutter_lg_starter_kit.yaml

This workflow orchestrates:

- security validation
- project structure validation
- experience and Liquid Galaxy visual design
- KML design
- Flutter technical planning
- external API integration
- KML pipeline generation
- Flutter screen generation
- automated test generation
- skeptical and educational review
- final architectural review
- final security validation
- quiz and reflection

---

## Agent skills overview

Main agent skills included in this starter kit:

- lg-security-guardrails
- lg-flutter-project-bootstrap
- lg-experience-designer
- lg-flutter-plan-writer
- lg-flutter-api-integration
- lg-flutter-kml-pipeline
- lg-flutter-screen-generator
- lg-flutter-test-generator
- lg-kml-artist
- lg-review
- lg-skeptical-mentor
- lg-quiz-maker

Each skill operates strictly within its architectural boundaries.

---

## Flutter starter kit structure

The Flutter project follows a strict layered architecture:

lib  
 ├─ api                External API contracts and providers  
 ├─ data  
 │   └─ kmls           KML features and API to KML adapters  
 ├─ lg                 Liquid Galaxy transport contracts  
 ├─ presentation       Flutter UI and screens  
 └─ main.dart  

---

## External API to KML to Liquid Galaxy pipeline

The starter kit enforces a strict data flow:

External open API  
→ API contract in lib/api  
→ domain objects  
→ KML adapters and features in lib/data/kmls  
→ KmlPayload  
→ Liquid Galaxy sender contract in lib/lg

UI code never performs network calls and never generates KML.

---

## KML feature architecture

All KML features implement a common contract that produces a KmlPayload.

This allows agents to generate and compose:

- point and route geometries
- polygon and 3D demo geometries
- screen overlays
- animated camera tours using gx:Tour
- time-based visualisations using TimeStamp and TimeSpan

---

## Demo application

A minimal demo application is included to showcase the agent-generated pipeline.

The demo implements:

- a place search using a geocoding API contract
- conversion of the resulting coordinates into KML
- transmission of the KML payload to a Liquid Galaxy sender interface

This demonstrates the minimum functionality required by the contest:

usage of one external API, conversion of its data into KML and correct display on Liquid Galaxy screens.

---

## External API used

The demo uses a geocoding API through the following contract:

lib/api/geocoding_api.dart

In the reference setup this contract is intended to be implemented using an open provider such as OpenCage or an equivalent open geocoding service.

Only domain data is exposed to downstream layers.

---

## Safety and guardrails

All workflows are protected by the lg-security-guardrails skill.

The system enforces:

- no UI access to network APIs
- no KML generation inside the API layer
- no Liquid Galaxy transport logic inside presentation code
- no secrets or API keys stored in the repository
- strict repository and file boundary validation

---

## Design principles

- strict separation of layers
- DRY and SOLID principles
- agent-driven planning and generation
- reproducible workflows
- minimal and extensible skeleton design

---

## How to run the demo

This repository is intended to be used through the Google Antigravity agent system.

For local Flutter execution:

- install Flutter
- run flutter pub get
- run flutter run

The demo entry screen is configured in main.dart.

---

## Video demonstration

The submission video demonstrates:

- repository walkthrough
- agent skills overview
- workflow execution
- API integration and KML pipeline generation
- demo application execution
- strengths and limitations of the agent system

---



## License

This project follows the same open-source licensing model as the Liquid Galaxy project and is compatible with MIT and Apache 2.0 licenses.
