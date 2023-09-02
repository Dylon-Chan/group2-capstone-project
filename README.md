# (SCTP) Cloud Infrastructure Engineering Capstone Project Documentation
## `Case 3 - Securtiy Focused (DevSecOps)`
### by Group 2: Chan Weng Siong, Chris Pang, David Suntama, Lim Poh Guan and Ng Poh Leng

## Company Profile
Our tech team is the backbone of Chat Secure which comprised of five IT experts who have different skillsets and are passionate about technology and dedicated to driving innovation. The team collaborate excellently and contribute ideas and solutions to ensure that Project Titanium is secure and identify vunlerabilites before it is rolled out. Here's a glimpse into the roles and responsibilities of our talented tech team:

## Developers Team
Our developers are the architects behind Project Titanium. They leverage their expertise in programming languages, such as Python, Java, and C++, to design, develop, and implement robust and scalable software solutions. Their skills range from front-end development for intuitive user interfaces to back-end systems that power our products' functionality.

## Project
Project Name: Titanium
Repository: https://github.com/Dylon-Chan/group2-capstone-project

The Developers team at Chat Secure is currently working on an exciting project called "Titanium" This project involves the development of a chat application website that implements a docker container with security as first priority.

## Getting started
To get the Node server running locally:
●	Clone this repo
●	npm install to install all required dependencies
●	Use snyk to scan for vunlerabilities
●	Deploy to dev, stage or production environment respectively

## Dependencies
●	dockerfile - definition for docker file

## Application Structure
●	index.js - The entry point to our application. This file for unit testing. It also requires the routes and models we'll be using in the application.

## Branching Strategies

### Development Branch (Dev)
https://github.com/Dylon-Chan/group2-capstone-project/dev
●	The dev branch, short for development branch, serves as the primary integration branch for ongoing development work.
●	It acts as a staging area for features and bug fixes before they are merged into the main branch.
●	Developers regularly merge their completed feature branches into the dev branch for integration testing and collaboration.
●	Continuous integration practices are often implemented on the dev branch, allowing automated testing and verification of code changes.

### Stage Branch (Stage)
https://github.com/Dylon-Chan/group2-capstone-project/stage

●	The stage branch, short for Stage branch, serves as the User Acceptance Test (UAT) for ongoing testing.
●	It acts as a staging area for testing before deploy Production environment

### Production Branch (Prod)
https://github.com/Dylon-Chan/group2-capstone-project/prod

●	The main branch, also known as the master branch, represents the production-ready state of the application.
●	It contains stable and thoroughly tested code that is ready to be deployed to the live environment.
●	Only fully reviewed and approved code changes are merged into the main branch.
●	It is typically protected, meaning that direct commits or modifications are restricted, and changes can only be introduced through pull requests after thorough code review and testing.

## CICD Pipeline
pre-deploy to check the application
npm install to install all required dependencies
deploy to deploy chat application to development, stage or production respectively
