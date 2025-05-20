FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y language-pack-en-base && \
    export LC_ALL=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    apt-get install -y software-properties-common python-software-properties && add-apt-repository ppa:ondrej/php && apt-get update && \
    apt-get install -y software-properties-common wget git curl && \
    curl -sL https://deb.nodesource.com/setup_23.x | bash - && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated graphviz phpunit nodejs \
        php8.2-cli php8.2-dev php8.2-curl php8.2-gd php8.2-gmp php8.2-json php8.2-ldap php8.2-mysql php8.2-odbc php8.2-pgsql php8.2-pspell php8.2-readline php8.2-recode php8.2-sqlite3 php8.2-tidy php8.2-xml php8.2-xmlrpc php8.2-bcmath php8.2-bz2 php8.2-enchant php8.2-imap php8.2-interbase php8.2-intl php8.2-mbstring php8.2-mcrypt php8.2-soap php8.2-sybase php8.2-xsl php8.2-zip php-memcache php-memcached php-pear \
        openjdk-8-jre libxext-dev libxrender-dev libxtst-dev && \
    pecl install xdebug && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN mkdir /opt/phpstorm \
    && wget -O - https://download.jetbrains.com/webide/PhpStorm-2020.2.tar.gz | tar xzf - --strip-components=1 -C "/opt/phpstorm"

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin
RUN phpenmod curl gd gmp json ldap mysql odbc pgsql pspell readline recode snmp sqlite3 tidy xml xmlrpc bcmath bz2 enchant imap interbase intl mbstring mcrypt soap sybase xsl zip xdebug memcache memcached

RUN useradd -m -s /bin/bash developer \
    && mkdir /home/developer/.PhpStorm2020.2 \
    && touch /home/developer/.PhpStorm2020.2/.keep \
    && chown -R developer:developer /home/developer \
    && usermod -d /home/developer developer

USER developer
CMD pwd && cd ~ && pwd && ls -al && /opt/phpstorm/bin/phpstorm.sh
