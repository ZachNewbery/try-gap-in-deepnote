- Latest official GAP release (GAP 4.11.1) [<img src="https://deepnote.com/buttons/launch-in-deepnote-white-small.svg">](https://deepnote.com/launch?url=https%3A%2F%2Fgithub.com%2FZachNewbery%2Ftry-gap-in-deepnote)
# Trying GAP using Deepnote
This repository attempts to integrate the GAP kernel with Deepnote as a Jupyter Notebook. It does not require a local GAP installation, and can be accessed through the browser. To start a new GAP session, do the following:
- Click on the "Launch Deepnote" badge at the top of this read-me, which will take you to a new project setup for you in Deepnote.
- Since Deepnote defaults to a Python kernel for new projects, you will need to click the "Environment" tab on the left-hand side, and then click the drop-down menu under the "Environment" heading, and select the option "Local ./Dockerfile".
- After a few moments, the Dockerfile will open up in the editor on the right-hand side. You may come across an error saying "This project is not currently using an environment defined by this Dockerfile". If that is the case, simply click the "Build" button on the top right, until the Dockerfile is built (or it uses a cached environment from a previous build). You may be prompted to restart the hardware, which can be done by clicking the link in the error message.
- Finally, under the "Initialization" heading on the left panel, open "init.ipynb" by clicking on it.
- Copy the contents of `init.ipynb` in the repository into the editor panel, and click the "Run Notebook" button on the top right to finalize the environment changes. If you cannot see the `init.ipynb` notebook in the repository for any reason, you just need to append the following two lines to the Deepnote initialization script:
        sudo ln -f $GAP_HOME/bin/gap.sh /usr/bin/gap
        sudo ln -f $GAP_HOME/pkg/JupyterKernel/bin/jupyter-kernel-gap /usr/bin/jupyter-kernel-gap

To test the GAP kernel, simply create a new notebook in Deepnote by clicking on the "Notebooks & Files" tab on the left toolbar, and then the "+" button at the top right of the opened panel. Now, GAP commands can be directly written into the cells in the newly created notebook.

For further information about Jupyter, see https://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/index.html.
