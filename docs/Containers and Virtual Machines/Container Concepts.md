# Containerisation 

What is _containerisation?_ And what problem does it aim to solve?

__Container__ technology, as the name suggests, exists to solve the commonly encountered problems that arise from software applications having unmet dependencies when moved to new environments i.e the commonly encountered case of "but it works on my machine"

this problem would occur if say a paritcular software library like for example matplot.lib saw an update but that particular software developer's application was using an older/un-updated version of matplotlib and the updated version changed for example some functions' names. 

In this case, when the application would go to run in a new environment with updated libraries, it would not work correctly as it will be invoking the function by the old name.

Containerisation aims to solve this problem by packaging an application with all of its dependencies so that it is in effect machine-agnostic - that is to say - the application and all of its dependencies are transported within a 'container' in between environments 

in this example that would mean the developer's application along with the version of matplotlib that it uses are packaged within a _container_ so that the application can run in any environment i.e it is a containerised application

Container
 : here is the commonly touted definition of a container 