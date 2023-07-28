# Lancer

Ne pas oublier de lancer minikube si on l'utilise

```bash
docker compose build
kubectl apply -f kubernetes.yml
```

# Ajouter le nom de domaine au hosts

## Windows

Ouvrir un powershell en mode admin

```sh
notepad C:\Windows\System32\drivers\etc\hosts
```

AJouter à la fin 

```txt
127.0.0.1 web1.tp-rendu.test
127.0.0.1 web2.tp-rendu.test
````

## Linux

```bash
minikube ip
```

Ouvrir /etc/hosts et ajouter l'ip

```bash
sudo nano /etc/hosts
```

```txt
ip_minikube web1.tp-rendu.test
ip_minikube web2.tp-rendu.test
```