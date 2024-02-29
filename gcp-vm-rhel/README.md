# RHEL VM

## Creating a FIPS VM

There are multiple ways to do this, but basically variable `is-fips` needs to be set to `true`. Upon doing so,
the VM will be created and have `fips-mode-setup --enable` run on it, followed by a reboot.

See [RHEL Docs](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/security_hardening/using-the-system-wide-cryptographic-policies_security-hardening#switching-the-system-to-fips-mode_using-the-system-wide-cryptographic-policies) for more information.

Example:

```bash
terraform plan --var 'is-fips=true'
terraform apply --var 'is-fips=true'
```

Or you can set the variable in the `terraform.tfvars` file.

```bash
cat <<EOF > terraform.tfvars
is-fips = true
EOF
terraform plan
terraform apply
```
