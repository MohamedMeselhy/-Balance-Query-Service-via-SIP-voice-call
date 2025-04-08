/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.asterisk;

import org.asteriskjava.fastagi.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;

public class BalanceQueryAGI extends BaseAgiScript {
    public void service(AgiRequest request, AgiChannel channel) throws AgiException {
        channel.answer();
        channel.streamFile("enter-your-number");  // Play a welcome message

        String msisdn = channel.getData("beep", 10000,11);  // Get MSISDN via DTMF
        

        if (msisdn != null && !msisdn.isEmpty()) {
            String balance = getBalanceFromAPI(msisdn);
            if (balance != null) {
                 channel.streamFile("your-balance-is");
                channel.sayNumber((balance));
            } else {
                channel.streamFile("error");
            }
        } else {
            channel.streamFile("invalid-number");
        }

        channel.streamFile("goodbye");
        channel.hangup();
    }

    private String getBalanceFromAPI(String msisdn) {
        try {
            URL url = new URL("http://localhost:8080/mavenproject1/api/balance?msisdn=" + msisdn);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            return response.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
