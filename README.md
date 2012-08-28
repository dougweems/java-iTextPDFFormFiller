quickPDF.jsp is a very simple jsp template to convert your comma delimited data to a pdf using the open source iText jar library. I am calling the generic quickPDF.jsp file from a dozen or more forms at a client site and they love it. The results are a simple, clean pdf/excel table that can be put together in minutes.

You will need the following jar in your project.

Itextpdf.jar – found at http://itextpdf.com/download.php
(get the iText not the iTextSharp jar)

As a bonus, this quickPDF.jsp will also provide an excel export using the same csv data. 

How to use?

Include a form on the page where you want to provide an export to pdf. 

<form action="quickPDF.jsp?" method="post" onsubmit="this.action=this.action + '1';" target="_blank">
<input style="background: url('pdf-icon.gif') no-repeat; cursor: pointer; height: 40px; width: 40px; border: none; color: transparent;" type="submit" name="doctype" value="makepdf" alt="SUBMIT!" /> 
<input style="background: url('excel-icon.jpeg') no-repeat; cursor: pointer; height: 40px; width: 40px; border: none; color: transparent;" type="submit" name="doctype" value="makeexel" alt="SUBMIT!" /> 
<input type="hidden" name="header" value="Driver No, Name, Contractor No, Status, Address, City, St, Zip, Phone No, Cell Phone, Dispatched On, Primary Co, E-mail" /> 
<input type="hidden" name="headerFontSize" value="7" /> 
<input type="hidden" name="detailFontSize" value="7" /> 
<input type="hidden" name="sPage" value="A4.rotate" /> 
<input type="hidden" name="Title" value="Search Results" /> 
<input type="hidden" name="details" value="<%= bigCleanTable.toString() %>" />
</form>

The String variable bigCleanTable for the hidden element “details” was left in to show how to dynamically include your results. Build a string of comma delimited values and replace bigCleanTable with your String. Use \n to end each row.

example:  test, this code, out\nit, can be, useful\n

You will need to escape any quotes that need to be in the cell text.  If running dynamically, you probably will want to build a function to escape some mischievous characters.

* note: The onsubmit event on the form and the “?” on the action were put in as a workaround for Safari an Chrome “feature” that only allows a form to
be submitted once.

The quickPDF code is straightforward. I have include it, and a couple of icons in the zip file.

Put the quickPDF.jsp file in a public folder on your server, install the itext jar files and set the form action to call it. That is it! I hope you enjoy it and consider donating.