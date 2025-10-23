FROM node:24-bookworm-slim

ARG UID
ARG GID
ARG USERNAME
ARG HOME_DIR

RUN npm install -g @google/gemini-cli

RUN if getent group $GID >/dev/null 2>&1; then \
        # 既存のグループが存在する場合
        if getent passwd $UID >/dev/null 2>&1; then \
            # 既存のUIDが存在する場合、そのユーザーを再利用
            EXISTING_USER=$(getent passwd $UID | cut -d: -f1); \
            usermod -l $USERNAME $EXISTING_USER && \
            usermod -d $HOME_DIR -m $USERNAME && \
            usermod -a -G $(getent group $GID | cut -d: -f1) $USERNAME; \
        else \
            # 既存のUIDが存在しない場合、新しいユーザーを作成
            useradd -m --uid $UID -g $GID --groups sudo $USERNAME -s /usr/bin/bash; \
        fi; \
    else \
        # 既存のグループが存在しない場合
        if getent passwd $UID >/dev/null 2>&1; then \
            # 既存のUIDが存在する場合、そのユーザーを再利用
            EXISTING_USER=$(getent passwd $UID | cut -d: -f1); \
            usermod -l $USERNAME $EXISTING_USER && \
            usermod -d $HOME_DIR -m $USERNAME; \
            groupadd -g $GID $USERNAME && \
            usermod -g $USERNAME $USERNAME; \
        else \
            # 既存のUIDが存在しない場合、新しいグループとユーザーを作成
            groupadd -g $GID $USERNAME && \
            useradd -m --uid $UID -g $GID --groups sudo $USERNAME -s /usr/bin/bash; \
        fi; \
    fi && \
    echo $USERNAME:$USERNAME | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    usermod --shell /bin/bash $USERNAME

USER $USERNAME
WORKDIR $HOME_DIR
