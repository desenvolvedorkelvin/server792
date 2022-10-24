
function onThink(interval, lastExecution)
MENSAGEM = {
    "Para qualquer duvida, caso nao tenha tutores online, envie mensagem para o supporte pelo whatsapp (21) 98056-1166",
	"Para dividir xp, digite: /party ou  /share.",
	"Nao e necessario fazer mecanicas nem rituais para fazer quests como: Bright Sword, Poi, Banshe, etcs.",
	"Aproveite nossa promocao double points para qualquer valor doado, e desfrute dos beneficios usando nosso shop!",
	"Venda items para outros jogadores sem precisar ficar ativo no jogo usando nosso trade offline: https://tibiabra.com/?auction",
	"Desert quest pode ser feita sozinho sem a necessidade de levar items.",
	"Bugs, suggestion, donate? whatsapp *(21) 98056-1166",
	"Contribua com nosso servidor fazendo um donate e receba pointos para comprar items no nosso shop donate.",
	"Beneficios Golden Account: jogadores recebem 10% de bonus de experiencia, podem vender itens mais caro para o npc Ragnar, acesso postman e usar todas as outfits premium! ",
	"Sorria, voce esta jogando o melhor servidor old pvp existente!.",
}
broadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],MESSAGE_STATUS_CONSOLE_ORANGE)
return TRUE
end