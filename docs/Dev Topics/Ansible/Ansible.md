# Ansible

## Overview

by `RedHat`.

Infrastrcutre-As-Code (IaC) tool.

- Tool used to manage IT Tasks.

Ansible is an open-source software tool that can be used to automate and manage various IT tasks, including software deployment, configuration management, and task automation. It uses a simple, human-readable language called YAML to describe automation jobs, and uses SSH to execute commands on remote servers. Ansible can be used to manage a wide range of systems, including servers, network devices, and cloud environments.

## Why use Ansible?

Use ansible in 4 different ways:

1. Execute tasks from your own machine.
2. COnfigure/Install/Deployment steps in a single YAML File.
3. Re-use same file multiple times and for different environments.
4. More reliable and less likely for errors.

`Ansible is agentless`:

- It just needs to `SSH` into the servers.

## Ansible Architecture

### Ansible Modules

- Modules get pushed onto the servers where they do their task. Once task is completed they get destroyed.
- Modules are very granular. They each perform one small specific task.

### Ansible uses YAML

Ansible Example:

``` yaml title="Jenkins Module | jekins_job"
# Create a jenkins job using basic authentication
- jenkins_job:
    config: "{{ lookup('file', 'templates/test.xml')}}"
    name: test
    url: http://localhost:8080
    user: admin
    password: admin

# Delete a jenkins job using the token
- jenkins_job:
    name: test
    token: asdasdasdasd
    state: absent
    url: http://localhost:8080
    user: admin
```

### Ansible Playbooks

Play book describes:

- `how` and in `which order`
- at what `time` and `where` (on which machines)
- `what` (the modules) should be executed

`Orchestrates the module execution`

> ORDER: `Playbook` > `Plays` > `Tasks` > `Modules`

## Ansible for Docker

Usually you use docker files...



## Competitors

- Puppet and Chef.
  - This uses Ruby... which is difficult to learn.
  - Requires agent on target systems.

## References

- [Ansible](https://www.ansible.com/)
- [What is Ansible by "TechWorld with Nana](https://www.youtube.com/watch?v=1id6ERvfozo)
