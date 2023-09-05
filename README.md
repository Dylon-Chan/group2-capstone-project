# (SCTP) Cloud Infrastructure Engineering Capstone Project Documentation
## Case 3 - Securtiy Focused (DevSecOps)
### by Group 2: Chan Weng Siong, Chris Pang, David Suntama, Lim Poh Guan and Ng Poh Leng

## Company Profile
ChatSecure is a dynamic and innovative tech startup specializing in DevSecOps services. Founded in 2023, our company brings together a team of five dedicated tech experts with a shared passion for enhancing software development and operational processes through security-first practices. We are committed to helping organizations achieve a secure and efficient software development lifecycle.

## Company Mission Statement
At ChatSecure, our mission is to empower businesses to seamlessly integrate security into their software development and operations. We strive to create a culture of security awareness while expediting the delivery of robust software solutions, thus reducing vulnerabilities and risks.

## Core Services
1. DevSecOps Consulting: Our team of DevSecOps specialists, including Chris, David, Poh Guan, Poh Leng, and Weng Siong, provides expert guidance and tailored strategies to facilitate the effective adoption of DevSecOps principles within your organization.
2. Secure CI/CD Pipeline Setup: We design, develop, and implement secure Continuous Integration and Continuous Deployment (CI/CD) pipelines that include automated security testing and compliance checks, streamlining your development workflows while enhancing security measures.
3. Vulnerability Management: ChatSecure offers comprehensive vulnerability assessment and management services, identifying and mitigating security weaknesses in your applications and infrastructure, ensuring early detection and remediation of potential threats.
4. Security Automation: Leveraging cutting-edge automation tools and techniques, we seamlessly integrate security throughout your software development lifecycle. This includes automated code scanning, configuration management, and threat detection.

## Our Team
Our developers are the architects behind Project Titanium. They leverage their expertise in programming languages, such as Python, Java, and C++, to design, develop, and implement robust and scalable software solutions. Their skills range from front-end development for intuitive user interfaces to back-end systems that power our products' functionality:

1. Weng Siong - Co-founder and CEO, a visionary leader with a cybersecurity and software development background (CI/CD/SCA).
2. Poh Leng - Chief Security Officer (CSO), a seasoned security specialist with expertise in threat detection and incident response (CI/CD/SAST).
3. Poh Guan - Security Analyst, proficient in vulnerability assessment and management (CI/CD/OIDC/Docker).
4. David - Security Analyst, proficient in vulnerability assessment and management (CI/CD/OIDC/IaC).
5. Chris - DevOps Engineer, experienced in building secure CI/CD pipelines and automation (CI/CD/DAST).

## Showcase Project
Project Name: Titanium
Repository: https://github.com/Dylon-Chan/group2-capstone-project

## Architecture
*** Diagram Chris

## Requirement / Criteria for Project Titanium
1. A typical CICD Pipeline
2. Implement dependency screening in CI Script
3. Ensure proper authentication and authorization in each environment in CD Script. (e.g. credentials used for deploying development and production environments should not be the same)
4. Proper handling of CICD Pipeline Secrets

## Getting started
### To get the Node server running locally:
1.	Clone this repo
2.	npm install to install all required dependencies
3.	Use snyk to scan for vunlerabilities
4.	Deploy to dev, stage or production environment respectively

## Dependencies
1.	dockerfile - definition for docker file

## Application Structure
###	index.js - The entry point to our application. This file for unit testing. It also requires the routes and models we'll be using in the application.

## CICD Pipeline
pre-deploy to check the application
npm install to install all required dependencies
deploy to deploy chat application to development, stage or production respectively

## Workflow for Project Titanium
![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/92975797/f668febf-d88e-46c9-afe8-55c85d70f186)

## Branching Strategies
![BranchingStrategy](https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/4b6df491-f6a5-4317-8e57-3389e75f8a65)

### Development Branch (Dev)
https://github.com/Dylon-Chan/group2-capstone-project/dev
- The dev branch, short for development branch, serves as the primary integration branch for ongoing development work.
-	It acts as a staging area for features and bug fixes before they are merged into the main branch.
- Developers regularly merge their completed feature branches into the dev branch for integration testing and collaboration.
- Continuous integration practices are often implemented on the dev branch, allowing automated testing and verification of code changes.


### Stage Branch (Stage)
https://github.com/Dylon-Chan/group2-capstone-project/stage

- The stage branch, short for Stage branch, serves as the User Acceptance Test (UAT) for ongoing testing.
- It acts as a staging area for testing before deploy Production environment

### Production Branch (Prod)
https://github.com/Dylon-Chan/group2-capstone-project/prod

- The main branch, also known as the master branch, represents the production-ready state of the application.
- It contains stable and thoroughly tested code that is ready to be deployed to the live environment.
- Only fully reviewed and approved code changes are merged into the main branch.
- It is typically protected, meaning that direct commits or modifications are restricted, and changes can only be introduced through pull requests after thorough code review and testing.

## Branch Creation
*** Program Weng Siong

## Branch Protection
*** Diagram Weng Siong

## Chat Application
*** Program Poh Guan

Steps to create

## Unit tests
*** Program David

## Vulnerability Scan
*** Program Poh Leng

## GitHub Actions
We use GitHub Actions to automate our CI/CD Pipeline. Our CI/CD Pipeline build, test, and deploy code right from GitHub. We make code reviews and branch management fron within GitHub.

## About GitHub Actions Workflows
A workflow is a configurable automated process that will run one or more jobs. Workflows are defined by a YAML file checked in to our repository and will run when triggered by an event in our repository, or they can be triggered manually, or at a defined schedule.

We use event to trigger the workflow in our CI/CD Pipeline.

Earlier we run unit test, vulnerability scan and deploy serverless application in local environment. It is now time to set up a CI/CP Pipeline that run all these jobs automatically whenever a code change is push to the GitHub respository.

The following outline the steps required to create a GitHub Actions workflow.
*** Program Poh Guan

## Workflow Syntax
**name**: The name of the workflow.

**on**: The type of event that can run the workflow. This workflow will only run when there is a git push to either the main or other branch.

**jobs**: A workflow consists of one or more jobs. Jobs run in parallel unless a ***needs*** keyword is used. Each job runs in a runner environment specified by ***runs-on***.

**steps**: A sequence of tasks to be carried out.

**uses**: Selects an action to run as part of a step in your job. An action is a reusable unit of code.

**with**: A map of input parameters.

**run**: Runs command line programs.

**env**: Set the environment variables.

These are the jobs defined in dev.yml, stage.yml, prod.yml and snykscan.yml which will be run in GitHub Actions workflow:
*** Program Weng Siong - deploy, David - the rest, Poh Leng - Snyk

### These are the jobs defined in [dev.yml][./github/workflows/dev.yml] which will be run in Github Actions workflow :
Job name : `pre-deploy`

```yml
  pre-deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "The job is automatically triggered by a ${{ github.event_name }} event on ${{ github.ref_name }} branch."
```
In `pre-deploy` job, useful information such as the triggered event name, output can be seen in the job details when it complete.
![pre-deploy detail]

## Step 1: Create main.yml in .github/workflows folder

## Step 2: Add AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and Snyk_Token to GitHub Secrets
1. Goto Settings, Secret and variables, Actions and click New repository secret
2. Add AWS_ACCESS_KEY_ID. Then repeat the same for AWS_SECRET_ACCESS_KEY and SNYK_TOKEN

![SecretKey](https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/2e56d3be-e064-4014-8b33-ffd8061096f3)

## Step 3: Create a pull request and commit a merge in GitHub to start the workflow
*** Diagram Poh Leng


## Lesson Learnt
1. Team collaboration is critical for the success of the project

2. Repository name is case sensitive and Yaml’s syntax and spacing are important

## Future Enhancement
1. Explore other security scanning systems such as SonarQube, JFrog, Synopsys, Checkmarx, etc. and explore which is better for which type of scanning.

2. Explore using Jira Service Management as a ticketing system to integrate with GitHub to report issues and follow up

## Conclusion

The project was successfully implemented as we have completed the CI/CD Pipeline and secured the application by scanning of vulnerabilities using the tools such as Branching strategy, GitHub branch creation & protection, Docker container application deployment, Unit test, GitHub Actions Workflow and Agile methology using Jira software.
