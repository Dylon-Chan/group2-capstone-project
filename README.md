# group2-capstone-project

## Scan docker image for vulnerability using Snyk
Now, let’s add the Docker image scan job:

&& Sample of the command (*to be change)
    jobs:
      test:
        ...

      build_image:
        ...

      scan_docker_image:
        permissions:
          id-token: read
          contents: read
          packages: read
        runs-on: ubuntu-latest
        needs: [ build_image ]
        steps:
          - name: Checkout 🛎️
            uses: actions/checkout@v2

          - name: Log in to the Container registry 📦
            uses: docker/login-action@v2
            with:
              registry: ${{ env.GITHUB_REGISTRY }}
              username: ${{ github.actor }}
              password: ${{ secrets.GITHUB_TOKEN }}

          - name: Scan Docker image 🐳
            uses: snyk/actions/docker@master
            continue-on-error: true
            with:
              image: ${{ env.GITHUB_REGISTRY }}/${{ env.GITHUB_REPOSITORY }}:${{ env.DOCKER_IMAGE_TAG }}
              args: --file=Dockerfile --severity-threshold=high --sarif-file-output=snyk.sarif
            env:
              SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}

          - name: Upload Snyk report as sarif 📦
            uses: github/codeql-action/upload-sarif@v2
            with:
              sarif_file: snyk.sarif

This step uses Snyk, the security scanning engine behind `docker scan`. To use it, you need to create a free account and store its token in a secret:

Checkout 🛎️: The scanner performs better if it has access to the Dockerfile as well.

Log in to the Container registry 📦: To get the Docker images we pushed there earlier.

Scan Docker image 🐳: This job scans the Docker image and reports the vulnerabilities in a file called `snyk.sarif`. This file format is recognized by GitHub and can be shown in the PR — which is why we have the next step

Upload Snyk report as sarif 📦: Here we upload the `sarif` file we generated in the previous step and upload it to GitHub

&& Sample of Vulnerabilities file

To sum up, it will check for security issues, and upload the vulnerability report so that GitHub would understand and display them in the PRs.