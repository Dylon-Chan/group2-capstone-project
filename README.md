# (SCTP) Cloud Infrastructure Engineering Capstone Project Documentation
## Case 3 - Securtiy Focused (DevSecOps)
### by Group 2: Chan Weng Siong, Chris Pang, David Suntama, Lim Poh Guan and Ng Poh Leng
<br>
<br>

# Company Profile
ChatSecure is a dynamic and innovative tech startup specializing in DevSecOps services. Founded in 2023, our company brings together a team of five dedicated tech experts with a shared passion for enhancing software development and operational processes through security-first practices. We are committed to helping organizations achieve a secure and efficient software development lifecycle.

# Company Mission Statement
At ChatSecure, our mission is to empower businesses to seamlessly integrate security into their software development and operations. We strive to create a culture of security awareness while expediting the delivery of robust software solutions, thus reducing vulnerabilities and risks.

# Core Services
1. DevSecOps Consulting: Our team of DevSecOps specialists, including Chris, David, Poh Guan, Poh Leng, and Weng Siong, provides expert guidance and tailored strategies to facilitate the effective adoption of DevSecOps principles within your organization.
2. Secure CI/CD Pipeline Setup: We design, develop, and implement secure Continuous Integration and Continuous Deployment (CI/CD) pipelines that include automated security testing and compliance checks, streamlining your development workflows while enhancing security measures.
3. Vulnerability Management: ChatSecure offers comprehensive vulnerability assessment and management services, identifying and mitigating security weaknesses in your applications and infrastructure, ensuring early detection and remediation of potential threats.
4. Security Automation: Leveraging cutting-edge automation tools and techniques, we seamlessly integrate security throughout your software development lifecycle. This includes automated code scanning, configuration management, and threat detection.

# Our Team
Our developers are the architects behind Project Titanium. They leverage their expertise in programming languages, such as Python, Java, and C++, to design, develop, and implement robust and scalable software solutions. Their skills range from front-end development for intuitive user interfaces to back-end systems that power our products' functionality:

1. Weng Siong - Co-founder and CEO, a visionary leader with a cybersecurity and software development background (CI/CD/SCA).
2. Poh Leng - Chief Security Officer (CSO), a seasoned security specialist with expertise in threat detection and incident response (CI/CD/SAST).
3. Poh Guan - Security Analyst, proficient in vulnerability assessment and management (CI/CD/OIDC/Docker).
4. David - Security Analyst, proficient in vulnerability assessment and management (CI/CD/OIDC/IaC).
5. Chris - DevOps Engineer, experienced in building secure CI/CD pipelines and automation (CI/CD/DAST).

# Customer Request
In a high-security workplace with strict app restrictions, Sarah, the IT head, faced a communication problem. She couldn't install chat apps on company devices, yet the slow email system hindered real-time communication.

Our Solution: Our company proposed creating an in-house browser-based chat app, custom-built for security. It had basic text chat functions, with no multimedia features, and operated within the company's secure network.

Development and Testing: Our team developed a secure, isolated network and a minimalistic chat interface. After thorough testing, it was rolled out gradually.

Desired Results: The new chat app improved real-time communication without compromising security. It boosted productivity and collaboration, and other high-security workplaces sought their advice. This solution had not only solved Sarah company's problem but also helped others facing similar challenges.

Project Name: Titanium
Repository: [Titanium Project Repo](https://github.com/Dylon-Chan/group2-capstone-project)


# Requirement / Criteria for Project Titanium
1. A typical CICD Pipeline
2. Implement dependency screening in CI Script
3. Ensure proper authentication and authorization in each environment in CD Script. (e.g. credentials used for deploying development and production environments should not be the same)
4. Proper handling of CICD Pipeline Secrets

<br>

# Getting started
https://github.com/Dylon-Chan/group2-capstone-project/assets/20112494/cb6253f4-50fb-4e00-82cb-1ec8d9f5a535

# Application Design

## Software Architecture
ChatSecure offers a dynamic platform for instant messaging. Upon accessing, users are prompted to set a unique username. To make each participant distinct, the system automatically assigns a unique color to every username. Moreover, users can see the new joiners and the current number of participants in the chat room, adding a layer of interactivity.

### Backend:
Crafted with NodeJS, the backend harnesses the power of the Express framework for the web functionalities. Real-time communication is achieved through the socket.io library.

### Frontend:
The user interface is designed using a blend of HTML, CSS, and JavaScript.

## Infrastructure Architecture
![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/20112494/cbd2e0f7-9dd6-46d8-b8a2-b506f36261ec)


# CICD Pipeline

In the ever-evolving landscape of software development, Continuous Integration and Continuous Deployment (CI/CD) pipelines have become indispensable tools for ensuring the efficiency, reliability, and agility of applications. Here, we'll explore how a chat application, designed to operate exclusively within web browsers, underwent a transformative transition to embrace CI/CD pipelines.

However, in today's software development landscape, security can't be an afterthought; it must be integral from the start. This is where DevSecOps enters the stage—a paradigm shift seamlessly weaving security into the DevOps pipeline through tools that integrate diverse security functions.


# Workflow for Project Titanium
![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/92975797/f668febf-d88e-46c9-afe8-55c85d70f186)

# Branching Strategies
![BranchingStrategy](https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/4b6df491-f6a5-4317-8e57-3389e75f8a65)

## Development Branch (Dev)
https://github.com/Dylon-Chan/group2-capstone-project/blob/dev
- The main branch, also known as the master branch
- The dev branch, short for development branch, serves as the primary integration branch for ongoing development work.
- Developers regularly merge their completed feature branches into the dev branch for integration testing and collaboration.
- Continuous integration practices are often implemented on the dev branch, allowing automated testing and verification of code changes.

## Stage Branch (Stage)
https://github.com/Dylon-Chan/group2-capstone-project/blob/stage

- The stage branch, short for Stage branch, serves as the User Acceptance Test (UAT) for ongoing testing.
- It acts as a staging area for testing before deploy Production environment


## Production Branch (Prod)
https://github.com/Dylon-Chan/group2-capstone-project/blob/prod

- Represents the production-ready state of the application.
- It contains stable and thoroughly tested code that is ready to be deployed to the live environment.
- Only fully reviewed and approved code changes are merged from stage into the production branch.
- It is typically protected, meaning that direct commits or modifications are restricted, and changes can only be introduced through pull requests after thorough code review and testing.


# Branch Creation
There are two methods to create branch in GitHub: through the GitHub website and using a local environment followed by pushing to GitHub.

1. Create environment branches in GitHub website - `dev`, `stage` and `prod`. 
-	Navigate to the desired repository on the GitHub website.
-	Click on the branch dropdown list.
-	Enter the branch name and select "Create branch".

![CreateBranch](documentation/images/create-branch-online.png)

2. Create other feature branches in local machine and push to GitHub
-	Open the CLI terminal.
-	Navigate to the repository's directory.
-	Create a new branch using the following command. This command will create a new branch and switch to the new branch immediately.
    ```git
    git checkout -b <branch name>
    ```
-	Push the branch to GitHub using:
    ```git
    git push <branch name>
    ```
- If the branch isn't recognized on GitHub yet, use:
    ```git
    git push --set-upstream origin <branch name>
    ```

  **Note:** If we wish to create a branch without switching to it, use:
    ```git
    git branch <branch name>
    ```

![create-branch-local](documentation/images/create-branch-local.png)

# Branch Protection
Branch protection is a critical aspect of maintaining code integrity in a collaborative environment. It enforces rules on the specific branches and prevents unauthorized changes to the codebase.

**Steps to enable branch protection in GitHub:**
1. Navigate to the repository on the GitHub website.
2. Click on the "Settings" tab.
3. Click on the "Branches" tab.
4. Click on the "Add rule" button.
5. Enter the branch name to be protected.
6. Set up the branch protection rules as per team's requirement.

![setup-branch-protection](documentation/images/setup-branch-protection.png)

In this project, branch protection has been implemented for the `dev`, `stage` and `prod` branches. The following rules are enforced on these branches:

## `Prod` and `Stage` branches
Both require a pull request (PR) prior to merging:
- For `prod`: PR must be reviewed by all four team members.
- For `stage`: PR requires at least two team members reviews.
- Both branches require status checks to pass and must be up-to-date before merging.
- Administrators cannot override these branch protection rules.

![branch-protection-prod-stage](documentation/images/branch-protection-prod-stage.png)

## `Dev` branch
This branch solely requires a PR before merging, streamlining the process for team members to merge feature branches into dev for testing and collaboration.

![DevBranchProtection](documentation/images/branch-protection-dev.png)

# Best Practices on Branch Management

- **Descriptive Naming:** Choose clear and meaningful names for feature branches. This aids in collaboration and simplifies code review processes.
- **Clean House Regularly:** Remove outdated branches both locally and on GitHub periodically. A streamlined repository is easier to navigate and manage.
- **Stay Synced:** Consistently pull the latest changes from the main (or base) branch into our feature branches. Doing so reduces the risk of merge conflicts.
- **Pre-merge Checks:** Before merging a feature branch into the base branch, merge the latest changes from the base branch into our feature branch. This ensures that our feature branch is current and minimizes unforeseen integration issues.

# Package and Dependency Installation

Once the application source codes are available, we can install the required packages and dependencies. This can be done by running the following command in the terminal:
```bash
npm init                        # Create the package.json file
npm install express socket.io   # Install the required packages
```

`package.json`:
```json
{
  "name": "group2-capstone-project-chat",
  "version": "1.0.0",
  "description": "ChatSecure App",
  "main": "index.js",
  "author": "SCTP Cohort 2 Group 2",
  "dependencies": {
    "express": "~4.17.1",
    "socket.io": "^4.0.0"
  },
  "scripts": {
    "start": "node index.js",
    "test": "jest"
  },
}
```
For local exploration, update the scripts as above and launch the application:
```bash
npm start
```
We can now access the **ChatSecure** magic by heading over to http://localhost:3000 in the browser.

# Unit tests
Testing is intended to maintainability and functionality of our code. Since even small changes can have a significant impact, we ensure that our tests are updated with our code in order to reduce the likelihood of encountering a bug in the future.

1. Install Jest with npm
   ```
   $ npm install --save-dev jest
   $ npm install --save-dev socket.io-client
   ```
   The *--save-dev* flag updates the `devDepenendices` in package.json. They are only used for testing and development on a local basis.

   package.json

  ```json
  "devDependencies": {
    "jest": "^29.6.4",
    "socket.io-client": "^4.7.2"
  }
   ```

2. Test folder and test script

As soon as Jest is executed, it searches our repository for tests. The practice of keeping our test scripts in a folder is recommended.
   
![test-folder](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/a9fbd015-9d9d-4d82-9a17-5cb0037273b0)
  

4. Run the unit test - **`local testing`**

```bash
$ npm test
> group2-capstone-project-chat@0.0.0 test
> jest

 PASS  __tests__/username_colour.test.js
 PASS  __tests__/colour_array.test.js
 PASS  __tests__/socket.test.js

Test Suites: 3 passed, 3 total
Tests:       6 passed, 6 total
Snapshots:   0 total
Time:        0.487 s
Ran all test suites.
```
The output from **npm test** command shows that the unit test has passed.

The unit test has been successfully run locally. This unit test will be included in the CI/CD pipeline and will be automatically triggered through the [GitHub Actions](#github-actions) workflow.
<br>

# Containerization with Docker
Docker encapsulates applications within containers, providing an environment-agnostic platform to ensure uniform behavior across varying setups. Containerizing our ChatSecure application ensures consistent behavior across different environments, from local development to production deployment.

To initiate this, a Dockerfile is essential for Docker image construction.

## Dockerfile:
```bash
#use nodejs with latest version
FROM node:latest

#set working directory
WORKDIR /app

#install the app dependencies
#use wildcare to copy both package.json and package-lock.json
COPY package*.json ./
RUN npm install

#bundle app source
COPY . .

#expose port
EXPOSE 3000

#start the app
CMD ["npm", "start"]
```
## Local Docker Image Development:
1. Navigate to the root directory which contain the Dockerfile and build the Docker image with the following.
    ```bash
    docker build -t chatsecure-app:latest .
    ```
    This constructs a Docker image tagged `latest` under the name `chatsecure-app`

2. Launch the application inside a Docker container using:
    ```bash
    docker run -d -p 3000:3000 chatsecure-app:latest
    ```
3. Open the browser and navigate to `http://localhost:3000` to access the application.

<br>

Subsequently, this `Dockerfile` will play a pivotal role in our CI/CD pipeline, facilitating the automated build and push of the Docker image to AWS ECR.

<br>

# Vulnerability Scan
In our CI/CD pipeline, comprehensive package vulnerability scanning is absolutely essential. This practice involves multiple layers of security checks, including Static Application Security Testing (SAST), Software Composition Analysis (SCA), Infrastructure as Code (IaC) scanning, and Container scanning.

We will begin by locally validating each test to ensure the correct implementation of the Snyk security scan software. 

Subsequently, we will automate the same test in our Continuous Integration (CI) process.  This process employs a server known as a GitHub-hosted runner to monitor the repository and conduct each security scan during continuous integration testing, which we will explain in more detail later.

## Static Application Security Testing (SAST)
SAST focuses on analyzing the source code of our applications for security vulnerabilities. It examines the codebase for potential issues, such as insecure coding practices, known vulnerabilities, and code logic flaws. 

## Run SAST scan - `local testing`
For the SAST scan, we will employ Snyk Code analysis and generate results locally. 
```sh
$ snyk code test 
...(truncated)....
✔ Test completed
```

## Software Composition Analysis (SCA)
SCA plays a vital role in identifying vulnerabilities in our project's dependencies and third-party packages. It scans the components and libraries used in our software, checking for known vulnerabilities and outdated dependencies. 

## Run SCA scan - `local testing`
For SCA scan, we will use Snyk Open Source analysis and uploads result to Snyk.
```sh
$ snyk test --all-projects 
...(truncated)....
✔ Tested 65 dependencies for known issues, no vulnerable paths found.

$ snyk monitor --all-projects
...(truncated)....
Explore this snapshot at https://app.snyk.io/org/dylon-chan/project/17b1d8b9-d5b0-4e55-8af8-dff2eac1eb71/history/46fa1190-9567-4072-8671-00a7a4f14236

Notifications about newly disclosed issues related to these dependencies will be emailed to you.
```

## Infrastructure as Code (IaC) Scanning
IaC scanning is crucial for evaluating the security of our infrastructure scripts and configurations. It examines our infrastructure code to identify misconfigurations, insecure settings, and potential risks. 

## Run IaC scan - `local testing`
For IaC scan, we will use Snyk Infrastructure as Code analysis and uploads result to Snyk.
```sh
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
## Container Scanning
Container scanning focuses on the security of our Docker images and containers. It checks for vulnerabilities within the containerized applications and their dependencies. By integrating container scanning, we ensure that our containerized applications are free from known vulnerabilities, minimizing the risk of security breaches through containerized environments.

## Run Container scan - `local testing`
Initially, we initiate the Docker image building process using the following command:
```
docker build -t group2-chat-app/latest .
```
Subsequently, we commence the Snyk Container analysis and upload the results to Snyk.
```sh
$ snyk container test group2-chat-app/latest --file=Dockerfile
$ snyk container monitor group2-chat-app/latest --file=Dockerfile
...(truncated)....
✔ Tested 2 dependencies for known issues, no vulnerable paths found.

Tested 2 projects, no vulnerable paths were found.

Monitoring group2-chat-app/latest (docker-image|group2-chat-app/latest)...

Explore this snapshot at https://app.snyk.io/org/dylon-chan/project/02779ff9-426c-455d-93d5-7ff1f1f5ad95/history/b4d1839d-faba-4bf5-ba27-9f209b57a31b

Notifications about newly disclosed issues related to these dependencies will be emailed to you.
```
<br>

# Infrastructure in Different Environment
Our infrastructure setup varies across the three main environments: Development (Dev), Staging, and Production. Our workflow employs a centralized AWS ECR Private Repository, where Docker images are built and pushed. For deployments across all environments, the Docker image with the latest tag is utilized.

## Dev Environment:
In the Dev environment:
- Amazon Elastic Container Service (ECS) : We have established an ECS cluster, an ECS task definition, and an ECS service using Fargate.
- Security Group: A dedicated security group is configured for the ECS service. This group facilitates incoming traffic on port 3000.
- Network Configuration: The ECS is also equipped with a specified network configuration to ensure smooth communication and resource accessibility.

## Staging Environment:
For the Staging environment:
- ECS: Just like in Dev, an ECS cluster, ECS task definition, and ECS service are established using Fargate.
- Application Load Balancer (ALB): An ALB has been introduced. It listens to an ALB target group, which in turn is associated with the Fargate task.
- Security Group: Two security groups are established: One for the ALB, allowing incoming traffic on port 8000. The second for the ECS, permitting incoming traffic exclusively from the ALB's security group.

## Production Environment:
The Production environment infrastructure mirrors Staging but introduces an additional component:
- Route 53: Integrated with the ALB, Route 53 facilitates DNS management, ensuring reliable routing and enhanced availability.

<br>

> We utilize a centralized AWS ECR repository to ensure consistent, secure, and efficient Docker image management across all environments. Differentiated infrastructures for Dev, Staging, and Production allow for tailored resource allocation, enhanced security, and environment-specific scalability. Having individual Terraform state files for each environment offers granular control, mitigates risks by containing potential errors, and provides more organized and efficient state management.

<br>

# GitHub Actions
We use GitHub Actions to automate our CI/CD Pipeline. Our CI/CD Pipeline build, test, and deploy code right from GitHub. We make code reviews and branch management fron within GitHub.

## About GitHub Actions Workflows
A workflow is a configurable automated process that will run one or more jobs. Workflows are defined by a YAML file checked in to our repository and will run when triggered by an event in our repository, or they can be triggered manually, or at a defined schedule.

We use event to trigger the workflow in our CI/CD Pipeline.

Earlier we run unit test, vulnerability scan and deploy serverless application in local environment. It is now time to set up a CI/CP Pipeline that run all these jobs automatically whenever a code change is push to the GitHub respository.

The following outline the steps required to create a GitHub Actions workflow.
<br>

## Pre-requisite

### Create OIDC Roles on AWS IAM
In this project, `OpenID Connect` authentication protocol is being used instead of hard coding `AWS_SECRET_KEY` and `AWS_SECRET_ACCESS_KEY` inside Github Secrets and Variables.
- Login to AWS Console
- Add provider on IAM Identity providers

<img width="481" alt="Add IAM Provider" src="https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/aebf6e7b-07e9-4148-98bc-4fe6ee575576">

- Select OpenID Connect and ensure below information are correct
```
Provider URL :  https://token.actions.githubusercontent.com

Audience : sts.amazonaws.com

```
- Create new IAM Roles with `web identity`

![IAM web Identity](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/3a0d5055-5697-430e-8c2c-74f2e8426e1b)


- Attached permission policies accordingly
<img width="737" alt="image" src="https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/debc8dd8-ef1d-403b-97d7-af8e8d9d04d1">

In order to protect each individual deployment environment, three different IAM OIDC roles were utilized namely, 
- grp2-oidc
- grp2-oidc-stage
- grp2-oidc-prods

IAM permission policies required in deploying AWS Resources must be attached into these roles accordingly.

**`grp2-oidc`** is used for *`dev`* environment.

This role will only allow any actions executed from *`dev`* branch as indicated in trust relationship below:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::255945442255:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": [
                        "repo:Dylon-Chan/group2-capstone-project:ref:refs/heads/dev"
                    ]
                }
                "ForAllValues:StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
                    "token.actions.githubusercontent.com:iss": "https://token.actions.githubusercontent.com"
                }
            }
        }
    ]
}
```
<br>

**`grp2-oidc-stage`** is used for *`stage`* environment.

This role will only allow any actions executed from *`stage`* branch as indicated in trust relationship below:
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::255945442255:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:sub": "repo:Dylon-Chan/group2-capstone-project:ref:refs/heads/stage",
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                }
            }
        }
    ]
}
```
<br>

**`grp2-oidc-prod`** is used for *`prod`* environment.

This role will only allow any actions executed from *`prod`* branch as indicated in trust relationship below:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::255945442255:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
                    "token.actions.githubusercontent.com:sub": "repo:Dylon-Chan/group2-capstone-project:ref:refs/heads/prod"
                }
            }
        }
    ]
}
```
<br>

### Github Secrets
Prior to initiating the CI/CD pipeline, ensure that the necessary repository secrets are securely stored in GitHub Secrets. This not only safeguards sensitive data from potential leaks but also ensures they're readily available for reference within the workflows.
![Alt text](/documentation/images/github-secrets.png)

## Step 1: Create `dev.yml` in .github/workflows directory
![gitaction](https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/46dc8874-876e-4831-aa0a-49a324892851)

```yml
name: CICD for Group 2 Chat Application - Development
run-name: ${{ github.actor }} is running CICD for Group 2 Chat Application - Development
```

### The workflow is triggered on push event to the 'dev' branch
```yml
on:
  push:
    branches: [ dev ]
```

### Define permissions for this workflow, which can be added at either the job or workflow level.    
```yml  
permissions:
  id-token: write # This is required for requesting the JWT.
  actions: read # Permission to read actions.
  contents: read # Permission to read contents.
  security-events: write # Grants permission to write security event data for the repository.
``` 

### These are the jobs defined in [dev.yml](./.github/workflows/dev.yml) which will be run in Github Actions workflow :
Job name : `pre-deploy`

```yml
jobs:
  pre-deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "The job is automatically triggered by a ${{ github.event_name }} event on ${{ github.ref_name }} branch."
```
In `pre-deploy` job, useful information such as the triggered event name, output can be seen in the job details when it complete.

![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/6dea8858-fa05-4ccf-ad93-64196cf7d658)

<br>

Job name : `unit-testing`

```yml
  unit-testing:
    runs-on: ubuntu-latest
    needs: pre-deploy
    name: Unit Testing
    steps:
      - name: Checkout repo code
        uses: actions/checkout@v3
      - name: Install dependencies
        run: npm install
      - name: Run unit tests
        run: npm test
```
In `unit-tests` job, **npm test** command is used to run unit test. `pre-deploy` job must complete successfully before this job will run because of `needs: pre-deploy`.

![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/8ce14b7c-d389-4d81-bf87-94bc6b3ea6e7)

<br>

Job name : `SNYK-Comprehensive-Security-scan`

```yml
  SNYK-Comprehensive-Security-scan:
    needs: pre-deploy
    uses: ./.github/workflows/snyk-security.yml
    secrets: inherit
```

In `SNYK-Comprehensive-Security-scan` job, [**snyk-security.yml**](./.github/workflows/snyk-security.yml) workflow is called to run security scanning. `pre-deploy` job must complete successfully before this job will run because of `needs: pre-deploy`.

As both `unit-testing` and `SNYK-Comprehensive-Security-scan` jobs needs: `pre-deploy`, these 2 jobs will run in parallel after `pre-deploy` job is completed.


![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/c93fbf4d-d44e-43a2-8625-9cf86222d3ee)


### Snyk Comprehensive Security Scan Workflow
Below is the job defined in the Snyk Comprehensive Security Scan Workflow.

This GitHub Actions workflow sets up Snyk to analyze the full Snyk platform, including Snyk Open Source, Snyk Code, Snyk Container, and Snyk Infrastructure as Code (IaC). It checks for security vulnerabilities in the codebase and infrastructure, ensuring the project's security.

### Usage

To use this workflow, a Snyk API token will be needed. A Snyk API token can be obtained by signing up for free at Snyk. After obtaining the token, follow these steps:

1. The Snyk API token should be added as a GitHub secret named 'SNYK_TOKEN' in the repository.

2. A workflow file (e.g., .`github/workflows/snyk-security-scan.yml`) should be created or updated in the repository with the following content:

```yaml
name: Snyk Comprehensive Security scan

on:
  workflow_call:
    secrets:
      SNYK_TOKEN:
        description: 'A SNYK token passed from the caller workflow'
        required: true


jobs:
  SAST-SCA-IaC_Container_scan:
    permissions:
      contents: read # for actions/checkout to fetch code
      security-events: write # for github/codeql-action/upload-sarif to upload SARIF results
      actions: read # only required for a private repository by github/codeql-action/upload-sarif to get the Action run status
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Snyk CLI to check for security issues
        # Snyk can be used to break the build when it detects security issues.
        # In this case we want to upload the SAST issues to GitHub Code Scanning
        #uses: snyk/actions/setup@806182742461562b67788a64410098c9d9b96adb
        uses: snyk/actions/setup@master
        env:
          # This is where you will need to introduce the Snyk API token created with your Snyk account
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

        # For Snyk Open Source you must first set up the development environment for your application's dependencies
        # For example for Node
        #- uses: actions/setup-node@v3
        #  with:
        #    node-version: 16
      - uses: actions/setup-node@v3
      - run: npm ci        

        # This authentication step is typically used before running security scans or other Snyk-related actions.
      - name: Snyk Auth
        run: snyk auth --debug ${{ secrets.SNYK_TOKEN }} 
        
        # Runs Snyk Code (SAST) analysis and uploads result into GitHub.
        # Report only vulnerabilities at the severity-threshold=high or higher
        # Use || true to not fail the pipeline
      - name: Snyk Code test(SAST)
        run: snyk code test --sarif --severity-threshold=high > snyk-code.sarif  || true

        # Runs Snyk Open Source (SCA) analysis and uploads result to Snyk.
        # Report only vulnerabilities at the severity-threshold=high or higher
      - name: Snyk Open Source test and monitor(SCA)
        run: |
          snyk test --all-projects --severity-threshold=high
          snyk monitor --all-projects --severity-threshold=high

        # Runs Snyk Infrastructure as Code (IaC) analysis and uploads result to Snyk.
        # Report only vulnerabilities at the severity-threshold=high or higher
        # Use || true to not fail the pipeline.
      - name: Snyk IaC test and report
        run: snyk iac test --report --severity-threshold=high  || true

        # Build the docker image for testing
      - name: Build a Docker image
        run: docker build -t group2-chat-app/latest .
        
        # Runs Snyk Container (Container and SCA) analysis and uploads result to Snyk.
        # Report only vulnerabilities at the severity-threshold=high or higher
      - name: Snyk Container test and monitor
        run: |
          snyk container test group2-chat-app/latest --file=Dockerfile --severity-threshold=high
          snyk container monitor group2-chat-app/latest --file=Dockerfile --severity-threshold=high

        # Push the Snyk Code results into GitHub Code Scanning tab
      - name: Upload result to GitHub Code Scanning
        uses: github/codeql-action/upload-sarif@v2
        with:
          sarif_file: snyk-code.sarif
```

3. Save and commit the workflow YAML file to the repository, then push the changes to GitHub. Visit the "Actions" tab in the GitHub repository where the workflow is listed, and GitHub will start running it based on defined triggers.
![workflow-with-snyk](https://github.com/Dylon-Chan/group2-capstone-project/assets/92975797/628f3e53-c9a5-49bd-8a2b-842e36dcff20)

4. Click on the workflow to monitor its progress, view the details of each step as it runs, and if configured correctly, observe a successful completion marked by a green checkmark.
![steps-of-snyk-security-scan](https://github.com/Dylon-Chan/group2-capstone-project/assets/92975797/8348de10-4a45-48b3-a2d3-64be6f690ad9)

5. To inspect scan results, click the specific SNYK step (e.g., IaC, Container test, etc.). Resolve vulnerabilities if identified; if none are found, proceed to the next task. Repeat this process for each feature update to ensure there are no weaknesses or vulnerabilities in the code.
![open-step-to-check-scan-result](https://github.com/Dylon-Chan/group2-capstone-project/assets/92975797/fb53af9d-2c9d-4fd2-a0cf-87072e7e02a4)

<br>

### Deploy to Development Environment

Job name : `deploy`
```yml
deploy:
    runs-on: ubuntu-latest
    outputs:
      access_url_output: ${{ steps.tf-outputs.outputs.access_url }} # Define outputs for this job which can be used in subsequent jobs.
    needs: [ pre-deploy, unit-testing, SNYK-Comprehensive-Security-scan ] # This job depends on the completion of 'pre-deploy', 'unit-testing' and "SNYK-Comprehensive-Security-scan" jobs
    name: Deploy to AWS
    # Set environment variables for this job. Here, the deployment environment is set based on the branch name 'dev'.
    env:
      environment: ${{ github.ref_name }} # Specify the environment to deploy
    steps:
      
      # Checkout the latest code from the repository
      - name: Checkout repo code
        uses: actions/checkout@v3
      
      # Set up AWS credentials by using OIDC authentication which are stored in the Github Actions Secrets
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: ${{ secrets.DEV_ROLE_TO_ASSUME }}
          aws-region: ap-southeast-1
      
      # Log in to Amazon ECR (Elastic Container Registry)
      - name: Login to Amazon ECR 
        id: login-ecr # Define an id which allows other steps to reference outputs from this step.
        uses: aws-actions/amazon-ecr-login@v1
        with:
          mask-password: true

      # Create an ECR repository using Terraform and output the repository url for the input to the subsequent steps.
      - name: Create ECR repository using Terraform
        id: terraform-ecr # Define an id which allows other steps to reference outputs from this step.
        working-directory: ./modules/ecr
        run: |
          terraform init
          terraform plan
          terraform apply -auto-approve
          echo "ecr_url=$(terraform output -json | jq -r .repository_url.value)" >> $GITHUB_OUTPUT
      
      # Build and push the Docker image to the Amazon ECR Repository using the repository url from the previous step.
      - name: Push image to Amazon ECR
        id: push-image  # Define an id which allows other steps to reference outputs from this step.
        env:
          image_tag: latest # Define the image tag
        run: |
          docker build -t ${{ steps.terraform-ecr.outputs.ecr_url }}:$image_tag .
          docker push ${{ steps.terraform-ecr.outputs.ecr_url }}:$image_tag

      # Use Terraform to create AWS ECS resources like cluster, task definition, and service
      - name: Create AWS ECS cluster, task definition and service using Terraform
        id: terraform-ecs # Define an id which allows other steps to reference outputs from this step.
        working-directory: ./environments/${{ env.environment }}  # Set the working directory for this step
        # 'terraform apply -auto-approve' command is used to create or update the resources with auto-approval.
        # Variables are passed using the '-var' option to customize the Terraform configuration.
        # The '-target' option is used to restrict the scope of resource application.
        # Mark the ECS service resource for recreation in the next Terraform apply.
        run: |
          terraform init
          terraform apply -auto-approve \
          -var "image_name=${{ steps.terraform-ecr.outputs.ecr_url }}" \
          -target="aws_ecs_cluster.cluster" -target="aws_ecs_task_definition.task" \
          -target="aws_security_group.ecs_sg" -target="aws_ecs_service.service"
          terraform taint aws_ecs_service.service

          # Output the ECS cluster name for use in subsequent steps.
          echo "ecs_name=$(terraform output -json | jq -r .ecs_name.value)" >> $GITHUB_OUTPUT
      
      # Ensure that ECS task is running before proceeding to next step.
      - name: Check if ECS task is running
        run: |
          # Define ECS cluster and service names based on previous Terraform outputs.
          cluster_name=${{ steps.terraform-ecs.outputs.ecs_name}}
          service_name="${{ steps.terraform-ecs.outputs.ecs_name}}-service"
        
          # Set a timeout and interval for checking task status
          timeout=600 # Wait for 10 minutes max
          interval=30 # Check every 30 seconds
        
          # Capture the start time for timeout tracking
          start_time=$(date +%s)
        
          # Begin loop to check task status
          while true; do
              # Calculate elapsed time
              current_time=$(date +%s)
              elapsed_time=$((current_time - start_time))
                       
              # Fetch the task ARNs associated with the service
              task_arns=$(aws ecs list-tasks --cluster $cluster_name --service-name $service_name --query "taskArns" --output text)
                       # If no tasks are found, wait for the interval duration and then check again
              if [ -z "$task_arns" ]; then
                  echo "No tasks found. Waiting..."
                  sleep $interval
                  continue
              fi
        
              # Fetch the last status of the tasks
              statuses=$(aws ecs describe-tasks --cluster $cluster_name --tasks $task_arns --query "tasks[*].lastStatus" --output text)
        
              # Start by assuming all tasks are in the "RUNNING" state.
              all_running=true
        
              # Loop through each status and check if it's "RUNNING"
              for status in $statuses; do
                  if [ "$status" != "RUNNING" ]; then
                      all_running=false
                      break
                  fi
              done
        
              # If all tasks are running, exit the loop
              if $all_running; then
                  echo "All tasks are running."
                  break
              fi
        
              # If timeout is reached before all tasks are running, exit with an error
              if [[ $elapsed_time -ge $timeout ]]; then
                  echo "Timeout reached before all tasks reached RUNNING state."
                  exit 1
              fi
        
              # Wait for the specified interval before checking again
              echo "Waiting for tasks to reach RUNNING state..."
              sleep $interval
          done

      # Retrieve the access URL from Terraform outputs
      - name: Set up Terraform outputs
        id: tf-outputs  # Define an id for this step to be used in the subsequent steps.
        working-directory: ./environments/${{ env.environment }}  # Set the working directory for this step
        # Apply the Terraform configuration with the '-refresh-only' option to only refresh the state without creating/updating any resources.
        # Iinput variables are passed using the '-var' option. These are used to customize the Terraform configuration.
        # Fetch the 'all_access_urls' output from Terraform and process it with 'jq' to retrieve the access URL.
        run: |
          terraform apply -refresh-only -auto-approve -var "image_name=${{ steps.terraform-ecr.outputs.ecr_url }}"
          echo "access_url=$(terraform output -json all_access_urls | jq -r 'to_entries[0].value')" >> $GITHUB_OUTPUT

      # Display the access URL in the GitHub Actions log
      - name: Echo Access URL 
        run: echo "The Access URL is ${{ steps.tf-outputs.outputs.access_url }}"
```

For the `deploy` job to initiate, the `pre-deploy`, `unit-testing`, and `SNYK-Comprehensive-Security-scan` jobs must first complete successfully, as indicated by `needs: [ pre-deploy, unit-testing, SNYK-Comprehensive-Security-scan ]`.

The targeted deployment environment (whether it is dev, stage, or prod) is identified by the value of `environment: ${{ github.ref_name }}`, which references the branch name.

![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/554957ab-b13a-41c1-baf6-4e50d0df00b5)

Upon successful deployment, we can explore the Github Action workflow logs to retrieve the application's access URL.

![dev-access-url](/documentation/images/dev-access-url.png)

<br>

Job name : `zap-scan`

```yml
runs-on: ubuntu-latest
    permissions: write-all
    # This job depends on the successful completion of the 'deploy' job before it can run.
    needs: deploy
    # Name of the job, indicating it's an OWASP ZAP Full Scan.
    name: OWASP ZAP Full Scan
    steps:
      - name: ZAP Scan
        uses: zaproxy/action-full-scan@v0.7.0
        with:
          # The 'target' parameter specifies the URL of the deployed application to be scanned.
          target: ${{ needs.deploy.outputs.access_url_output }}
```
DAST tools simulate real-world attacks on the application, uncovering vulnerabilities that may not be apparent in static analysis alone.
By incorporating DAST scans into the pipeline, you can continuously assess the security posture of the browser-based chat application in a production-like environment. 
This ongoing assessment helps to identify and remediate vulnerabilities before they are exploited by attackers.

We used OWASP ZAP which is a penetration testing tool that helps developers and security professionals detect and find vulnerabilities in web applications

OWASP scanning will only be performed by `zap-scan` after the resources have been successfully deployed by the `deploy` job.

![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/8ff7a79a-a60f-4c8a-a93b-049c1aba6adc)

<br>

## Step 2: Setting up `stage.yml` in .github/workflows directory
After successful OWASP scans and once the `dev` deployment is validated, proceed with creating a Pull Request to merge changes from the `dev` branch into the `stage` branch. However, before this merge, a `stage.yml` must be set up to automatically run the Staging workflow post-merge.
```yml
name: CICD for Group 2 Chat Application - Staging
run-name: ${{ github.actor }} is running CICD for Group 2 Chat Application - Staging
```

### The workflow will be triggered on push events to the "stage" branch, which will be done when a pull request is merged into the "stage" branch.
```yml
on:
  push:
    branches: [ stage ]
```

### Define permissions for this workflow, which can be added at either the job or workflow level.    
```yml  
permissions:
  id-token: write # This is required for requesting the JWT
  actions: read # Permission to read actions.
  contents: read # Permission to read contents.
``` 

### Below are the jobs defined in [stage.yml](./.github/workflows/stage.yml):

Job name : `pre-deploy`
```yml
jobs:
  # The pre-deploy job just prints the type of event and branch that triggered the workflow
  pre-deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "The job is automatically triggered by a ${{ github.event_name }} event on ${{ github.ref_name }} branch."
```

### Deploy to Staging Environment

```yml
deploy-to-stage:
    runs-on: ubuntu-latest
    needs: [ pre-deploy ]   # This job depends on the completion of the 'pre-deploy' job.
    name: Deploy to Staging Environment
    env:
      environment: ${{ github.ref_name }}  # Specify the environment to deploy
      port: 8000  # Specify the port to access the Staging environment application
    steps:

      # Checkout the latest code from the repository
      - name: Checkout repo code
        uses: actions/checkout@v3

      # Set up AWS credentials by using OIDC authentication which are stored in the Github Actions Secrets
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: ${{ secrets.STAGE_ROLE_TO_ASSUME }}
          aws-region: ap-southeast-1
      
      # Log in to Amazon ECR (Elastic Container Registry)
      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1
        with:
          mask-password: true

      # Retrieve the ECR URL from Terraform output
      - name: Get ECR URL from Terraform
        id: terraform-ecr # Define an id which allows other steps to reference outputs from this step.
        working-directory: ./modules/ecr  # Set the working directory for this step
        # Apply the Terraform configuration with the '-refresh-only' option to update the state file without making changes.
        # Fetch the 'repository_url' output from Terraform.
        # Store the resulting ECR URL as the output variable for later use or reference.
        run: |
          terraform init
          terraform plan
          terraform apply -auto-approve -refresh-only
          echo "ecr_url=$(terraform output -json | jq -r .repository_url.value)" >> $GITHUB_OUTPUT

      # Use Terraform to set up AWS ECS with Fargate
      - name: Create AWS ECS Fargate
        working-directory: ./environments/${{ env.environment }}
        id: terraform-ecs
        # Apply the Terraform configuration to provision or update the AWS ECS with Fargate resources.
        # 'image_name' is provided to customize the Terraform configuration.
        # Fetch the 'alb_hostname' and 'target_group_arn' outputs from Terraform.
        # Store the resulting access URL and target group ARN in output variables for later use or reference.
        run: |
          terraform init
          terraform apply -auto-approve \
          -var "image_name=${{ steps.terraform-ecr.outputs.ecr_url }}"
          terraform taint aws_ecs_service.service
          echo "access_url=$(terraform output -json | jq -r .alb_hostname.value)"
          echo "access_url=$(terraform output -json | jq -r .alb_hostname.value)" >> $GITHUB_OUTPUT
          echo "target_group_arn=$(terraform output -json | jq -r .target_group_arn.value)" >> $GITHUB_OUTPUT
      
      # This step continuously checks the health status of the ALB Target Group.
      # It ensures that the target group is in a 'healthy' state before proceeding.
      # This is crucial to ensure that the service is running and reachable before publishing the access URL.
      - name: Check ALB Target Group Health Status
        run: |
          target_group_arn=${{ steps.terraform-ecs.outputs.target_group_arn }}
          while true; do
            health_status=$(aws elbv2 describe-target-health \
            --target-group-arn $target_group_arn \
            --query "TargetHealthDescriptions[0].TargetHealth.State" --output text)
            if [[ "$health_status" == "healthy" ]]; then
                    echo "Targets are healthy!"
                    break
                else
                    echo "Current status of target: $health_status. Waiting..."
                    sleep 10  # Check every 30 seconds
                fi
          done
      
      # Display the access URL where the app can be accessed
      - name: Echo Access URL
        run: echo "The Access URL is http://${{ steps.terraform-ecs.outputs.access_url }}:${{ env.port }}"
```
Note: This Pull Request mandates approvals from a minimum of 2 reviewers, and all status checks must pass.
![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/60492027-097f-4681-a084-dcd1e0c01209)

![image](https://github.com/Dylon-Chan/group2-capstone-project/assets/127754707/e5855fe4-651e-4766-adf2-5e8c4b87209d)

<br>

The entire staging deployment workflow is shown below:
![stage-workflow](/documentation/images/stage-workflow.png)

On completing a successful deployment, delve into the Github Action workflow logs to obtain the application's access URL. This URL facilitates User Acceptance Testing (UAT) by either the in-house team or the customers.
![stage-access-url](/documentation/images/stage-access-url.png)

## Step 3: Setting up `prod.yml` in .github/workflows directory
Upon obtaining satisfactory UAT results, we are set to deploy the application in the Production environment. Before initiating a Pull Request to merge the `stage` branch into the `prod` branch, ensure the `prod.yml` file is in place to enable automated deployment.

```yml
name: CICD for Group 2 Chat Application - Production
run-name: ${{ github.actor }} is running CICD for Group 2 Chat Application - Production
```

### The workflow will be triggered on push events to the "prod" branch, which will be done when a pull request is merged into the "prod" branch.
```yml
on:
  push:
    branches: [ prod ]
```

### Define permissions for this workflow, which can be added at either the job or workflow level.    
```yml  
permissions:
  id-token: write # This is required for requesting the JWT.
  actions: read # Permission to read actions.
  contents: read # Permission to read contents.
``` 

### These are the jobs defined in [prod.yml](./.github/workflows/prod.yml):

Job name : `pre-deploy`

```yml
jobs:
  pre-deploy:
    runs-on: ubuntu-latest
    steps:
      - run: echo "The job is automatically triggered by a ${{ github.event_name }} event on ${{ github.ref_name }} branch."
```

### Production Environment Deployment

```yml
deploy-to-prod:
    runs-on: ubuntu-latest
    needs: [ pre-deploy ]   # This job depends on the completion of the 'pre-deploy' job.
    name: Deploy to Production
    env:
      environment: ${{ github.ref_name }}  # Specify the environment to deploy
    steps:

      # Checkout the latest code from the repository
      - name: Checkout repo code
        uses: actions/checkout@v3

      # Set up AWS credentials by using OIDC authentication which are stored in the Github Actions Secrets
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          role-to-assume: ${{ secrets.PROD_ROLE_TO_ASSUME }}
          aws-region: ap-southeast-1

      # Log in to Amazon ECR (Elastic Container Registry)
      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1
        with:
          mask-password: true
      
      # Retrieve the ECR URL from Terraform output
      - name: Get ECR URL from Terraform
        id: terraform-ecr # Define an id which allows other steps to reference outputs from this step.
        working-directory: ./modules/ecr  # Set the working directory for this step
        # Apply the Terraform configuration with the '-refresh-only' option to update the state file without making changes.
        # Fetch the 'repository_url' output from Terraform.
        # Store the resulting ECR URL as the output variable for later use or reference.
        run: |
          terraform init
          terraform plan
          terraform apply -auto-approve -refresh-only
          echo "ecr_url=$(terraform output -json | jq -r .repository_url.value)" >> $GITHUB_OUTPUT

      # Use Terraform to set up AWS ECS with Fargate
      - name: Create AWS ECS Fargate
        working-directory: ./environments/${{ env.environment }}
        id: terraform-ecs
        # Apply the Terraform configuration to provision or update the AWS ECS with Fargate resources.
        # 'image_name' is provided to customize the Terraform configuration.
        # Fetch the 'alb_hostname' and 'target_group_arn' outputs from Terraform.
        # Store the resulting access URL and target group ARN in output variables for later use or reference.
        run: |
          terraform init
          terraform apply -auto-approve \
          -var "image_name=${{ steps.terraform-ecr.outputs.ecr_url }}"
          terraform taint aws_ecs_service.service
          echo "target_group_arn=$(terraform output -json | jq -r .target_group_arn.value)" >> $GITHUB_OUTPUT
          echo "route53_record_name=$(terraform output -json | jq -r .route53_record_name.value)" >> $GITHUB_OUTPUT

      # This step continuously checks the health status of the ALB Target Group.
      # It ensures that the target group is in a 'healthy' state before proceeding.
      # This is crucial to ensure that the service is running and reachable before publishing the access URL.
      - name: Check ALB Target Group Health Status
        run: |
          target_group_arn=${{ steps.terraform-ecs.outputs.target_group_arn }}
          while true; do
            health_status=$(aws elbv2 describe-target-health \
            --target-group-arn $target_group_arn \
            --query "TargetHealthDescriptions[0].TargetHealth.State" --output text)
            if [[ "$health_status" == "healthy" ]]; then
                    echo "Targets are healthy!"
                    break
                else
                    echo "Current status of target: $health_status. Waiting..."
                    sleep 10  # Check every 30 seconds
                fi
          done
      
      # Display the Application URL
      - name: Echo Application URL
        run: echo "The Application URL is http://${{ steps.terraform-ecs.outputs.route53_record_name }}"
```
Please note: A Pull Request to prod requires approvals from at least 4 reviewers, with all status checks in the green pass.

![pullrequest-prod](/documentation/images/pullrequest-prod.png)

A visual representation of the entire Production deployment workflow can be seen below:

![prod-workflow](/documentation/images/prod-workflow.png)

With the deployment complete, the application is now associated with its domain name and can be accessed via http://securechat.club

![app-url](/documentation/images/app-url.png)

# ChatSecure Application 
## Scan the following QR code to try on our chat application.

<img width="400" alt="QR" src="https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/c2ed63a0-4482-4b74-9d0d-385f9eda7996">
<br>

## Login Page
<img src="/documentation/images/app-login-page.jpeg" width="350">

## Chat Page

<img width="350" alt="QR" src="https://github.com/Dylon-Chan/group2-capstone-project/assets/10412954/09e66dea-2dec-45a5-805a-a68344226bf1">

<br>

# Lesson Learned
1. Team collaboration is critical for the success of the project.
2. Repository name is case sensitive and Yaml’s syntax and spacing are important to get right.
3. Setting up automated testing is essential, and efforts should be made to automate processes wherever feasible.
4. Prioritizing security from the early stages of the development lifecycle is paramount.

# Future Enhancement
1. Exploring other security scanning systems such as SonarQube, JFrog, Synopsys, Checkmarx, etc. and evaluate the strengths of each tool.
2. Integrating Jira Service Management as a ticketing system with GitHub to report issues and follow up
3. Providing a higher level of security with HTTPS protocol and SSL certificates
4. Adding an additional layer of security by implementing WAF (Web Application Firewall)
5. As part of our continuous effort to improve the availability and resiliency of our application, we are planning to leverage auto scaling group

# Conclusion

Throughout this project, our team has successfully implemented a DevSecOps-centric CI/CD pipeline, ensuring a secure and efficient software development lifecycle. By leveraging cutting-edge tools such as Github Actions, Snyk and OWASP, combined with best-practice methodologies, we have created a robust system that integrates security at every stage of the development process. This ensures that vulnerabilities are identified and addressed early, reducing risks and streamlining deployment. We are proud of the strides we have made in promoting a security-first approach and are confident that our methods set a benchmark for DevSecOps excellence.