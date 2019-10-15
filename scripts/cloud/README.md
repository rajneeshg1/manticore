# Provision Manticore in a Cloud

** All code here is still very experimental **

Make running temporary manticore jobs in a cloud easy!

These scripts use Terraform to create a cloud computing instance and installs manticore there.

They are based on Trail of Bits' [algo-ng project](https://github.com/trailofbits/algo-ng).

## Usage

To create an instance:
```
cloudify apply
```

To delete an instance:
```
cloudify destroy
```

## TODO

* Support more than DigitalOcean
* Select instance sizes
* Install Jupyter notebooks ?
* Provide a way to automatically start Manticore with a specific work item ?
* Slack notificaion of results ?
