# MQTT behind Traefik
To secure your MQTT broker with TLS, you can place it behind a Traefik reverse proxy. This setup allows Traefik to manage TLS termination.

Since it is TCP then use IngressRouteTCP to handle the connection.

## Traefik
Need to enable/expose MQTT ports i.e. configure Traefik helm values to expose port 8883 and also redirect unsecure 1883 to secure 8883 port.   

      mqtt:
        port: 1883
        protocol: TCP
        redirectTo:
          port: mqttsecure
      mqttsecure:
        port: 8883
        protocol: TCP
        expose:
          default: true
        exposedPort: 8883
        tls:
          enabled: true

## Set up a password
```bash
# Ignore initial password files i.e. mosquitto_passwd_file and mqtt.secret.yaml
echo mosquitto_passwd_file >> .gitignore
echo mqtt.secret.yaml >> .gitignore

# First create password acc. to mosquitto rules. (mosquitto_passwd is included in mosquitto broker package)
mosquitto_passwd -c mosquitto_passwd_file USERNAME

# Base64 encode password
base64 mosquitto_passwd_file 

# Create secret file and add enccoded password
cat mqtt.secret.yaml

data:
  mosquitto_passwd_file: |
    fjdJfdhjdhf

# Do the usual sops encoding
task utils:encode
```