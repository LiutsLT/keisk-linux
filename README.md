# keisk-linux

OpenClaw auth/model profilių valdymo skriptas Linux sistemoms.

## Diegimas (Linux)

## Vienos komandos diegimas

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/LiutsLT/keisk-linux/main/install.sh)
```


### 1-komanda (public repo)
```bash
mkdir -p ~/.local/bin && curl -fsSL https://raw.githubusercontent.com/LiutsLT/keisk-linux/main/keisk-linux -o ~/.local/bin/keisk && chmod +x ~/.local/bin/keisk && echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && export PATH="$HOME/.local/bin:$PATH"
```

### Patikra
```bash
keisk
```

## Pirmas paleidimas (be profilių)
```bash
openclaw models auth add
keisk
```

## Naudojimas
```bash
keisk
keisk
keisk use <profileId>
keisk auto
keisk auto openrouter/moonshotai/kimi-k2
```

## Pastabos
- `Add/Edit` OAuth veikia tik interaktyviame TTY terminale.
- Jei kvota nerodoma konkrečiam profiliui, gali būti `n/a` (providerio ribojimas).
