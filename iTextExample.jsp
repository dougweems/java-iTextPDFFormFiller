<%@page import="java.net.*,java.io.*,com.itextpdf.text.Chunk,com.itextpdf.text.Font.*,com.itextpdf.text.pdf.*,com.itextpdf.text.*;"%>
<% 
/**********
  This is the simplest way to generate a pdf form using the free iText libraries.
  You create your pdf file using any tool that will allow you to create form fields in the pdf. 
     - http://www.pdfescape.com is free and online - you can upload an existing pdf and then add fields!
  You need to download the latest iText jar files;  http://iTextpdf.com/download.php
  copy this file and the samplePDF.pdf to your root on a server that runs jsp and then navigate to itextExample.jsp

************/

        response.setContentType("application/pdf");

        try{
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		
		//Add your pdf location here
                PdfReader reader = new PdfReader("samplePDF.pdf");
                PdfStamper stamper = new PdfStamper(reader, buffer);
                AcroFields form = stamper.getAcroFields();

		//Replace with your field names.  You can hard code or retrieve values from database or query parameters
		//Add as many as you want.
                form.setField("sampleText1", "Bruno Lowagie");
                form.setField("sampleText2", "Did Great!");

                stamper.close();

                DataOutput dataOutput = new DataOutputStream(response.getOutputStream());
                byte[] bytes = buffer.toByteArray();
                response.setContentLength(bytes.length);
                for(int i = 0; i < bytes.length; i++){
                    dataOutput.writeByte(bytes[i]);
                }
                    
            }catch(DocumentException e){
                e.printStackTrace();
            } 
%>