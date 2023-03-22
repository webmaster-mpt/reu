﻿using System;
using System.Net;
using System.Net.Mail;
using System.Windows.Forms;
namespace Reu
{
    public partial class SendEmail : Form
    {
        public SendEmail()
        {
            InitializeComponent();
        }

        private void Send_Click(object sender, EventArgs e)
        {
            try
            {
                using (System.Net.WebClient client = new System.Net.WebClient())
                {
                    string myemail = "s.muzafari@mail.ru";
                    string mypswd = "webmaster228";
                    string zag = "ФГБОУ ВО РЭУ им. Г.В.Плеханова";

                    MailMessage mess = new MailMessage();
                    mess.To.Add(Email.Text); // адрес получателя
                    mess.From = new MailAddress(myemail, zag);
                    SmtpClient smtp = new SmtpClient();
                    string file = @"C:\Users\user\source\repos\Reu\Reu\Заявка.docx";
                    Attachment sendfile = new Attachment(file);
                    mess.Subject = "Заявка";
                    mess.Body = "Ваша заявка!)";
                    mess.Attachments.Add(sendfile);
                    smtp.Host = "smtp.mail.ru"; //smtp-сервер отправителя
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential(myemail.Split('@')[0], mypswd);
                    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                    smtp.Send(mess); // отправка пользователю
                    mess.To.Remove(mess.To[0]);
                    mess.Dispose();
                    MessageBox.Show("Вы получили электронный пропуск на почту!)");
                    this.Hide();
                    PanelUser st = new PanelUser();
                    st.Show();
                }
            }
            catch
            {
                MessageBox.Show("Неверная почта!)");
            }
        }

        private void BackToLk_Click(object sender, EventArgs e)
        {
            this.Hide();
            PanelUser st = new PanelUser();
            st.Show();
        }
    }
}
