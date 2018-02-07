# Deploy to Azure


This Azure deployment demonstrates capabilities of Azure N-Series VMs.
During the deployment, the following actions will take place:

 - Install Blender ([https://www.blender.org](https://www.blender.org))
 - Donload Blender sample file to this directory: /opt/blender/...
 - Install GPU drivers
Note: Ubuntu Data Science VM Image is used for the deployment.

Log files for the post deployment installations could be found here: /var/lib/waagent/custom-script .
After deployment completes:

 - RDP to the VM using public IP address which is available via Azure Portal ([https://portal.azure.com](https://portal.azure.com/#)) . Use login and password you entered during the deployment process.
 - Open in a File Manager  the folder: /opt/blender-example/
 - Open the example file: bmw27_gpu.blen
 - Click  "render" button on the right side 

The image will start to render using GPU. 

Troubleshooting:
Make sure that **CUDA** is selected as **Compute Device** under **System Settings** within **User Preferences**.



[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://deploy.azure.com/?repository=https://github.com/huzferd/deploy-to-azure)

<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/huzferd/deploy-to-azure/master/azuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>
