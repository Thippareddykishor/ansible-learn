- name: Play variables
  hosts: localhost
  connection: local
  vars:
    URL: play.google.com
  tasks:
    - name: print URL
      ansible.builtin.debug: 
        msg: "{{ URL }}"

- name: Task variables
  hosts: localhost
  connection: local
  tasks: 
    - name: Print URL 
      vars: 
        URL: task.google.com
      ansible.builtin.debug:
         msg: "{{ URL }}"

- name: Role variables
  hosts: localhost
  connection: local
  roles:
    - demo

#variables are 3 types
#1.normal variables 2. list and 3.map
#1.normal
#vars:
# URL: example.com

#2.list
#vars:
#URLs:
# - app1
# - app2
#{{ URLs[0] }}

#3.map
#vars
# URLs:
#   app1: app1.example.com
#   app2: app2.example.com
## {{ URLs.app1 }}

#variables also have data types
#1.string
#2.number
#3.boolean (true/false, yes/no)


- name: print fact
  hosts: localhost
  connection: local
  tasks:
    - name: print a fact
      ansible.builtin.debug:
        msg: " {{ ansible_distribution }} "
  
- name: variables from task output
  hosts: localhost
  connection: local
  tasks:
    - name: Run uptime command
      ansible.builtin.shell: uptime
      register: out
    - name: print a fact
      ansible.builtin.debug:
        msg: "{{  out }}"