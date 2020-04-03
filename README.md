# docker-minimum

This is a minimum version of a remotely upgradable container through SSH.

## Usage
### Create a SSH key
Run:
```
ssh-keygen -f NAME_OF_KEY 
```

Choose passphrase empty, then:
```
cat NAME_OF_KEY.pub > authorized_keys
```

Which is going to copy the public key generated to the authorized_keys of the container to connect through SSH.

### Build and run the container
Run:
```
sh dbuild.sh
```

Which will create the container, accessible through SSH on the port 222.

### Access on localhost
Having the private key NAME_OF_KEY on the path that this command is going to be run:
```
ssh -i NAME_OF_KEY -p 222 root@localhost
```

### Deploy changes

Inside the deploy folder, there are 2 files:
* containers.txt: every line is the IP of the host that is running the container
* deploy.sh: script to deploy the changes

The package name has to be changed (along the rest of the necessary changes) inside this script to complete the communication remotely.

