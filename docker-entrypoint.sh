#!/bin/bash


setup_service_user() {
    wanted_user_uid="$1"
    default_name="$2"
    
    # form : <uid:[gid]>
    [ -n "$wanted_user_uid" ] && echo "$wanted_user_uid" | grep -q ':' && {
        user_gid="$(echo $wanted_user_uid | cut -d: -f2)"
        user_uid="$(echo $wanted_user_uid | cut -d: -f1)"
    } || user_uid=$wanted_user_uid
    

    [[ $user_uid =~ ^[0-9]+$ ]] || return
    if [ -n "$user_gid" ]; then
       [[ $user_gid =~ ^[0-9]+$ ]] || return
    fi
    
    mkdir -p /home/${default_name}
    chown -R ${default_name}:${default_name} /home/${default_name}
    
    if [ -z "$user_gid" ]; then
      # create a user with a default name as name
      useradd -M -d /home/${default_name} -o -s /bin/bash -U -u $user_uid ${default_name}
    else
      # create a group with a default name as name
      groupadd -f -g $user_gid ${default_name}
      useradd -M -d /home/${default_name} -o -s /bin/bash -N -g $user_gid -u $user_uid ${default_name}
    fi
}




if [ "$1" = "supervisord" ]; then
  . activate ${CONDA_ENV}
  setup_service_user "${SERVICE_USER_UID}" "${SERVICE_NAME}" 
  # supervisor user
  export SERVICE_USER="${SERVICE_NAME}"
  export SERVICE_NAME="${SERVICE_NAME}"
  export PATH="${PATH}"
fi

exec "$@"
