﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SchoolWorkshopEditInfo.aspx.cs" Inherits="gui.Gui.Workshop.SchoolWorkshopEditInfo" %>

<%@ Register Src="../Documents/nav.ascx" TagName="nav" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <script src="../../js/jquery-3.0.0.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>

    <link href="../../css/bootstrap-rtl.min.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="//cdn.rawgit.com/morteza/bootstrap-rtl/v3.3.4/dist/css/bootstrap-rtl.min.css" />
    <link href="../../css/StatusBar.css" rel="stylesheet" />
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Caption:400,700' rel='stylesheet' type='text/css' />
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>



    <form id="form1" runat="server">

        <uc1:nav ID="nav1" runat="server" />

        <div class="checkout-wrap">

            <ul class="checkout-bar">

                <li runat="server" id="bar1">פניית בית ספר</li>
                <li runat="server" id="bar2">בדיקת תאריכים</li>
                <li runat="server" id="bar3">שיבוץ מתנדבות</li>
                <li runat="server" id="bar4">שיבוץ הושלם</li>
                <li runat="server" id="bar5">להכנה</li>
                <li runat="server" id="bar6">לביצוע</li>
                <li runat="server" id="bar7">למישוב</li>
                <li runat="server" id="bar8">סגור</li>


            </ul>
        </div>
        <br />
        <br />

        <div class="container">
            <div class="page-header">
                <h3>צפייה בפרטי סדנא בבית ספר</h3>
                <p>
                      <label class="control-label" for="WorkShopID">מס' מזהה: </label>
                    <asp:Label runat="server" ID="WorkShopID"></asp:Label>
                    <br />

                    <label class="control-label" for="WorkShopStatus">סטטוס נוכחי: </label>
                    <asp:Label runat="server" ID="WorkShopStatus"></asp:Label>
                    <br />

                    <label class="control-label" for="WorkShopDate">מועד קיום: </label>
                    <asp:Label runat="server" ID="WorkShopDate"></asp:Label>
                    <br />
                </p>
            </div>

            <div class="row">
                <div class="col-md-3">

                  

                    <br />
                    <label class="control-label" for="DropDownListStatus">שינוי סטטוס: </label>

                    <asp:DropDownList runat="server" ID="selectpicker">
                        <asp:ListItem Value="1">לבדיקת תאריכים</asp:ListItem>
                        <asp:ListItem Value="2">לשיבוץ מתנדבות</asp:ListItem>
                        <asp:ListItem Value="3">לשיבוץ הושלם</asp:ListItem>
                        <asp:ListItem Value="4">להכנה</asp:ListItem>
                        <asp:ListItem Value="5">לביצוע</asp:ListItem>
                        <asp:ListItem Value="6">למישוב</asp:ListItem>
                        <asp:ListItem Value="7">לסגור</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />

                    <br />
                    <asp:Label runat="server" ID="PrepareFormCreate" Text="נוצר טופס הכנה, ניתן לראות ב'פרטי הכנה'"></asp:Label>
                    <br />
                    <br />
                    <asp:Label runat="server" ID="volunteerfinishedlabel" Text="יש כמות קטנה של מתנדבות,האם להמשיך?"></asp:Label>
                    <br />
                    <asp:Button runat="server" ID="yesToVolunteerFinished" Text="כן" class="btn btn-success" OnClick="yesToVolunteerFinished_Click" />
                    <asp:Button runat="server" ID="noToVolunteerFinished" Text="לא" class="btn btn-danger" />
                    <br />
                    <br />
                    <br />
                    <asp:Button runat="server" OnClick="updateStatus_Click" ID="updateStatus" Text="עדכון סטטוס" class="btn btn-success" />

                    <br />
                    <br />
                    <button id="cancelWorkshop" class="btn btn-danger">ביטול סדנא</button>
                </div>

                <div class="col-md-9">

                    <div class="panel with-nav-tabs panel-default">
                        <div class="panel-heading">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab1default" data-toggle="tab">פרטי פניית בי"ס</a></li>
                                <li><a href="#tab2default" data-toggle="tab">פרטי שיבוץ מתנדבות</a></li>
                                <li><a href="#tab3default" data-toggle="tab">פרטי הכנה</a></li>

                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="tab1default">
                                    <div class="col-md-6">
                                        <asp:LinkButton runat="server" ID="LinkSchoolInfo" Text="פרטי בית הספר"></asp:LinkButton>
                                        <br />
                                        <br />

                                        <label class="control-label" for="schoolName">
                                            שם בי"ס : 
                                        </label>
                                        <div class="form-inline">
                                            <asp:TextBox ID="schoolname" Enabled="false"
                                                required="required"
                                                class="form-control"
                                                oninvalid="setCustomValidity('יש להזין שם בית ספר')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                                runat="server" Width="220px">
                                            </asp:TextBox>
                                        </div>
                                        <br />

                                        <label class="control-label" for="numberofcumputers">מס' מחשבים תקינים: </label>
                                        <div class="form-inline">
                                            <asp:TextBox ID="numberofcumputers" Enabled="false"
                                                type="number"
                                                class="form-control"
                                                min="0"
                                                required="required"
                                                oninvalid="setCustomValidity('יש להזין מס' מחשבים תקינים')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                                runat="server" Width="220px"></asp:TextBox>
                                        </div>
                                        <br />
                                        <label class="control-label" for="studentpredict">מס' משתתפות צפוי: </label>
                                        <div class="form-inline">
                                            <asp:TextBox ID="studentpredict" Enabled="false"
                                                type="number"
                                                class="form-control"
                                                min="0"
                                                required="required"
                                                oninvalid="setCustomValidity('יש להזין מס' משתתפות צפוי')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                                runat="server" Width="220px"></asp:TextBox>
                                        </div>
                                        <br />
                                        <label class="control-label" for="registrationComment">הערות: </label>
                                        <div class="form-inline">
                                            <asp:TextBox ID="comments" Enabled="false"
                                                runat="server" Width="220px"
                                                class="form-control"
                                                TextMode="MultiLine"
                                                Rows="5" Style="resize: none;"></asp:TextBox>
                                        </div>
                                        <br />
                                        <label class="control-label" for="scientificWorkshop">האם הסדנא מיועדת לתלמידות עמ"ט?</label>
                                        <asp:RadioButtonList ID="scientificWorkshop" Enabled="false" runat="server">
                                            <asp:ListItem Value="True"> כן</asp:ListItem>
                                            <asp:ListItem Value="False">לא </asp:ListItem>
                                        </asp:RadioButtonList>
                                        <br />
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>

                                            <legend>תאריכים אפשריים</legend>
                                            <label class="control-label" for="date1">תאריך 1: </label>
                                            <asp:Label runat="server" ID="date1"></asp:Label>
                                            <br />
                                            <label class="control-label" for="date2">תאריך 2: </label>
                                            <asp:Label runat="server" ID="date2"></asp:Label>
                                            <br />
                                            <label class="control-label" for="date3">תאריך 3: </label>
                                            <asp:Label runat="server" ID="date3"></asp:Label>
                                            <br />
                                            <asp:Label class="control-label" runat="server" ID="dateselecting">בחרי תאריך רצוי </asp:Label>
                                            <asp:DropDownList runat="server" ID="dateselector">
                                                <asp:ListItem Value="0" Text="בחרי תאריך"></asp:ListItem>
                                                <asp:ListItem Value="1"></asp:ListItem>
                                                <asp:ListItem Value="2"></asp:ListItem>
                                                <asp:ListItem Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </fieldset>
                                    </div>


                                </div>
                                <div class="tab-pane fade" id="tab2default">
                                    <div class="col-md-6">
                                        <label class="control-label" for="volunteercount">מס' מתנדבות נוכחי: </label>
                                        <asp:Label runat="server" ID="volunteercount"></asp:Label>
                                        <br />
                                        <asp:LinkButton runat="server" ID="LinkVolunteerAssign" Text="מעבר לעמוד שיבוץ"></asp:LinkButton>
                                        <br />

                                        <br />
                                    </div>
                                    <div class="col-md-6">
                                        <fieldset>

                                            <legend>פרטי מתנדבות</legend>
                                            <label class="control-label" for="VolunteerName1">מתנדבת 1: </label>
                                            <asp:Label runat="server" ID="VolunteerName1"></asp:Label>
                                            <asp:LinkButton runat="server" ID="VolunteerFeedback1" Text="משוב"></asp:LinkButton>
                                            <br />
                                            <label class="control-label" for="VolunteerName2">מתנדבת 2: </label>
                                            <asp:Label runat="server" ID="VolunteerName2"></asp:Label>
                                            <asp:LinkButton runat="server" ID="VolunteerFeedback2" Text="משוב"></asp:LinkButton>
                                            <br />
                                            <label class="control-label" for="VolunteerName3">מתנדבת 3: </label>
                                            <asp:Label runat="server" ID="VolunteerName3"></asp:Label>
                                            <asp:LinkButton runat="server" ID="VolunteerFeedback3" Text="משוב"></asp:LinkButton>
                                            <br />
                                        </fieldset>
                                    </div>
                                    <button id="prepareUpdate" class="btn btn-success text-center">עדכני להכנה</button>
                                </div>

                                <div class="tab-pane fade" id="tab3default">
                                    <div class="col-md-6">

                                        <asp:Button runat="server" ID="prepareForm" OnClick="prepareForm_Click" Text="טופס הכנה" />
                                        <br />

                                        <!--Participants number-->
                                        <label class="control-label" for="finalParticipants">מס' משתתפות סופי: </label>
                                        <div>
                                            <asp:TextBox ID="finalParticipants" Width="20%" Enabled="false"
                                                type="number"
                                                class="form-control"
                                                min="0"
                                                oninvalid="setCustomValidity('יש להזין מס' משתתפות')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                                runat="server"></asp:TextBox>
                                        </div>
                                        <br />

                                        <!--Computers with emulators number-->
                                        <label class="control-label" for="numOfCompWithEmulator">מס' מחשבים עם אימולטור: </label>
                                        <div>
                                            <asp:TextBox ID="numOfCompWithEmulator" Width="20%" Enabled="false"
                                                type="number"
                                                class="form-control"
                                                min="0"
                                                oninvalid="setCustomValidity('יש להזין מס' מחשבים')"
                                                onchange="try{setCustomValidity('')}catch(e){}"
                                                runat="server"></asp:TextBox>
                                        </div>
                                        <br />

                                        <!--DidPrepare PDF yes/no-->
                                        <label class="control-label" for="RadioButtonListDidPrepare">בוצעו הוראות PDF:</label>

                                        <asp:RadioButtonList ID="RadioButtonListDidPrepare" runat="server">
                                            <asp:ListItem Value="True" Text="כן"></asp:ListItem>
                                            <asp:ListItem Value="False" Text="לא"></asp:ListItem>
                                        </asp:RadioButtonList>
                                        <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="RadioButtonListDidPrepare" runat="server" ErrorMessage="יש לבחור" ForeColor="Red"></asp:RequiredFieldValidator>-->
                                        <br />

                                        <!--Projector\contorl program yes/no -->
                                        <label class="control-label" for="RadioButtonListProjectOrControl">קיום מקרן/תוכנת השתלטות</label>

                                        <asp:RadioButtonList ID="RadioButtonListProjectOrControl" runat="server">
                                            <asp:ListItem Value="True"> כן</asp:ListItem>
                                            <asp:ListItem Value="False">לא </asp:ListItem>
                                        </asp:RadioButtonList>
                                        <!-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="RadioButtonListProjectOrControl" runat="server" ErrorMessage="יש לבחור" ForeColor="Red"></asp:RequiredFieldValidator>-->
                                        <br />

                                        <!--Seniors coming yes/no -->
                                        <label class="control-label" for="RadioButtonListSeniors">מגיעות בוגרות מגמה:</label>

                                        <asp:RadioButtonList ID="RadioButtonListSeniors" runat="server">
                                            <asp:ListItem Value="True">כן </asp:ListItem>
                                            <asp:ListItem Value="False">לא </asp:ListItem>
                                        </asp:RadioButtonList>
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="RadioButtonListSeniors" runat="server" ErrorMessage="יש לבחור" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                        <br />

                                        <!--Show video yes/no -->
                                        <label class="control-label" for="RadioButtonListShowVideo">אפשר להראות וידאו</label>
                                        <asp:RadioButtonList ID="RadioButtonListShowVideo" runat="server">
                                            <asp:ListItem Value="True">כן</asp:ListItem>
                                            <asp:ListItem Value="False">לא</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <!--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="RadioButtonListShowVideo" runat="server" ErrorMessage="יש לבחור" ForeColor="Red"></asp:RequiredFieldValidator>-->
                                        <br />

                                        <label class="control-label" for="prepareComments">הערות: </label>
                                        <div class="form-inline">
                                            <asp:TextBox ID="prepareComments" Enabled="false" Text="הערות שהזינו בטופס ועכשיו רק מוצגות"
                                                runat="server" Width="220px"
                                                class="form-control"
                                                TextMode="MultiLine"
                                                Rows="3" Style="resize: none;"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-6">
                                        <!-- Teacher Details-->
                                        <div>
                                            <fieldset>

                                                <legend>מורה נוכח/ת בפעילות</legend>
                                                <!-- Name-->
                                                <label class="control-label">שם מלא:</label>

                                                <asp:TextBox ID="teacherName" class="form-control" Width="40%"
                                                    type="text" Enabled="false"
                                                    pattern="[\u0590-\u05FF''-'\s]{1,20}"
                                                    oninvalid="setCustomValidity('שם פרטי לא תקין, אנא נסי שם בעברית')"
                                                    onchange="try{setCustomValidity('')}catch(e){}"
                                                    required="required" placeholder="שם מלא"
                                                    runat="server"></asp:TextBox>
                                                <br />
                                                <!-- Email-->
                                                <label class="control-label" for="teacherEmail">אימייל:</label>
                                                <asp:TextBox Enabled="false" class="form-control" runat="server" Width="40%" ID="teacherEmail" placeholder="example@gmail.com" type="email" required="required" />
                                                <br />
                                                <!--Phone-->
                                                <label class="control-label" for="teacherPhone">טלפון:</label>
                                                <asp:TextBox Enabled="false" class="form-control" ID="teacherPhone" Width="40%"
                                                    type="tel"
                                                    pattern="[0-9]{3}-[0-9]{7}"
                                                    required="required"
                                                    oninvalid="setCustomValidity('05X-XXXXXXX  הכניסי את הטלפון לפי הפורמט')"
                                                    onchange="try{setCustomValidity('')}catch(e){}"
                                                    placeholder="05X-XXXXXXX"
                                                    runat="server"></asp:TextBox>
                                            </fieldset>
                                        </div>
                                        <br />
                                        <br />
                                    </div>
                                
                                    <asp:Button runat="server" CssClass="btn btn-success center-block text-center" Text="עדכני לביצוע" />

                                </div>



                                <!-- ________________________________________________________________________________--->

                            </div>

                        </div>

                    </div>
                    <!--panel with-nav-tabs panel-default-->
                </div>
                <!--col-md-10-->
            </div>
            <!--row-->




        </div>
        <!--container-->
    </form>
</body>
</html>
