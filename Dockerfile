# Archlinux with firefox

FROM archlinux/base

# Whilst base pulls in quite a bit, most pkgs assume base is present without
# explicitly specifying so its better to have it there
RUN pacman -Syu --noconfirm  && pacman -S --noconfirm base

RUN pacman -S --noconfirm firefox

# Setup a firefox profile that will allow us to disable all the first start privacy
# notices and password saving etc
RUN mkdir /firefox_profile
RUN echo 'user_pref("datareporting.policy.firstRunURL", "");' > /firefox_profile/prefs.js

RUN echo 'user_pref("signon.prefillForms", false);' >> /firefox_profile/prefs.js
RUN echo 'user_pref("signon.rememberSignons", false);' >> /firefox_profile/prefs.js

RUN echo 'user_pref("datareporting.healthreport.uploadEnabled", false);' >> /firefox_profile/prefs.js
RUN echo 'user_pref("datareporting.policy.dataSubmissionEnabled", false);' >> /firefox_profile/prefs.js
RUN echo 'user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);' >> /firefox_profile/prefs.js

ENTRYPOINT ["firefox", "--profile", "/firefox_profile"]
