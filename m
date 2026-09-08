<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jogo de Vestir 2D Simples</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
        }

        .game-container {
            display: flex;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            gap: 40px;
            align-items: center;
        }

        /* Área do Personagem */
        .character-area {
            position: relative;
            width: 180px;
            height: 320px;
            background: #fce4ec;
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 3px dashed #f8bbd0;
        }

        .avatar {
            position: relative;
            width: 100px;
            height: 250px;
        }

        /* Partes do corpo base */
        .head {
            width: 60px;
            height: 60px;
            background: #ffccbc;
            border-radius: 50%;
            position: absolute;
            top: 10px;
            left: 20px;
            z-index: 1;
        }
        .body {
            width: 70px;
            height: 90px;
            background: #e0e0e0;
            border-radius: 10px;
            position: absolute;
            top: 70px;
            left: 15px;
            z-index: 1;
        }
        .legs {
            width: 60px;
            height: 80px;
            background: #b0bec5;
            border-radius: 5px;
            position: absolute;
            top: 160px;
            left: 20px;
            z-index: 1;
        }

        /* Camadas de Roupas (Ficam acima do corpo) */
        .hat {
            width: 70px;
            height: 25px;
            background-color: transparent;
            position: absolute;
            top: 0px;
            left: 15px;
            border-radius: 15px 15px 0 0;
            z-index: 2;
            transition: background 0.2s;
        }

        .shirt {
            width: 74px;
            height: 60px;
            background-color: transparent;
            position: absolute;
            top: 70px;
            left: 13px;
            border-radius: 8px;
            z-index: 2;
            transition: background 0.2s;
        }

        .pants {
            width: 62px;
            height: 55px;
            background-color: transparent;
            position: absolute;
            top: 158px;
            left: 19px;
            border-radius: 5px;
            z-index: 2;
            transition: background 0.2s;
        }

        /* Catálogo de Roupas */
        .catalog-area {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 240px;
        }

        .section-title {
            font-size: 13px;
            font-weight: bold;
            color: #666;
            text-transform: uppercase;
            border-bottom: 2px solid #eee;
            padding-bottom: 3px;
        }

        .catalog-grid {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .item-btn {
            width: 45px;
            height: 45px;
            border: 2px solid #ddd;
            border-radius: 8px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            font-weight: bold;
            color: #fff;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.5);
            transition: transform 0.1s, border-color 0.1s;
        }

        .item-btn:hover {
            transform: scale(1.1);
            border-color: #333;
        }
    </style>
</head>
<body>

    <h1>✨ Meu Jogo de Vestir 2D ✨</h1>
    
    <div class="game-container">
        <!-- Personagem -->
        <div class="character-area">
            <div class="avatar">
                <!-- Corpo base -->
                <div class="head"></div>
                <div class="body"></div>
                <div class="legs"></div>
                
                <!-- Camadas que mudam de cor/roupa -->
                <div id="char-hat" class="hat"></div>
                <div id="char-shirt" class="shirt"></div>
                <div id="char-pants" class="pants"></div>
            </div>
        </div>

        <!-- Catálogo de Escolhas -->
        <div class="catalog-area">
            <div class="section-title">Chapéus / Acessórios</div>
            <div class="catalog-grid">
                <div class="item-btn" style="background: #e74c3c;" onclick="changeItem('hat', '#e74c3c')">Vermelho</div>
                <div class="item-btn" style="background: #f1c40f;" onclick="changeItem('hat', #f1c40f)" style="background: #f1c40f;" onclick="changeItem('hat', '#f1c40f')">Amarelo</div>
                <div class="item-btn" style="background: #95a5a6;" onclick="changeItem('hat', 'transparent')">Tirar</div>
            </div>

            <div class="section-title">Blusas</div>
            <div class="catalog-grid">
                <div class="item-btn" style="background: #3498db;" onclick="changeItem('shirt', '#3498db')">Azul</div>
                <div class="item-btn" style="background: #2ecc71;" onclick="changeItem('shirt', '#2ecc71')">Verde</div>
                <div class="item-btn" style="background: #e91e63;" onclick="changeItem('shirt', '#e91e63')">Rosa</div>
                <div class="item-btn" style="background: #95a5a6;" onclick="changeItem('shirt', 'transparent')">Tirar</div>
            </div>

            <div class="section-title">Calças</div>
            <div class="catalog-grid">
                <div class="item-btn" style="background: #2c3e50;" onclick="changeItem('pants', '#2c3e50')">Preto</div>
                <div class="item-btn" style="background: #8e44ad;" onclick="changeItem('pants', '#8e44ad')">Roxo</div>
                <div class="item-btn" style="background: #d35400;" onclick="changeItem('pants', '#d35400')">Marrom</div>
                <div class="item-btn" style="background: #95a5a6;" onclick="changeItem('pants', 'transparent')">Tirar</div>
            </div>
        </div>
    </div>

    <script>
        // Função que altera a cor/estilo da roupa selecionada
        function changeItem(type, color) {
            const element = document.getElementById('char-' + type);
            element.style.backgroundColor = color;
        }
    </script>

</body>
</html>
