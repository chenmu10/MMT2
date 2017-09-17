﻿using Google.Maps;
using Google.Maps.StaticMaps;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace gui.Models
{
    public class EmailHelper
    {
        string fromAddress = "chenitunes@gmail.com"; // temporary - personal email..
        string fromPassword = "mmtproject";
        string TestMail = "chenmu10@gmail.com";
        string EmailTitle = "MMT";
        string ManagerMail = "chenmu10@gmail.com";
        string signature, signature_path, sendBody;
        bool IsTestMode = true;
        SmtpClient smtp;
        DB db;


        // Files path
        // General
        string VolunteerInviteBody;
        string AssignCompleteVol;
        string FeedBack;
        string CancelWorkshop;

        // Company
        string SchoolInviteBody;
        string executeVolunteersInCompany;
        string executeSchoolInCompany;
        string executeCompany;

        // School
        string AssignCompleteSchool;
        string PrepareBody;
        string executeVolunteersInSchool;
        string executeSchoolInSchool;
    


    /// <summary>
    /// Constractor
    /// </summary>
    public EmailHelper() {

            db = new DB();
            db.IsConnect();
            signature_path = System.Web.Hosting.HostingEnvironment.MapPath("~/Contact/Signature.txt");
            SchoolInviteBody = System.Web.Hosting.HostingEnvironment.MapPath("~/Contact/SchoolInviteMailBody.txt");
            VolunteerInviteBody = System.Web.Hosting.HostingEnvironment.MapPath("~/Contact/VolunteerInviteBody.txt");
            AssignCompleteSchool = System.Web.Hosting.HostingEnvironment.MapPath("~/Contact/AssignCompleteSchool.txt");
            PrepareBody = System.Web.Hosting.HostingEnvironment.MapPath("~/Contact/PrepareBody.txt");

           
       
     


    smtp = new SmtpClient()
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress, fromPassword),
                Timeout = 20000
            };



        }

        public bool SendInitesToSchools(List<School> allSchools,CompanyWorkshop selectedWorkshop)
        {
            //Variables
            List<Company> allCompany = db.GetAllComapny();
            List<ListItem> Areas = db.GetAllAreas();

            Company company; 
            var mail = new MailMessage();
            mail.From = new MailAddress(fromAddress, "סדנא חדשה באזורך-פרויקט מהממט");
            foreach (School s in allSchools)
            {
                //Read Files
                sendBody = File.ReadAllText(SchoolInviteBody, Encoding.UTF8);
                signature = File.ReadAllText(signature_path, Encoding.UTF8);

                //Subject & Body information
                string subject = sendBody.Split('%')[0].Replace("\n", "").Replace("\r", "");
                sendBody = sendBody.Split('%')[1];
                company = allCompany.Find(x => x.Company_ID == selectedWorkshop.CompanyID);
                string Area = Areas[company.Company_Area_Activity].Text;

            
                //Body information replace by values
                // Replace {0},{1},{2}....
                sendBody = string.Format(sendBody,
                company.Company_Name,
                selectedWorkshop.CompanyWorkShopDate.Split(' ')[0],
                selectedWorkshop.WorkShop_Number_Of_StudentPredicted,
                s.School_Name,
                Area
                );

                mail.Subject = subject;
                sendBody = sendBody.Replace("\n", "<br>");
                mail.Body = sendBody + signature;
                mail.IsBodyHtml = true;
                

                //Try to send mail
                try
                {
                    if(IsTestMode)
                        mail.To.Add(new MailAddress(TestMail));
                    else
                        mail.To.Add(new MailAddress(s.School_Contact_Email));

                    smtp.Send(mail);
                }catch(Exception e)
                {
                    return false;
                }
              
            } // foreach
            return true;
        }

        public bool SendInivetsToVolunteers(List<Volunteer> allVolunteer,int Area_Activity,string Date)
        {
            //Variables
            List<ListItem> Areas = db.GetAllAreas();

            var mail = new MailMessage();
            mail.From = new MailAddress(fromAddress, EmailTitle);

            foreach (Volunteer v in allVolunteer)
            {
                //Read Files
                sendBody = File.ReadAllText(VolunteerInviteBody, Encoding.UTF8);
                signature = File.ReadAllText(signature_path, Encoding.UTF8);

                //Subject & Body information
                string subject = sendBody.Split('%')[0].Replace("\n", "").Replace("\r", "");
                sendBody = sendBody.Split('%')[1];
                string Area = Areas[Area_Activity].Text;


                //Body information replace by values
                // Replace {0},{1},{2}....
                sendBody = string.Format(sendBody,
                v.Volunteer_First_Name+" "+v.Volunteer_Last_Name,                
                Area,
                Date
                );

                mail.Subject = subject;
                sendBody = sendBody.Replace("\n", "<br>");
                mail.Body = sendBody + signature;
                mail.IsBodyHtml = true;


                //Try to send mail
                try
                {
                    if (IsTestMode)
                        mail.To.Add(new MailAddress(TestMail));
                    else
                        mail.To.Add(new MailAddress(v.Volunteer_Email));

                    smtp.Send(mail);
                }
                catch (Exception e)
                {
                    return false;
                }

            } // foreach
            return true;
        }

        /// Update all volnteer,school,manger that workshop x is full 
        public bool SendAssignComplete(SchoolWorkShop s)
        {
            List<Volunteer> allVolunteer = db.GetAllVolunteers();
            List<School> allSchool = db.GetAllSchools();
            Volunteer v1 = allVolunteer.Find(x => x.Volunteer_ID == s.SchoolWorkShopVolunteerID1);
            Volunteer v2 = allVolunteer.Find(x => x.Volunteer_ID == s.SchoolWorkShopVolunteerID2);
            Volunteer v3 = allVolunteer.Find(x => x.Volunteer_ID == s.SchoolWorkShopVolunteerID3);
            School selectedSchool = allSchool.Find(x => x.School_ID == s.WorkShop_School_ID);
            var mail = new MailMessage();
            mail.From = new MailAddress(fromAddress, EmailTitle);

                //Read Files
                sendBody = File.ReadAllText(AssignCompleteSchool, Encoding.UTF8);
                signature = File.ReadAllText(signature_path, Encoding.UTF8);

                //Subject & Body information
                string subject = sendBody.Split('%')[0].Replace("\n", "").Replace("\r", "");
                sendBody = sendBody.Split('%')[1];

            string email1 = v1 == null ? "" : v1.Volunteer_Email;
            string email2 = v1 == null ? "" : v2.Volunteer_Email;
            string email3 = v1 == null ? "" : v3.Volunteer_Email;

            string name1 = v1 == null ? "" : v1.Volunteer_First_Name+" "+v1.Volunteer_Last_Name;
            string name2 = v1 == null ? "" : v2.Volunteer_First_Name + " " + v2.Volunteer_Last_Name;
            string name3 = v1 == null ? "" : v3.Volunteer_First_Name + " " + v3.Volunteer_Last_Name;

            //Body information replace by values
            // Replace {0},{1},{2}....
            sendBody = string.Format(sendBody,
                    s.getSelectedDate().Split(' ')[0], 
                    selectedSchool.School_Name,selectedSchool.School_Address,
                    name1,
                    name2,
                    name3
                );

                mail.Subject = subject;
                sendBody = sendBody.Replace("\n", "<br>");
                mail.Body = sendBody + signature;
                mail.IsBodyHtml = true;


                //Try to send mail
                try
                {
                    if (IsTestMode)
                        mail.To.Add(new MailAddress(TestMail));
                    else
                {
                    mail.To.Add(new MailAddress(email1));
                    mail.To.Add(new MailAddress(email2));
                    mail.To.Add(new MailAddress(email3));
                    mail.To.Add(new MailAddress(selectedSchool.School_Contact_Email));
                    mail.To.Add(new MailAddress(ManagerMail));
                }
                       

                    smtp.Send(mail);
                }
                catch (Exception e)
                {
                    return false;
                }
            return true;
        }

        public bool PrepareMail(SchoolWorkShop s)
        {
            List<School> allSchool = db.GetAllSchools();
            School selectedSchool = allSchool.Find(x => x.School_ID == s.WorkShop_School_ID);
            var mail = new MailMessage();
            mail.From = new MailAddress(fromAddress, EmailTitle);

            //Read Files
            sendBody = File.ReadAllText(PrepareBody, Encoding.UTF8);
            signature = File.ReadAllText(signature_path, Encoding.UTF8);

            //Subject & Body information
            string subject = sendBody.Split('%')[0].Replace("\n", "").Replace("\r", "");
            sendBody = sendBody.Split('%')[1];

            //Body information replace by values
            // Replace {0},{1},{2}....
            sendBody = string.Format(sendBody,
                    s.getSelectedDate().Split(' ')[0],
                    selectedSchool.School_Name,
                    selectedSchool.School_Address,
                    selectedSchool.School_ID
                );

            mail.Subject = subject;
            sendBody = sendBody.Replace("\n", "<br>");
            mail.Body = sendBody + signature;
            mail.IsBodyHtml = true;


            //Try to send mail
            try
            {
                if (IsTestMode)
                    mail.To.Add(new MailAddress(TestMail));
                else
                {
                    mail.To.Add(new MailAddress(selectedSchool.School_Contact_Email));
                    mail.To.Add(new MailAddress(ManagerMail));
                }


                smtp.Send(mail);
            }
            catch (Exception e)
            {
                return false;
            }
            return true;
        }




    }
}