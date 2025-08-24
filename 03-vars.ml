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