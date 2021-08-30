- Latest official GAP release (GAP 4.11.1) [<img src="https://deepnote.com/buttons/launch-in-deepnote-white-small.svg">](https://deepnote.com/project/GAP-Kernel-6I_gbA2oTJeS-h3UCNbvRQ)
# Deepnote
[Deepnote](https://deepnote.com/) is a web-based data science notebook that is Jupyter-compatible. It allows for real-time collaboration helping to bring teams and projects together. No installation is required, and can be used on any OS that has a browser. All notebooks on Deepnote are run on machines in the cloud, which can be customised to the needs of each project (with some features gated behind a subscription). To find out more, access the [docs](https://docs.deepnote.com).

# GAP in Deepnote
This repository attempts to integrate the GAP kernel with Deepnote as a Jupyter Notebook. It does not require a local GAP installation, and can be accessed through the browser. To start a new GAP session, do the following:
1. Click on the "Launch Deepnote" badge at the top of this read-me, which will take you to a new project setup for you in Deepnote.
2. Since Deepnote defaults to a Python kernel for new projects, you will need to click the "Environment" tab on the left-hand side, and then click the drop-down menu under the "Environment" heading, and select the option "Local ./Dockerfile".
3. After a few moments, the Dockerfile will open up in the editor on the right-hand side. You may come across an error saying "This project is not currently using an environment defined by this Dockerfile". If that is the case, simply click the "Build" button on the top right, until the Dockerfile is built (or it uses a cached environment from a previous build). You may be prompted to restart the hardware, which can be done by clicking the link in the error message.
4. Further, you may encounter a "Build timeout" error. This can be solved by simply building the Dockerfile again.

To test the GAP kernel, simply create a new notebook in Deepnote by clicking on the "Notebooks & Files" tab on the left toolbar, and then the "+" button at the top right of the opened panel. Now, GAP commands can be directly written into the cells in the newly created notebook.

For further information about Jupyter, see https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/index.html.

# Setting up your own GAP+Deepnote Project
To get started with your own GAP projects in Deepnote, setup is rather simple:
1. After creating a Deepnote account, create a new project from the dashboard, by clicking the blue "New Project" button.
2. Clone this repository to get access to the Dockerfile. This can be done by opening a terminal (once the hardware has started up) via the "Terminal" option in the sidebar, clicking the "+" button, and running:

        git clone https://github.com/ZachNewbery/try-gap-in-deepnote.git

3. Then, copy out the Dockerfile so that it is at the root working directory of your project:

        cp try-gap-in-deepnote/Dockerfile ./Dockerfile
      
4. Follow steps 2-4 of [GAP in Deepnote](#gap-in-deepnote) to configure the project environment for usage.
5. Now, Deepnote can be used with the GAP kernel for your own project. Feel free to delete the `try-gap-in-deepnote` folder in your project's workspace as it is no longer required.

# Limitations
Due to the max 5GB Docker image size limit imposed by Deepnote, the provided Docker image only compiles a select number of GAP packages which are required by the JupyterKernel package. These packages are `io`,`crypting`, `json` & `ZeroMQInterface`. In order to install any other packages, you will need to do so manually. This can be done from the GAP installation directory:

    cd /usr/lib/gap-4.11.1
    
And then running the installation commands as you would on a normal GAP installation. It is likely also possibly to run the `BuildPackages.sh` script to compile all the GAP packages, but this will take an incredibly long time and may lead to a reduced efficiency for your Deepnote notebooks.
