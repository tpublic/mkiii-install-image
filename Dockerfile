FROM docker.bluelight.limited/feingkai/mkiii-clone-image:latest

# ENV RUBY_VER=2.5.3
ENV RUBY_VER=2.6.3

WORKDIR /home/app/microkube/

# # # 
USER root
RUN echo "Setting default ruby ver" && \
        . /etc/rvmrc && \
        export PATH="$PATH:/usr/local/rvm/bin/" && \
        export PATH="/usr/local/rvm/rubies/ruby-$RUBY_VER/bin:$PATH" && \
        /bin/bash --login -c "rvm use --default ruby-$RUBY_VER && \
        echo 'Calling bundle' && \
        bundle install --jobs=$(nproc) --deployment && \
        chown -R app.app /home/"



#CMD ["/bin/bash", "-c", "top"]