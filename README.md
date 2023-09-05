# (SCTP) Cloud Infrastructure Engineering Capstone Project Documentation
## Case 3 - Securtiy Focused (DevSecOps)
### by Group 2: Chan Weng Siong, Chris Pang, David Suntama, Lim Poh Guan and Ng Poh Leng

## Company Profile
Our tech team is the backbone of ChatSecure which comprised of five IT experts who have different skillsets and are passionate about technology and dedicated to driving innovation. The team collaborate excellently and contribute ideas and solutions to ensure that Project Titanium is secure and identify vunlerabilites before it is rolled out. Here's a glimpse into the roles and responsibilities of our talented tech team:

## Developers Team
Our developers are the architects behind Project Titanium. They leverage their expertise in programming languages, such as Python, Java, and C++, to design, develop, and implement robust and scalable software solutions. Their skills range from front-end development for intuitive user interfaces to back-end systems that power our products' functionality.

## Project
Project Name: Titanium
Repository: https://github.com/Dylon-Chan/group2-capstone-project

The Developers team at ChatSecure is currently working on an exciting project called "Titanium" This project involves the development of a chat application website that implements a docker container with security as first priority.

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
*	The dev branch, short for development branch, serves as the primary integration branch for ongoing development work.
*	It acts as a staging area for features and bug fixes before they are merged into the main branch.
*	Developers regularly merge their completed feature branches into the dev branch for integration testing and collaboration.
*	Continuous integration practices are often implemented on the dev branch, allowing automated testing and verification of code changes.

### Stage Branch (Stage)
https://github.com/Dylon-Chan/group2-capstone-project/stage

*	The stage branch, short for Stage branch, serves as the User Acceptance Test (UAT) for ongoing testing.
*	It acts as a staging area for testing before deploy Production environment

### Production Branch (Prod)
https://github.com/Dylon-Chan/group2-capstone-project/prod

*	The main branch, also known as the master branch, represents the production-ready state of the application.
*	It contains stable and thoroughly tested code that is ready to be deployed to the live environment.
*	Only fully reviewed and approved code changes are merged into the main branch.
*	It is typically protected, meaning that direct commits or modifications are restricted, and changes can only be introduced through pull requests after thorough code review and testing.

## Branch Creation
*** Program Weng Siong

## Branch Protection
*** Diagram Weng Siong

## Chat Application
*** Program Poh Guan

Steps to create

## Unit tests
*** Program David

## Vulnerability Scan - Snyk Comprehensive Security Scan 
Continuous integration (CI) is part of the DevOps movement to involve developers in operations tasks. It uses a server to monitor your repository, executing specific tasks such as static analysis, compilation and bundling of code, and continuous integration testing. In our CI/CD pipeline, it is absolutely essential to include comprehensive package vulnerability scanning. This practice encompasses multiple layers of security checks, including Static Application Security Testing (SAST), Software Composition Analysis (SCA), Infrastructure as Code (IaC) scanning, and Container scanning. By seamlessly weaving these layers together, we fortify the security and integrity of our software, thereby significantly mitigating the risk associated with deploying insecure packages into our production environment during CI/CD testing.

### Static Application Security Testing (SAST)
SAST focuses on analyzing the source code of our applications for security vulnerabilities. It examines the codebase for potential issues, such as insecure coding practices, known vulnerabilities, and code logic flaws. By running SAST scans during our CI/CD pipeline, we detect vulnerabilities at the code level, allowing us to address them early in the development process.

### Run SAST scan - Continuous Integration (CI) testing on the Github hosted runner
For SAST scan, we will use Snyk Code analysis and uploads result into GitHub.
```
$ snyk code test --sarif --severity-threshold=high > snyk-code.sarif
...(truncated)....
✔ Test completed
```

### Software Composition Analysis (SCA)
SCA plays a vital role in identifying vulnerabilities in our project's dependencies and third-party packages. It scans the components and libraries used in our software, checking for known vulnerabilities and outdated dependencies. By incorporating SCA into our pipeline, we ensure that we are using secure and up-to-date components, reducing the risk of known vulnerabilities being exploited.

### Run SCA scan - Continuous Integration (CI) testing on the Github hosted runner
For SCA scan, we will use Snyk Open Source analysis and uploads result to Snyk.
```
$ snyk test --all-projects 
...(truncated)....
✔ Tested 65 dependencies for known issues, no vulnerable paths found.

$ snyk monitor --all-projects
Monitoring /home/runner/work/group2-capstone-project/group2-capstone-project (group2-capstone-project-chat)...

Explore this snapshot at https://app.snyk.io/org/dylon-chan/project/17b1d8b9-d5b0-4e55-8af8-dff2eac1eb71/history/46fa1190-9567-4072-8671-00a7a4f14236

Notifications about newly disclosed issues related to these dependencies will be emailed to you.
```

### Infrastructure as Code (IaC) Scanning
IaC scanning is crucial for evaluating the security of our infrastructure scripts and configurations. It examines our infrastructure code to identify misconfigurations, insecure settings, and potential risks. By including IaC scanning in our pipeline, we maintain the security of our infrastructure as it evolves, reducing the likelihood of security incidents related to configuration errors.

### Run IaC scan - Continuous Integration (CI) testing on the Github hosted runner
For IaC scan, we will use Snyk Infrastructure as Code analysis and uploads result to Snyk.
```
$ snyk iac test --report
Snyk Infrastructure as Code

- Snyk testing Infrastructure as Code configuration issues.
✔ Test completed.

Issues
  No vulnerable paths were found!

...(truncated)....

Report Complete

  Your test results are available at: https://snyk.io/org/dylon-chan/projects
  under the name: Dylon-Chan/group2-capstone-project

```
### Container Scanning
Container scanning focuses on the security of our Docker images and containers. It checks for vulnerabilities within the containerized applications and their dependencies. By integrating container scanning, we ensure that our containerized applications are free from known vulnerabilities, minimizing the risk of security breaches through containerized environments.

### Run Container scan - Continuous Integration (CI) testing on the Github hosted runner
Initially, we initiate the Docker image building process on the Github hosted runner using the following command:
```
docker build -t group2-chat-app/latest .
```
Subsequently, we commence the Snyk Container analysis and upload the results to Snyk.
```
$ snyk container test group2-chat-app/latest --file=Dockerfile
$ snyk container monitor group2-chat-app/latest --file=Dockerfile
...(truncated)....
✔ Tested 2 dependencies for known issues, no vulnerable paths found.

Tested 2 projects, no vulnerable paths were found.

Monitoring group2-chat-app/latest (docker-image|group2-chat-app/latest)...

Explore this snapshot at https://app.snyk.io/org/dylon-chan/project/02779ff9-426c-455d-93d5-7ff1f1f5ad95/history/b4d1839d-faba-4bf5-ba27-9f209b57a31b

Notifications about newly disclosed issues related to these dependencies will be emailed to you.

```


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
name: The name of the workflow.

on: The type of event that can run the workflow. This workflow will only run when there is a git push to either the main or other branch.

jobs: A workflow consists of one or more jobs. Jobs run in parallel unless a needs keyword is used. Each job runs in a runner environment specified by runs-on.

steps: A sequence of tasks to be carried out.

uses: Selects an action to run as part of a step in your job. An action is a reusable unit of code.

with: A map of input parameters.

run: Runs command line programs.

env: Set the environment variables.

These are the jobs defined in dev.yml, stage.yml, prod.yml and snykscan.yml which will be run in GitHub Actions workflow:
*** Program Weng Siong - deploy, David - the rest, Poh Leng - Snyk

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
