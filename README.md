# jetbrains-license-2020-2.0
JetBrains trial restart 2020.2 (Windows) and 2020.1 (MacOs, Linux). Products: IntelliJIdea, PhpStorm, PyCharm, WebStorm, GoLand, CLion, DataGrip, RubyMine, AppCode, Rider.
### Rights disclaimer: this isn't a hacking, we're only modifying our OS files!
#### Fork this repo plz, it may be deleted due to DMCA like v1.0 repo.
## Contains:
#### 2020.2 Windows .bat script by Greg Sparrow

#### 2020.2 Windows .cmd script by raynoxfr (IntelliJ path example, change for your IDE)

#### 2020.2 Windows manual instructions

#### 2020.1 MacOS, Linux legendary scripts by pengzhile

##### Webarchives: https://pastebin.com/N3hT2jP8

## Good bye! <3

```sh
sudo tar xzf PhpStorm-2020.2.tar.gz --strip-components=1 -C "/opt/phpstorm"
/opt/phpstorm/bin/phpstorm.sh
chmod +x mac_linux_pengzhile.sh

mkdir /opt/phpstorm \
    && wget -O - https://download.jetbrains.com/webide/PhpStorm-2020.2.tar.gz | tar xzf - --strip-components=1 -C "/opt/phpstorm"

useradd -m -s /bin/bash renato \
    && mkdir /home/renato/.PhpStorm2020.2 \
    && touch /home/renato/.PhpStorm2020.2/.keep \
    && chown -R renato:renato /home/renato \
    && usermod -d /home/renato renato
```
