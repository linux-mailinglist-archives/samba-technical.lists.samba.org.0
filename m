Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C84EECE1
	for <lists+samba-technical@lfdr.de>; Fri,  1 Apr 2022 14:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8WdLd39v9yGFxyEucJV4K/M8r8ObF9WKU6p03V9anQg=; b=5DeqjN6Bry0cRCzHiUARMBYWgw
	mRFfzNp+vXoXlx9huvbeaAPY4Ej9mVvbCGUbGwar6Ab1C3oLzWEencXKRBUsGX0ewE+ZMke0KuDTu
	xuU7DPxk0pW+kVioVj2bLtDPwnOduxhASojOFiYLA6HsHPsTRvMYIgAbWxApcrHHU55g2Eh7WXF+c
	9P5W4ho/4JqJDRk0/wOCDH1l9nP2kYMS5xbJxtad3Hj/WtSoWh5izVoVpyEmSzqDxedeJwNnsNtfR
	iqZuB+Ac5muBzJHWQ/OVyN59oHU5xTKtTcoCHq7ZPi/oejHDY3dZtFEGeiP3d/uGWR/NoCFIvO+j2
	XRjFYGTA==;
Received: from ip6-localhost ([::1]:64722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1naG4x-009AOc-OX; Fri, 01 Apr 2022 12:08:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1naG4o-009AO4-Tv; Fri, 01 Apr 2022 12:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=8WdLd39v9yGFxyEucJV4K/M8r8ObF9WKU6p03V9anQg=; b=B20ohEy01eXRrBRPLHsseu8gdO
 Fmfr7WHxaSTgjjct/fmq5vOUvxtcFlT8sKBUseIDTb5N7JZz61lQd2HIiRafuLztnhSABmEhDOW3K
 58IouQl0FHRR/0DTOH7UBnQ0OagzHc4/1G3dHLrdwtPSBngrmQ2cxb3iISyMMxSNhQ0EJtdY8SE9o
 VRh8zxkLVAdTNJuI6/ytPk9JwNpLS0BRLv9HTfGF0tOzGzZuxxAdVBc9Dcgv1Np2ZLaLtiHoz0Ksn
 kZgDVKpmY+qzqmOwOA3vSwPcWxH5ItZaq40ZQnhK0Zj37E47JBTghq0NNDCCc6RDvv8hOmJHR6c0A
 93uawdJcnO+98C7I3z1Aeki/8l+oh59iXBrJJG+a/BHnB9L3oAMazPUdBEWuduyNj56TZPM+5NCKJ
 8j9RZ/QYca7eYEdfbcEGZquKmS7QnI9aXDkS1NC/LK4g/g63LOp5u8MYaMQZjvgoWe5npqPv11fua
 uw1siLHPSxGvAXTrNpTKzn20;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1naG4o-004lwC-Ir; Fri, 01 Apr 2022 12:08:26 +0000
Message-ID: <0a610624-79ce-6fa4-bbe7-3612969e5b74@samba.org>
Date: Fri, 1 Apr 2022 14:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: go IPv6, fade out IPv4
To: samba@lists.samba.org, samba-technical@lists.samba.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: "Samba.org Admins via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Samba.org Admins" <go-ipv6@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Dear Samba.org list members,

as you might have heard, the pool of IPv4 addresses is exhausted since a 
couple of years already. As a result of that, companies can buy IPv4 
addresses in online auctions and the prices for that are going crazy. 
You can have a look at https://auctions.ipv4.global/prior-sales to see 
the current prices that need to be paid. These days you can get more 
money out of IPv4 address blocks than out of Bitcoin actually. Don't get 
us wrong, we don't recommend either actually.

Also our hosting provider was forced to raise the prices for our IPv4 
addresses considerably and announced that the prices will be raised even 
more in the near future. We're expecting that we'll soon have to pay 
more for the IPv4 addresses than we pay for the server hardware itself. 
For that reason we're planning to get rid of the rising costs of the 
deprecated IPv4 addresses.

We're offering all of our services via IPv6 since many years and we want 
to switch them to IPv6-only in 365 days from now on (2023-04-01) to cut 
the unpredictable costs of IPv4.

Most people already have IPv6. If your provider doesn't offer IPv6 to 
you, you should contact the provider and ask him to enable IPv6 asap. 
You might even ask your money back if you had no IPv6 in the last couple 
of years, because the 10 year old RFC 6540 mandates that IPv6 is a 
must-have for nodes claiming to support IP. In other words, if you don't 
have IPv6, then you don't have internet access.

We created a web site for you to check if you have working IPv6 support:

https://ipv6-test.samba.org

If you see only a sad face, then you have only IPv4 support, if you see 
a sad face covered by a happy face, then you have IPv6, which is good!

Apart from your own internet connection, you should also check that your 
mail provider supports IPv6:

You can *receive* mail if at least one of the MX records of your mail 
address's domain has an IPv6 address assigned. 
https://mxtoolbox.com/MXLookup.aspx can help you to look that up.

For testing if you can *send* mail to IPv6-only mail servers, we've set 
up a test mail domain. If you send a mail to test@ipv6-test.samba.org 
then you should be receiving an immediate mail refuse error while the 
error should contain the text:

550 You can send mail to an IPv6-only mail server SUCCESSFULLY !

If you got that error, then you can mail to IPv6 domains successfully. 
If you get no error message or if you get any other error message, then 
your mail provider does NOT allow sending to IPv6 domains.

Luckily most mail providers DO support IPv6 these days, but there are 
still some well-known ones which don't. If your mail services depend on 
Yahoo (like yahoo.com), Apple (like me.com, icloud.com, mac.com), gmx, 
web.de, t-online.de, posteo.de, Protonmail, Gandi, Mimecast, Zoho or 
Rackspace hosting, then you will be out-of luck probably.

We believe that providers who still don't support IPv6 in the year 2022, 
have been sleeping at least for 10 years. If your provider is one of the 
sleeping ones, you can try to wake him up (good luck!) to be able to 
keep on using our services after we disabled deprecated IPv4.

If your provider doesn't wake up (quite likely if he slept till now!), 
then we recommend to switch to a provider that does support full 
internet access, which includes IPv6 of course.

In case you lack IPv6 in your corporate network, then ask yourself if 
you acknowledged the work of the networking team enough in the past. Buy 
them a coffee or a bottle of wine when asking them kindly to enable IPv6.

We are aware that in *very* rare cases someone might live in a country 
like Greenland, where it's not possible to find a provider with IPv6 
support. In cases like that the friendly guys from HE still give you a 
possibility to use IPv6, see http://tunnelbroker.net/

Side note: Also github still doesn't support IPv6 and doesn't show any 
sign to improve this 
(https://github.community/t/github-com-not-reachable-via-ipv6/216624) - 
samba.org switched to gitlab, which DOES support IPv6. We think that 
nobody should deal with service providers that don't support IPv6 these 
days.

Please don't discuss this further here on the list (we'll ignore any 
list replies); but you can send any feedback (both positive and 
negative) to go-ipv6@samba.org. We'll consider your feedback for our 
future plans.

Your Samba Admins

