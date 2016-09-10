# vagrant-goaccess-awscf
Vagrant box for parsing and analysing AWS CloudFront logs using GoAccess

## Dependencies

- [Vagrant](https://www.vagrantup.com)
- [Virtualbox](https://www.virtualbox.org)

## How-To

**Clone this repo**
```cmd
git clone https://github.com/fredbourni/vagrant-goaccess-awscf.git
```

**Start the VM**
```cmd
cd vagrant-goaccess-awscf
vagrant up
```

**Connect to the VM**

- Use [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) or any other SSH client using `127.0.0.1` port `2222` using `vagrant` as username and password.

**Fetch your log files from Amazon S3**

```bash
# Configure the AWS Command Line Interface with your API credential
aws configure
# Let's switch to the pre-shared vagrant folder
cd /vagrant
# Be clean and create a 'logs' folder
mkdir logs
cd logs
# Sync the log files in that directory
aws s3 sync s3://bucket-having-cloudfront-logs/ ./
```

**Generate your first report**

```bash
zcat /vagrant/logs/yoursite-prefix.com/*.gz | goaccess -o /usr/share/nginx/html/index.html
```

This will create an HTML report available at: [http://127.0.0.1/](http://127.0.0.1/)

## GoAccess configuration

- The default configuration is being patch by [goaccess/cloudfront.diff](goaccess/cloudfront.diff)
- To tweak the configuration at your taste, please edit: /usr/local/etc/goaccess.conf

## Documentation

- [GoAccess](https://goaccess.io/man)
- [Vagrant](https://www.vagrantup.com/docs/)
- [AWS CLI Command reference for S3](http://docs.aws.amazon.com/cli/latest/reference/s3/index.html)
