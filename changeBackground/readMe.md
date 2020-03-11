# 自动换Linux壁纸锁屏/change Linux background and Screensaver

## Method nowadays

1. Add your picture path to `changeBackground.bash`, that is:

   ```bash
   picPath = $yourPicturePath
   ```

   

2. Modify your crontab:

```bash
crontab -e
0 */12 * * * $changeBackgroundPath/changeBackground.bash
```



## Method before(Not useful in Ubuntu 19)

1. You have to enable rc.local service ( if you are or are under ubuntu 14 skip this step )

   - enter following command

   ` sudo vi /etc/systemd/system/rc-local.service`

   - copy and paste following content

     `

     ```bash
     [Unit]
     Description=/etc/rc.local Compatibility
     ConditionPathExists=/etc/rc.local
     [Service]
     Type=forking
     ExecStart=/etc/rc.local start
     TimeoutSec=0
     StandardOutput=tty
     RemainAfterExit=yes
     SysVStartPriority=99
     [Install]
     WantedBy=multi-user.target
     ```

   - make a rc.local

     ` sudo vim /etc/rc.local`

   - copy and paste

     ```bash
     #!/bin/sh -e
     #
     # rc.local
     #
     # This script is executed at the end of each multiuser runlevel.
     # Make sure that the script will "exit 0" on success or any other
     # value on error.
     #
     # In order to enable or disable this script just change the execution
     # bits.
     #
     # By default this script does nothing.
     exit 0
     ```

   - chmod

     `sudo chmod +x /etc/rc.local`

   - start the service

     ```bash
     sudo systemctl enable rc-local
     sudo systemctl start rc-local.service
     sudo systemctl status rc-local.service
     ```

2. add `bash $yourPath/changeBackground.bash` to your /etc/rc.local;

3. modify changeBackground.bash as the annotation says;

4. reboot and check.
