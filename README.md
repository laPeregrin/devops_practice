t.me/DevOpsPractice_bot

Можете стягнути проекти і заранати його з командую старт заздалегідь налаштувавши змінну TELE_TOKEN 
якщо у вас не буде працювати взяття змінної на віндовс, то можете вставити токен стрічкою в коді замість os.Getenv 
та перезібрати його самотужки командую:
 go build -ldflags "-X=github.com/la-peregrin/DEVOPS_PRACTICE/cmd.appVersion=1.0.n"

команди для боту -start і одна спеціальна команда яку я не буду називати бо цей бот каже взагалі погані речі.

якщо хочете самотужки погратись з нуля то створюйте пустий проек, робіть go mod init а далі встановлюйте кобру:
-go mod init github.com/(nickname)/(nameOfRep) // генерує модуль який буде силатись на ваш гітхаб репнік
-go install github.com/spf13/cobra-cli@latest
-cobra-cli init
-cobra cli add (name of command)
далі в середині файлу який відповідає за вашу новостворену команду треба дописати імопрт telebot "gopkg.in/telebot.v3"
щоб юзати обгортку для тг боту апі

а тут фігачите базу і погнали далі самі
var (
	TeleToken = os.Getenv("TELE_TOKEN") // "Token From Father Bot"
)

bot, err := telebot.NewBot(telebot.Settings{
			URL:    "",
			Token:  TeleToken,
			Poller: &telebot.LongPoller{Timeout: 10 * time.Second},
		})

		if err != nil {
			log.Fatalf("Check TELE_TOKEN env variable. %s", err)
			return
		}

  bot.Handle(telebot.OnText, func(m telebot.Context) error {
			log.Print(m.Message().Payload, m.Text())
			payload := m.Message().Payload
		})
