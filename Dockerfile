# Archlinux with firefox

FROM archlinux/base

# Whilst base pulls in quite a bit, most pkgs assume base is present without
# explicitly specifying so its better to have it there
RUN pacman -Syu --noconfirm  && pacman -S --noconfirm base

RUN pacman -S --noconfirm firefox

# Setup a firefox profile that will allow us to disable the first start privacy
# notice
RUN mkdir /firefox_profile
RUN echo 'user_pref("datareporting.policy.firstRunURL", "");' > /firefox_profile/prefs.js

ENTRYPOINT ["firefox", "--profile", "/firefox_profile"]
