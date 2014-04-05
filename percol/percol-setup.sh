echo "\nstart percol-setup.py\n"

if [ -e $HOME/.percol.d ]; then
 echo "\nalread installed. only update rc.py...\n"

 cp /guest_share/rc.py $HOME/.percol.d/

else
 echo "\ninstalling...\n"
 git clone git://github.com/mooz/percol.git
 cd percol
 sudo python setup.py install

 mkdir $HOME/.percol.d
 cd ..

 cp /guest_share/rc.py $HOME/.percol.d/

 sudo rm -rf percol

fi

echo "\nall tasks finished.\n"
