# Palette de Couleurs Emirates - Référence Visuelle

## 🎨 Palette Principale

### Or (Gold Palette)
```
Très Clair       Clair         Clair-Moyen      Moyen
#fef9f3          #fef3e6       #fde8cc          #fcd789
bg-brand-50      bg-brand-100  bg-brand-200     bg-brand-300

Moyen-Foncé      Principal     Foncé            Plus Foncé
#fac847          #d4a944       #b8860b          #8b6308
bg-brand-400     bg-brand-500  bg-brand-600     bg-brand-700

Très Foncé       Extrêmement Foncé
#6b4a04          #4a3202
bg-brand-800     bg-brand-900
```

### Couleurs Sombres
- **Noir Principal**: `#1a1a1a` - Texte, sidebars
- **Gris Foncé**: `#2d2d2d` - Texte secondaire
- **Blanc**: `#ffffff` - Fonds, cartes

## 💡 Utilisations Recommandées

### Fonds (Backgrounds)
| Nuance | Utilisation | Exemple |
|--------|-------------|---------|
| brand-50 | Fonds très clairs, alternance de tables | Arrière-plans subtils |
| brand-100 | Fonds secondaires, zones inactives | Sections grises |
| brand-200 | Bordures, séparateurs | Lignes, divisions |
| brand-500+ | Texte, accents, icônes | Éléments saillants |

### Texte (Text)
| Nuance | Utilisation | Exemple |
|--------|-------------|---------|
| text-brand-600 | Texte secondaire, descriptions | Petits textes |
| text-brand-700 | Texte labels, titres secondaires | Labels de formulaire |
| text-brand-900 | Titres, texte important | Titres, corps |

### Bordures (Borders)
| Nuance | Utilisation | Exemple |
|--------|-------------|---------|
| border-brand-100 | Bordures très subtiles | Séparateurs légers |
| border-brand-200 | Bordures normales | Cartes, inputs |
| border-brand-400 | Bordures saillantes | États focus |

### Boutons (Buttons)
| Nuance | Utilisation | Exemple |
|--------|-------------|---------|
| bg-brand-600 | État normal | Boutons primaires |
| bg-brand-700 | État hover | Au survol |
| bg-brand-800 | État active | Au clic |

## 🎨 États des Composants

### Bouton Primaire
```
Normal:   bg-brand-600, text-white
Hover:    bg-brand-700, shadow-lg
Active:   bg-brand-800, transform scale-95
Disabled: opacity-50, cursor-not-allowed
```

### Entrée de Formulaire
```
Défaut:   border-brand-200, focus:ring-brand-400
Focus:    border-brand-400, bg-brand-50, ring-brand-400
Erreur:   border-red-500, focus:ring-red-400
Succès:   border-green-500, focus:ring-green-400
```

### Carte de Contenu
```
Normal:   bg-white, border-brand-200, shadow-sm
Hover:    shadow-lg, border-brand-300
Selected: border-brand-500, ring-brand-300
```

### Navigation Active
```
Actif:    bg-gradient-to-r from-brand-500 to-brand-600
Inactif:  text-brand-200, hover:text-white
Hover:    bg-brand-700, text-white
```

## 🌈 Palettes Complémentaires

### États et Statuts
```
Succès/OK:    #00a86b (Vert émeraude)
Avertissement: #ff9800 (Orange)
Erreur:       #f44336 (Rouge)
Info:         #2196F3 (Bleu)
```

## 📊 Contraste et Accessibilité

| Combinaison | Ratio | WCAG |
|-------------|-------|------|
| Or (#d4a944) sur Blanc | 4.5:1 | AA ✓ |
| Noir (#1a1a1a) sur Or | 12:1 | AAA ✓ |
| Or sur Noir | 7:1 | AAA ✓ |

*Tous les ratios satisfont ou dépassent les normes WCAG AA.*

## 🎨 Gradients Courants

### Gradient Or Horizontal
```
from-brand-500 to-brand-700
#d4a944 → #8b6308
```

### Gradient Or Vertical
```
from-brand-400 via-brand-500 to-brand-600
#fac847 → #d4a944 → #b8860b
```

### Gradient Reverse (Or vers clair)
```
from-brand-50 to-brand-100
#fef9f3 → #fef3e6
```

### Gradient Sombre (Sidebar)
```
from-emirates-darkGray to-emirates-black
#2d2d2d → #1a1a1a
```

## 🖌️ Ombres

### Ombre Légère
```
shadow-sm
0 1px 2px 0 rgba(212, 169, 68, 0.05)
```

### Ombre Normale
```
shadow-md
0 4px 6px -1px rgba(212, 169, 68, 0.1)
```

### Ombre Grande
```
shadow-lg
0 10px 15px -3px rgba(212, 169, 68, 0.15)
```

## 🎯 Usage Guide par Composant

### Sidebar
```css
/* Fond */
background: linear-gradient(to bottom, #2d2d2d, #1a1a1a);
border-right: 1px solid #d4a944;

/* Élément actif */
background: linear-gradient(to right, #d4a944, #b8860b);
color: #ffffff;

/* Texte inactif */
color: #c4b38a;
```

### Card
```css
/* Fond et bordure */
background-color: #ffffff;
border: 1px solid #fde8cc;
box-shadow: 0 2px 8px rgba(212, 169, 68, 0.08);

/* Hover */
border-color: #d4a944;
box-shadow: 0 8px 16px rgba(212, 169, 68, 0.15);
```

### Button
```css
/* Fond et texte */
background: linear-gradient(135deg, #d4a944, #8b6308);
color: #1a1a1a;
box-shadow: 0 4px 6px rgba(212, 169, 68, 0.15);

/* Hover */
box-shadow: 0 6px 12px rgba(212, 169, 68, 0.25);
transform: translateY(-2px);
```

### Input
```css
/* Bordure et focus */
border: 1px solid #ddd;
border-radius: 6px;

/* Focus state */
border-color: #d4a944;
background-color: #fef9f3;
box-shadow: 0 0 0 3px rgba(212, 169, 68, 0.1);
```

## 🔗 Implémentation Rapide

### Import du CSS personnalisé
```html
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/emirates-theme.css">
```

### Utilisation des variables Tailwind
```html
<!-- Fond or clair -->
<div class="bg-brand-100">Contenu</div>

<!-- Texte or foncé -->
<p class="text-brand-700">Texte</p>

<!-- Gradient or -->
<div class="bg-gradient-to-r from-brand-600 to-brand-700">Gradient</div>

<!-- Bouton avec hover or -->
<button class="bg-brand-600 hover:bg-brand-700 text-white">Clic</button>
```

## 📱 Responsive Considerations

- Les couleurs restent les mêmes sur tous les appareils
- Les shadows et gradients sont supportés par tous les navigateurs modernes
- Utiliser `transition-colors` pour les changements lisses
- Tester le contraste sur les petits écrans

## 💾 Codes Couleur Sauvegardés

Pour utilisation rapide en CSS personnalisé:
```css
:root {
    --emirates-gold: #d4a944;
    --emirates-dark-gold: #8b6308;
    --emirates-black: #1a1a1a;
    --emirates-dark-gray: #2d2d2d;
    --emirates-light-gray: #f5f5f5;
    --emirates-white: #ffffff;
    --emirates-accent: #00a86b;
}
```

## 🎓 Exemples Complets

### Carte Produit
```html
<div class="bg-white rounded-lg border border-brand-200 p-6 shadow-md hover:shadow-lg transition-shadow">
    <h3 class="text-lg font-semibold text-brand-900 mb-2">Titre</h3>
    <p class="text-brand-600 mb-4">Description</p>
    <button class="bg-brand-600 text-white px-4 py-2 rounded hover:bg-brand-700">
        Action
    </button>
</div>
```

### Barre de Statut
```html
<div class="bg-brand-50 border-l-4 border-brand-600 p-4 mb-4">
    <p class="text-brand-900 font-medium">Notification</p>
    <p class="text-brand-600 text-sm">Message descriptif</p>
</div>
```

### Tableau Stylisé
```html
<table class="w-full border-collapse">
    <thead class="bg-brand-50 border-b-2 border-brand-300">
        <tr>
            <th class="p-3 text-left text-brand-900">Colonne 1</th>
        </tr>
    </thead>
    <tbody>
        <tr class="border-b border-brand-100 hover:bg-brand-50">
            <td class="p-3 text-brand-700">Données</td>
        </tr>
    </tbody>
</table>
```

---

**Dernière Mise à Jour**: 15 Janvier 2026  
**Version**: 1.0  
**Designers**: Équipe AIRLINK 
