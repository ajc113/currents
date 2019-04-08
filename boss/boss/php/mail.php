<?php
session_start();
require_once('class.phpmailer.php');
require_once('class.smtp.php');
if($_POST) {
    if( !isset($_SESSION['sended']) ) {
        // Re-check with php
        if( isset( $_POST['contactname'] ) && !empty( $_POST['contactname'] ) ):
            $name = filter_var(trim($_POST['contactname']), FILTER_SANITIZE_STRING);
        else:
          echo $error = 'Name is empty!';
           return;
        endif;

        if( isset( $_POST['contactlastname'] ) && !empty( $_POST['contactlastname'] ) ):
            $lastname = filter_var(trim($_POST['contactlastname']), FILTER_SANITIZE_STRING);
            // Add lastname to name
            $name = ($lastname) ?  $name. ' ' .$lastname : $name;
        endif;
        
        if( isset( $_POST['contactemail'] ) && !empty( $_POST['contactemail'] ) ):
            $email = filter_var(trim($_POST['contactemail']), FILTER_SANITIZE_EMAIL);
                if( !filter_var( $email , FILTER_VALIDATE_EMAIL ) ):
                   echo $error = 'Email is not valid!';
                    return;
                endif;
        else:
            echo $error = 'Email is empty!';
          return;
        endif;
        
       if( isset( $_POST['contactsubject'] ) && !empty( $_POST['contactsubject'] ) ):
            $subject = filter_var(trim($_POST['contactsubject']), FILTER_SANITIZE_STRING);
        else:
            $subject = "Hello";
        endif;
        
        if( isset( $_POST['contactmessage'] ) && !empty( $_POST['contactmessage'] ) ):
             $message = filter_var(trim($_POST['contactmessage']), FILTER_SANITIZE_STRING);
        else:
          echo  $error = 'Message is empty!';
            return;
        endif;

       if(!isset($error)) {
            // if we have no validation errors prepare mail
            $mail = new PHPMailer;
            $mail->isSMTP();
            $mail->SMTPDebug = 0;
            $mail->Debugoutput = 'html';

            //Set the hostname of the mail server gmail - yandex- outlook or your hosting's
            $mail->Host = "smtp.gmail.com"; // <------------ change with your host name
            // use
            // $mail->Host = gethostbyname('smtp.gmail.com');
            // if your network does not support SMTP over IPv6

            //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
            $mail->Port = 465; // <------------ Change with port 25 - 465 - 587 and etc..

            //Set the encryption system to use - ssl (deprecated) or tls
            $mail->SMTPSecure = 'ssl'; // <------------ tls (port 587) or ssl (port 465)

            //Whether to use SMTP authentication
            $mail->SMTPAuth = true;

            //Username to use for SMTP authentication - use full email address for gmail
            $mail->Username = "YOUR_USERNAME_HERE"; // <------------ Smtp authentication - username here

            //Password to use for SMTP authentication
            $mail->Password = "YOUR_PASSWORD_HERE"; // <------------ Smtp authentication -password here

            $mail->setFrom($email, $name);
            $mail->AddReplyTo($email,$name);

            //Set who the message is to be sent to --- CHANGE THIS EMAIL ADDDRES WITH THE ONE YOU WANT TO RECEIVE EMAILS AND WWIT YOUR NAME
            $mail->addAddress('EMAIL_ADDRESS_YOU_WANTTO_RECEIVE_MESSAGES', 'YOUR_NAME'); // <----------- CHANGE YOUR WITH YOUR EMAIL ADDRES

            $mail->Subject = $subject;
            $mail->msgHTML($message);

            // If send me copy checkbox is checked send a copy to user
            if( isset( $_POST['contactselfemail'] ) ):
                $mail->addCC($email);
            endif;
            
            // Send mail and report the result
            if($mail->send()):
                echo 'success';
                $_SESSION['sended'] = 'sended';                
            else:
                echo 'error';
                unset( $_SESSION['sended'] );
            endif;
        }
    } else {
        echo 'already';
    }
}
?>