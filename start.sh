#( ( rake db:migrate && \
#    echo " - - - \n Migration \n - - -" ) \
#|| ( rake db:setup && \
#    echo " - - - \n Setup \n - - -" ) ) && \
rake db:migrate && rake db:seed
rails server -b 0.0.0.0
