# course_management_system
Team project for the course CS 5200 taught by Prof. Nate Derbinsky during the term of Fall 2017.


---
## Jenkins Information
Please note that Jenkins is not a centrally-run service. You can run it on your system, or we can probably add it to a Heroku system if we need it to do something that we can all access.





### How to configure Jenkins CI on your computer
1. Install Jenkins (https://jenkins.io/download/ - follow the usual installation instructions).
2. If you are not namratab94, then fork a copy of her course_management_system repository.
2. Open localhost:8080 in a browser.
3. Click New Item.
4. Configure this new item with this information:
  * Select Multibranch Pipeline
  * Name it "courseManagementCI"
  * Set up the repository access:
    * Under "Branch Sources", select Github source. 
    * Provide your Github Credentials or generate an SSH key. Keep in mind that Jenkins is running on your computer. 
    * Specify namratab94 or the username of whoever owns the course_management repository. You should have already forked her repository, because Jenkins's Github plugin doesn't know who's private repositories you have access to, but it will be able to access any of your repositories.
    * Accept the pipeline.
5. You should notice that Jenkins immediately scans the repository for branches that contain a Jenkinsfile. Jenkins ignores branches without Jenkinsfile, but I've just added a branch with a Jenkinsfile. Note that the Jenkinsfile is how you tell Jenkins what to do with your repo. It should find this branch.

### How to Run Jenkins CI on your computer
1. After following the previous steps, you should have a Multibranch Pipeline configured.
2. Just in case, click "Scan Multibranch Pipeline" on the left sidebar to ensure that Jenkins knows about all of the branches.
3. Click on the link in the main area of your screen for "feature\jenkins-integration", or more branches. These are branches that have Jenkinsfiles. Clicking that will take you to the menu for that branch.
4. Click Build Now on the left sidebar. This will tell Jenkins to run whatever Jenkinsfile is in this branch.
5. You should see a new build (each are numbered 1,2,3, etc). From here you can look at the logs and see what Jenkins did. 



