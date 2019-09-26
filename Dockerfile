# Archlinux with firefox

FROM archlinux/base

# Whilst base pulls in quite a bit, most pkgs assume base is present without
# explicitly specifying so its better to have it there
RUN pacman -Syu --noconfirm  && pacman -S --noconfirm base

RUN pacman -S --noconfirm firefox

ENTRYPOINT ["firefox"]
