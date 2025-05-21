<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerReview.aspx.cs" Inherits="CustomerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .header {
            overflow: hidden;
            background-color: #f1f1f1;
            padding: 10px 7px;
        }

        .header a {
            float: left;
            color: black;
            text-align: center;
            padding: 12px;
            text-decoration: none;
            font-size: 12px;
            line-height: 5px;
            border-radius: 4px;
        }

        .header a.logo {
            float: left;
            font-size: 15px;
            font-weight: bold;
        }

        .header a:hover {
            background-color: #ddd;
            color: black;
        }

        .header a.active {
            background-color: dodgerblue;
            color: white;
        }

        .header-right {
            float: right;
        }

        .mobile-menu {
            display: none;
        }

        @media screen and (max-width: 500px) {
            .header a.logo {
                display: block;
            }

            .header a {
                float: none;
                display: block;
                text-align: center;
                margin: 0;
            }

            .header-right {
                float: none;
                text-align: center;
                margin-top: 10px;
            }

            /* Show mobile menu for small screens */
            .mobile-menu {
                display: block;
            }

            .header-right {
                display: none;
            }

            .header-right.active {
                display: block;
            }
        }

        /* Star Ratings styles */
        .star-rating {
            display: inline-block;
            unicode-bidi: bidi-override;
            direction: rtl;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            font-size: 30px;
            color: #e3dfca;
            cursor: pointer;
            display: inline-block;
        }

        .star-rating label:before {
            content: "\2605";
        }

        .star-rating input:checked ~ label:before {
            content: "\2605"; 
            color: #ffd700;
        }

        /* Mobile Toggle Menu styles */
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        .mobile-container {
            max-width: 480px;
            margin: auto;
            background-color: #555;
            height: 500px;
            color: white;
            border-radius: 10px;
        }

        .topnav {
            overflow: hidden;
            background-color: #333;
            position: relative;
        }

        .topnav #myLinks {
            display: none;
        }

        .topnav a {
            color: white;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
            display: block;
        }

        .topnav a.icon {
            background: black;
            display: block;
            position: absolute;
            right: 0;
            top: 0;
        }

        .topnav a:hover {
            background-color: #ddd;
            color: black;
        }

        .active {
            background-color: #04AA6D;
            color: white;
        }
    </style>

    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var starRadios = document.querySelectorAll('.star-rating input[type="radio"]');
            var hiddenField = document.getElementById('<%= hdnRating.ClientID %>');

            starRadios.forEach(function (radio) {
                radio.addEventListener('change', function () {
                    hiddenField.value = this.getAttribute('data-rating');
                });
            });

            // Mobile Toggle Menu script
            icon.addEventListener('click', function () {
                if (mobileMenu.style.display === "block" || mobileMenu.style.display === "") {
                    mobileMenu.style.display = "none";
                } else {
                    mobileMenu.style.display = "block";
                }
            });

            // Close mobile menu when a link is clicked
            var mobileLinks = document.querySelectorAll('.mobile-menu a');
            mobileLinks.forEach(function (link) {
                link.addEventListener('click', function () {
                    mobileMenu.style.display = "none";
                });
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="header">

                <asp:Image ID="Image1" runat="server" class="top-left" ImageUrl="~/images/CLTlogo.PNG" Width="50px" />
              <%--  <div class="header-right">
                    <a class="active" href="https://colombolotustower.lk/">Home</a>
                    <a href="https://colombolotustower.lk/contact-us/">Contact</a>
                    <a href="https://colombolotustower.lk/s/">About</a>
                </div>

                <div class="mobile-menu">
                    <a href="https://colombolotustower.lk/">Home</a>
                    <a href="https://colombolotustower.lk/contact-us/">Contact</a>
                    <a href="https://colombolotustower.lk/s/">About</a>
                </div>--%>
            </div>


            <div style="padding: 10px;">
                <h1>Leave a Review</h1>
                
                <div class="card card-primary">
                    <div class="card-header">
                        <h3 class="card-title"> Provide Feedback or Suggestions<small> - Get in Touch with Us​</small></h3>
                    </div>
                    <!-- /.card-header -->
                    <!-- form start -->
                    <form id="quickForm">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">First Name</label>
                                <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Last Name</label>
                                <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email<small> - Optional​</small></label>
                                <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Contact No<small> - Optional​</small></label>
                                <asp:TextBox ID="txtContactNo" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" >Country</label>
                            <asp:DropDownList ID="ddlCountry" runat="server" class="form-control">
                                <asp:ListItem Text="Sri Lanka" Value="Sri Lanka" />
                                <asp:ListItem Text="Afghanistan" Value="Afghanistan" />
                                 <asp:ListItem Text="Aland Islands" Value="Aland Islands" />
                                    <asp:ListItem Text="Albania" Value="Albania" />
                                    <asp:ListItem Text="Algeria" Value="Algeria" />
                                    <asp:ListItem Text="American Samoa" Value="American Samoa" />
                                    <asp:ListItem Text="Andorra" Value="Andorra" />
                                    <asp:ListItem Text="Angola" Value="Angola" />
                                    <asp:ListItem Text="Anguilla" Value="Anguilla" />
                                    <asp:ListItem Text="Antarctica" Value="Antarctica" />
                                    <asp:ListItem Text="Antigua and Barbuda" Value="Antigua and Barbuda" />
                                    <asp:ListItem Text="Argentina" Value="Argentina" />
                                    <asp:ListItem Text="Armenia" Value="Armenia" />
                                    <asp:ListItem Text="Aruba" Value="Aruba" />
                                    <asp:ListItem Text="Australia" Value="Australia" />
                                    <asp:ListItem Text="Austria" Value="Austria" />
                                    <asp:ListItem Text="Azerbaijan" Value="Azerbaijan" />
                                    <asp:ListItem Text="Bahamas" Value="Bahamas" />
                                    <asp:ListItem Text="Bahrain" Value="Bahrain" />
                                    <asp:ListItem Text="Bangladesh" Value="Bangladesh" />
                                    <asp:ListItem Text="Barbados" Value="Barbados" />
                                    <asp:ListItem Text="Belarus" Value="Belarus" />
                                    <asp:ListItem Text="Belgium" Value="Belgium" />
                                    <asp:ListItem Text="Belize" Value="Belize" />
                                    <asp:ListItem Text="Benin" Value="Benin" />
                                    <asp:ListItem Text="Bermuda" Value="Bermuda" />
                                    <asp:ListItem Text="Bhutan" Value="Bhutan" />
                                    <asp:ListItem Text="Bolivia" Value="Bolivia" />
                                    <asp:ListItem Text="Bonaire, Sint Eustatius and Saba" Value="Bonaire, Sint Eustatius and Saba" />
                                    <asp:ListItem Text="Bosnia and Herzegovina" Value="Bosnia and Herzegovina" />
                                    <asp:ListItem Text="Botswana" Value="Botswana" />
                                    <asp:ListItem Text="Bouvet Island" Value="Bouvet Island" />
                                    <asp:ListItem Text="Brazil" Value="Brazil" />
                                    <asp:ListItem Text="British Indian Ocean Territory" Value="British Indian Ocean Territory" />
                                    <asp:ListItem Text="Brunei Darussalam" Value="Brunei Darussalam" />
                                    <asp:ListItem Text="Bulgaria" Value="Bulgaria" />
                                    <asp:ListItem Text="Burkina Faso" Value="Burkina Faso" />
                                    <asp:ListItem Text="Burundi" Value="Burundi" />
                                    <asp:ListItem Text="Cambodia" Value="Cambodia" />
                                    <asp:ListItem Text="Cameroon" Value="Cameroon" />
                                    <asp:ListItem Text="Canada" Value="Canada" />
                                    <asp:ListItem Text="Cape Verde" Value="Cape Verde" />
                                    <asp:ListItem Text="Cayman Islands" Value="Cayman Islands" />
                                    <asp:ListItem Text="Central African Republic" Value="Central African Republic" />
                                    <asp:ListItem Text="Chad" Value="Chad" />
                                    <asp:ListItem Text="Chile" Value="Chile" />
                                    <asp:ListItem Text="China" Value="China" />
                                    <asp:ListItem Text="Christmas Island" Value="Christmas Island" />
                                    <asp:ListItem Text="Cocos (Keeling) Islands" Value="Cocos (Keeling) Islands" />
                                    <asp:ListItem Text="Colombia" Value="Colombia" />
                                    <asp:ListItem Text="Comoros" Value="Comoros" />
                                    <asp:ListItem Text="Congo" Value="Congo" />
                                    <asp:ListItem Text="Congo, Democratic Republic of the Congo" Value="Congo, Democratic Republic of the Congo" />
                                    <asp:ListItem Text="Cook Islands" Value="Cook Islands" />
                                    <asp:ListItem Text="Costa Rica" Value="Costa Rica" />
                                    <asp:ListItem Text="Cote D'Ivoire" Value="Cote D'Ivoire" />
                                    <asp:ListItem Text="Croatia" Value="Croatia" />
                                    <asp:ListItem Text="Cuba" Value="Cuba" />
                                    <asp:ListItem Text="Curacao" Value="Curacao" />
                                    <asp:ListItem Text="Cyprus" Value="Cyprus" />
                                    <asp:ListItem Text="Czech Republic" Value="Czech Republic" />
                                    <asp:ListItem Text="Denmark" Value="Denmark" />
                                    <asp:ListItem Text="Djibouti" Value="Djibouti" />
                                    <asp:ListItem Text="Dominica" Value="Dominica" />
                                    <asp:ListItem Text="Dominican Republic" Value="Dominican Republic" />
                                    <asp:ListItem Text="Ecuador" Value="Ecuador" />
                                    <asp:ListItem Text="Egypt" Value="Egypt" />
                                    <asp:ListItem Text="El Salvador" Value="El Salvador" />
                                    <asp:ListItem Text="Equatorial Guinea" Value="Equatorial Guinea" />
                                    <asp:ListItem Text="Eritrea" Value="Eritrea" />
                                    <asp:ListItem Text="Estonia" Value="Estonia" />
                                    <asp:ListItem Text="Ethiopia" Value="Ethiopia" />
                                    <asp:ListItem Text="Falkland Islands (Malvinas)" Value="Falkland Islands (Malvinas)" />
                                    <asp:ListItem Text="Faroe Islands" Value="Faroe Islands" />
                                    <asp:ListItem Text="Fiji" Value="Fiji" />
                                    <asp:ListItem Text="Finland" Value="Finland" />
                                    <asp:ListItem Text="France" Value="France" />
                                    <asp:ListItem Text="French Guiana" Value="French Guiana" />
                                    <asp:ListItem Text="French Polynesia" Value="French Polynesia" />
                                    <asp:ListItem Text="French Southern Territories" Value="French Southern Territories" />
                                    <asp:ListItem Text="Gabon" Value="Gabon" />
                                    <asp:ListItem Text="Gambia" Value="Gambia" />
                                    <asp:ListItem Text="Georgia" Value="Georgia" />
                                    <asp:ListItem Text="Germany" Value="Germany" />
                                    <asp:ListItem Text="Ghana" Value="Ghana" />
                                    <asp:ListItem Text="Gibraltar" Value="Gibraltar" />
                                    <asp:ListItem Text="Greece" Value="Greece" />
                                    <asp:ListItem Text="Greenland" Value="Greenland" />
                                    <asp:ListItem Text="Grenada" Value="Grenada" />
                                    <asp:ListItem Text="Guadeloupe" Value="Guadeloupe" />
                                    <asp:ListItem Text="Guam" Value="Guam" />
                                    <asp:ListItem Text="Guatemala" Value="Guatemala" />
                                    <asp:ListItem Text="Guernsey" Value="Guernsey" />
                                    <asp:ListItem Text="Guinea" Value="Guinea" />
                                    <asp:ListItem Text="Guinea-Bissau" Value="Guinea-Bissau" />
                                    <asp:ListItem Text="Guyana" Value="Guyana" />
                                    <asp:ListItem Text="Haiti" Value="Haiti" />
                                    <asp:ListItem Text="Heard Island and Mcdonald Islands" Value="Heard Island and Mcdonald Islands" />
                                    <asp:ListItem Text="Holy See (Vatican City State)" Value="Holy See (Vatican City State)" />
                                    <asp:ListItem Text="Honduras" Value="Honduras" />
                                    <asp:ListItem Text="Hong Kong" Value="Hong Kong" />
                                    <asp:ListItem Text="Hungary" Value="Hungary" />
                                    <asp:ListItem Text="Iceland" Value="Iceland" />
                                    <asp:ListItem Text="India" Value="India" />
                                    <asp:ListItem Text="Indonesia" Value="Indonesia" />
                                    <asp:ListItem Text="Iran, Islamic Republic of" Value="Iran, Islamic Republic of" />
                                    <asp:ListItem Text="Iraq" Value="Iraq" />
                                    <asp:ListItem Text="Ireland" Value="Ireland" />
                                    <asp:ListItem Text="Isle of Man" Value="Isle of Man" />
                                    <asp:ListItem Text="Israel" Value="Israel" />
                                    <asp:ListItem Text="Italy" Value="Italy" />
                                    <asp:ListItem Text="Jamaica" Value="Jamaica" />
                                    <asp:ListItem Text="Japan" Value="Japan" />
                                    <asp:ListItem Text="Jersey" Value="Jersey" />
                                    <asp:ListItem Text="Jordan" Value="Jordan" />
                                    <asp:ListItem Text="Kazakhstan" Value="Kazakhstan" />
                                    <asp:ListItem Text="Kenya" Value="Kenya" />
                                    <asp:ListItem Text="Kiribati" Value="Kiribati" />
                                    <asp:ListItem Text="Korea, Democratic People's Republic of" Value="Korea, Democratic People's Republic of" />
                                    <asp:ListItem Text="Korea, Republic of" Value="Korea, Republic of" />
                                    <asp:ListItem Text="Kosovo" Value="Kosovo" />
                                    <asp:ListItem Text="Kuwait" Value="Kuwait" />
                                    <asp:ListItem Text="Kyrgyzstan" Value="Kyrgyzstan" />
                                    <asp:ListItem Text="Lao People's Democratic Republic" Value="Lao People's Democratic Republic" />
                                    <asp:ListItem Text="Latvia" Value="Latvia" />
                                    <asp:ListItem Text="Lebanon" Value="Lebanon" />
                                    <asp:ListItem Text="Lesotho" Value="Lesotho" />
                                    <asp:ListItem Text="Liberia" Value="Liberia" />
                                    <asp:ListItem Text="Libyan Arab Jamahiriya" Value="Libyan Arab Jamahiriya" />
                                    <asp:ListItem Text="Liechtenstein" Value="Liechtenstein" />
                                    <asp:ListItem Text="Lithuania" Value="Lithuania" />
                                    <asp:ListItem Text="Luxembourg" Value="Luxembourg" />
                                    <asp:ListItem Text="Macao" Value="Macao" />
                                    <asp:ListItem Text="Macedonia, the Former Yugoslav Republic of" Value="Macedonia, the Former Yugoslav Republic of" />
                                    <asp:ListItem Text="Madagascar" Value="Madagascar" />
                                    <asp:ListItem Text="Malawi" Value="Malawi" />
                                    <asp:ListItem Text="Malaysia" Value="Malaysia" />
                                    <asp:ListItem Text="Maldives" Value="Maldives" />
                                    <asp:ListItem Text="Mali" Value="Mali" />
                                    <asp:ListItem Text="Malta" Value="Malta" />
                                    <asp:ListItem Text="Marshall Islands" Value="Marshall Islands" />
                                    <asp:ListItem Text="Martinique" Value="Martinique" />
                                    <asp:ListItem Text="Mauritania" Value="Mauritania" />
                                    <asp:ListItem Text="Mauritius" Value="Mauritius" />
                                    <asp:ListItem Text="Mayotte" Value="Mayotte" />
                                    <asp:ListItem Text="Mexico" Value="Mexico" />
                                    <asp:ListItem Text="Micronesia, Federated States of" Value="Micronesia, Federated States of" />
                                    <asp:ListItem Text="Moldova, Republic of" Value="Moldova, Republic of" />
                                    <asp:ListItem Text="Monaco" Value="Monaco" />
                                    <asp:ListItem Text="Mongolia" Value="Mongolia" />
                                    <asp:ListItem Text="Montenegro" Value="Montenegro" />
                                    <asp:ListItem Text="Montserrat" Value="Montserrat" />
                                    <asp:ListItem Text="Morocco" Value="Morocco" />
                                    <asp:ListItem Text="Mozambique" Value="Mozambique" />
                                    <asp:ListItem Text="Myanmar" Value="Myanmar" />
                                    <asp:ListItem Text="Namibia" Value="Namibia" />
                                    <asp:ListItem Text="Nauru" Value="Nauru" />
                                    <asp:ListItem Text="Nepal" Value="Nepal" />
                                    <asp:ListItem Text="Netherlands" Value="Netherlands" />
                                    <asp:ListItem Text="Netherlands Antilles" Value="Netherlands Antilles" />
                                    <asp:ListItem Text="New Caledonia" Value="New Caledonia" />
                                    <asp:ListItem Text="New Zealand" Value="New Zealand" />
                                    <asp:ListItem Text="Nicaragua" Value="Nicaragua" />
                                    <asp:ListItem Text="Niger" Value="Niger" />
                                    <asp:ListItem Text="Nigeria" Value="Nigeria" />
                                    <asp:ListItem Text="Niue" Value="Niue" />
                                    <asp:ListItem Text="Norfolk Island" Value="Norfolk Island" />
                                    <asp:ListItem Text="Northern Mariana Islands" Value="Northern Mariana Islands" />
                                    <asp:ListItem Text="Norway" Value="Norway" />
                                    <asp:ListItem Text="Oman" Value="Oman" />
                                    <asp:ListItem Text="Pakistan" Value="Pakistan" />
                                    <asp:ListItem Text="Palau" Value="Palau" />
                                    <asp:ListItem Text="Palestinian Territory, Occupied" Value="Palestinian Territory, Occupied" />
                                    <asp:ListItem Text="Panama" Value="Panama" />
                                    <asp:ListItem Text="Papua New Guinea" Value="Papua New Guinea" />
                                    <asp:ListItem Text="Paraguay" Value="Paraguay" />
                                    <asp:ListItem Text="Peru" Value="Peru" />
                                    <asp:ListItem Text="Philippines" Value="Philippines" />
                                    <asp:ListItem Text="Pitcairn" Value="Pitcairn" />
                                    <asp:ListItem Text="Poland" Value="Poland" />
                                    <asp:ListItem Text="Portugal" Value="Portugal" />
                                    <asp:ListItem Text="Puerto Rico" Value="Puerto Rico" />
                                    <asp:ListItem Text="Qatar" Value="Qatar" />
                                    <asp:ListItem Text="Reunion" Value="Reunion" />
                                    <asp:ListItem Text="Romania" Value="Romania" />
                                    <asp:ListItem Text="Russian Federation" Value="Russian Federation" />
                                    <asp:ListItem Text="Rwanda" Value="Rwanda" />
                                    <asp:ListItem Text="Saint Barthelemy" Value="Saint Barthelemy" />
                                    <asp:ListItem Text="Saint Helena" Value="Saint Helena" />
                                    <asp:ListItem Text="Saint Kitts and Nevis" Value="Saint Kitts and Nevis" />
                                    <asp:ListItem Text="Saint Lucia" Value="Saint Lucia" />
                                    <asp:ListItem Text="Saint Martin" Value="Saint Martin" />
                                    <asp:ListItem Text="Saint Pierre and Miquelon" Value="Saint Pierre and Miquelon" />
                                    <asp:ListItem Text="Saint Vincent and the Grenadines" Value="Saint Vincent and the Grenadines" />
                                    <asp:ListItem Text="Samoa" Value="Samoa" />
                                    <asp:ListItem Text="San Marino" Value="San Marino" />
                                    <asp:ListItem Text="Sao Tome and Principe" Value="Sao Tome and Principe" />
                                    <asp:ListItem Text="Saudi Arabia" Value="Saudi Arabia" />
                                    <asp:ListItem Text="Senegal" Value="Senegal" />
                                    <asp:ListItem Text="Serbia" Value="Serbia" />
                                    <asp:ListItem Text="Serbia and Montenegro" Value="Serbia and Montenegro" />
                                    <asp:ListItem Text="Seychelles" Value="Seychelles" />
                                    <asp:ListItem Text="Sierra Leone" Value="Sierra Leone" />
                                    <asp:ListItem Text="Singapore" Value="Singapore" />
                                    <asp:ListItem Text="Sint Maarten" Value="Sint Maarten" />
                                    <asp:ListItem Text="Slovakia" Value="Slovakia" />
                                    <asp:ListItem Text="Slovenia" Value="Slovenia" />
                                    <asp:ListItem Text="Solomon Islands" Value="Solomon Islands" />
                                    <asp:ListItem Text="Somalia" Value="Somalia" />
                                    <asp:ListItem Text="South Africa" Value="South Africa" />
                                    <asp:ListItem Text="South Georgia and the South Sandwich Islands" Value="South Georgia and the South Sandwich Islands" />
                                    <asp:ListItem Text="South Sudan" Value="South Sudan" />
                                    <asp:ListItem Text="Spain" Value="Spain" />
                                    <asp:ListItem Text="Sri Lanka" Value="Sri Lanka" />
                                    <asp:ListItem Text="Sudan" Value="Sudan" />
                                    <asp:ListItem Text="Suriname" Value="Suriname" />
                                    <asp:ListItem Text="Svalbard and Jan Mayen" Value="Svalbard and Jan Mayen" />
                                    <asp:ListItem Text="Swaziland" Value="Swaziland" />
                                    <asp:ListItem Text="Sweden" Value="Sweden" />
                                    <asp:ListItem Text="Switzerland" Value="Switzerland" />
                                    <asp:ListItem Text="Syrian Arab Republic" Value="Syrian Arab Republic" />
                                    <asp:ListItem Text="Taiwan, Province of China" Value="Taiwan, Province of China" />
                                    <asp:ListItem Text="Tajikistan" Value="Tajikistan" />
                                    <asp:ListItem Text="Tanzania, United Republic of" Value="Tanzania, United Republic of" />
                                    <asp:ListItem Text="Thailand" Value="Thailand" />
                                    <asp:ListItem Text="Timor-Leste" Value="Timor-Leste" />
                                    <asp:ListItem Text="Togo" Value="Togo" />
                                    <asp:ListItem Text="Tokelau" Value="Tokelau" />
                                    <asp:ListItem Text="Tonga" Value="Tonga" />
                                    <asp:ListItem Text="Trinidad and Tobago" Value="Trinidad and Tobago" />
                                    <asp:ListItem Text="Tunisia" Value="Tunisia" />
                                    <asp:ListItem Text="Turkey" Value="Turkey" />
                                    <asp:ListItem Text="Turkmenistan" Value="Turkmenistan" />
                                    <asp:ListItem Text="Turks and Caicos Islands" Value="Turks and Caicos Islands" />
                                    <asp:ListItem Text="Tuvalu" Value="Tuvalu" />
                                    <asp:ListItem Text="Uganda" Value="Uganda" />
                                    <asp:ListItem Text="Ukraine" Value="Ukraine" />
                                    <asp:ListItem Text="United Arab Emirates" Value="United Arab Emirates" />
                                    <asp:ListItem Text="United Kingdom" Value="United Kingdom" />
                                    <asp:ListItem Text="United States" Value="United States" />
                                    <asp:ListItem Text="United States Minor Outlying Islands" Value="United States Minor Outlying Islands" />
                                    <asp:ListItem Text="Uruguay" Value="Uruguay" />
                                    <asp:ListItem Text="Uzbekistan" Value="Uzbekistan" />
                                    <asp:ListItem Text="Vanuatu" Value="Vanuatu" />
                                    <asp:ListItem Text="Venezuela" Value="Venezuela" />
                                    <asp:ListItem Text="Viet Nam" Value="Viet Nam" />
                                    <asp:ListItem Text="Virgin Islands, British" Value="Virgin Islands, British" />
                                    <asp:ListItem Text="Virgin Islands, U.s." Value="Virgin Islands, U.s." />
                                    <asp:ListItem Text="Wallis and Futuna" Value="Wallis and Futuna" />
                                    <asp:ListItem Text="Western Sahara" Value="Western Sahara" />
                                    <asp:ListItem Text="Yemen" Value="Yemen" />
                                    <asp:ListItem Text="Zambia" Value="Zambia" />
                                    <asp:ListItem Text="Zimbabwe" Value="Zimbabwe" />
                            </asp:DropDownList>
                                </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Tell us your experience in Lotus Tower</label>
                                <asp:TextBox ID="txtInquiry" TextMode="MultiLine" class="form-control" runat="server"></asp:TextBox>
                            </div>

                            <!-- Star Ratings -->
                            <div class="star-rating">
                                <input type="radio" id="star5" name="rating" value="5" data-rating="5" />
                                <label for="star5"></label>
                                <input type="radio" id="star4" name="rating" value="4" data-rating="4" />
                                <label for="star4"></label>
                                <input type="radio" id="star3" name="rating" value="3" data-rating="3" />
                                <label for="star3"></label>
                                <input type="radio" id="star2" name="rating" value="2" data-rating="2" />
                                <label for="star2"></label>
                                <input type="radio" id="star1" name="rating" value="1" data-rating="1" />
                                <label for="star1"></label>
                            </div>
                            <!-- End Star Ratings -->
                            <asp:HiddenField ID="hdnRating" runat="server" />
                        </div>
                        <!-- /.card-body -->
                        <div class="card-footer">
                            <asp:Button ID="BtnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="BtnSubmit_Click" />
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </form>
</body>
</html>