I.Ref
	- https://www.vagrantup.com/docs/vagrant-cloud/boxes/create.html
	- https://www.engineyard.com/blog/building-a-vagrant-box

II. Create a box
	- Got to vagrant folder and run : vagrant package --base vagrant_default_1531275475169_20563
	=> this name into virtualbox machine (ex: vagrant_default_1531275475169_20563)
	=> We will be create a .box file. We use .box file to update for (III)
III. Implement
	1. Go to the Create Box page.

	2. Name the box and give it a simple description

	3. Create your first version for the box. This version must match the format [0-9].[0-9].[0-9]

	4. Create a provider for the box, matching the provider you need locally in Vagrant. virtualbox is the most common provider.

	5. Upload the .box file for each provider, or use a url to the .box file that is publicly accessible