#!/usr/bin/env bash
# guessinggame.sh - Jeu de devinette sur le nombre de fichiers

function compter_fichiers {
    local count=$(ls -1 | wc -l)
    echo "$count"
}

function afficher_bienvenue {
    echo "=========================================="
    echo " Bienvenue dans le jeu de devinette !"
    echo " Devinez combien de fichiers contient"
    echo " le répertoire actuel."
    echo "=========================================="
}

function verifier_reponse {
    local reponse=$1
    local bon_nombre=$2

    if [[ $reponse -eq $bon_nombre ]]; then
        echo "🎉 Félicitations ! Vous avez trouvé le bon nombre : $bon_nombre"
        return 0
    elif [[ $reponse -gt $bon_nombre ]]; then
        echo "📉 Trop haut ! Essayez encore."
        return 1
    else
        echo "📈 Trop bas ! Essayez encore."
        return 1
    fi
}

afficher_bienvenue
bon_nombre=$(compter_fichiers)

while true; do
    echo ""
    read -p "Combien de fichiers voyez-vous ici ? " reponse

    if ! [[ "$reponse" =~ ^[0-9]+$ ]]; then
        echo "⚠️  Veuillez entrer un nombre entier positif."
        continue
    fi

    if verifier_reponse "$reponse" "$bon_nombre"; then
        break
    fi
done

echo ""
echo "Merci d'avoir joué ! 🎮"
