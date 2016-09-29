# PATH setup
export PATH=/usr/local/bin:${PATH}
export PATH=${PATH}:/usr/local/sbin
export PATH=${HOME}/bin:${PATH}
export PATH=${HOME}/.composer/vendor/bin:${PATH}
#export PATH=${HOME}/.npm/bin:${PATH}
export PATH=${HOME}/dotfiles/bin:${PATH}
if [[ $OSTYPE == *darwin* ]]; then
  export PATH=${HOME}/dotfiles/bin/osx:${PATH}
  export PATH=${HOME}/dotfiles_local/bin/osx:${PATH}
elif [[ $OSTYPE == *linux* ]]; then
  export PATH=${HOME}/dotfiles/bin/linux:${PATH}
  export PATH=${HOME}/dotfiles_local/bin/linux:${PATH}
fi
export PATH=${HOME}/dotfiles_local/bin:${PATH}

# if [[ $OSTYPE == *darwin* ]]; then
#   export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem
# fi

#Create files as read-write by group and read-only world.
umask 002

#Keep this last so it can override general settings!
if [ -f $HOME/dotfiles_local/profile ]; then
  . $HOME/dotfiles_local/profile
fi
