# lockdata  
Two simple scripts to protect data (files or folders) from accidental operations.  
`lockdata` sets permissions to 550 (no write permissions for anybody, no permissions at all for "others") and adds the 'i' (immutable) attribute.  
`unlockdata` sets permissions to 770 (adds write permission for owner/group) and removes the 'i' (immutable) attribute.  


## Installation and usage  

1. Save the script to a directory of your choosing, e.g. `/opt/custom_scripts`
2. If necessary, create shortcuts in a PATH directory (e.g. in `/usr/bin`):
```  
sudo ln -s /opt/custom_scripts/lockdata.sh lockdata  
sudo ln -s /opt/custom_scripts/unlockdata.sh unlockdata  
```  
3. You can now use the scripts with, e.g. `lockdata ~/mydata`.
