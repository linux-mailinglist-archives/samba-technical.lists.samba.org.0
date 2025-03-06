Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C24A54DEE
	for <lists+samba-technical@lfdr.de>; Thu,  6 Mar 2025 15:36:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Ab/7I0vUHWsNsHCrw/QoL5SA1B8oTcGwSpkOvwfejvA=; b=pn2OHed5VWqqMaGDGwrQZEAneB
	bc89xO/MUbvi8fqwYf8GQuTBR3xRMVYcxgPObn6vgIYGcXEnAgUm9eeFzS8g2XtWI12VB9VxOHm19
	/EgZkVmGofAH9q4ndrAqxMjravO9P2pysOi9/WanS2KzeR2T4EiWdpPwejhKirAr/VyStaWFQpGdN
	4VuzeRpC8N52h+N9EvfNrN8In1WbfXnEwMU23WA26xoNoAQ50aT/q0sxrfapg3iQvoQCWYRErrSqK
	rV+maCwIlCpSuCLLJspN4nxSxq9kWweviI3axinnJCyq+1h4b+mYR4BtHHMTa3arA8N+qHKJD8Hfz
	PI/Q070Q==;
Received: from ip6-localhost ([::1]:23862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tqCL2-00FfbH-Co; Thu, 06 Mar 2025 14:36:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53868) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tqCKH-00FfTI-WD
 for samba-technical@lists.samba.org; Thu, 06 Mar 2025 14:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=IXK6vcV+IbgVWW6LlEg33AHlgWXLXGnnQRTpGNT8W2c=; b=MeeZ3feGiGg/JPyOu2tA7pxZyG
 QLt7xWeyOxBBpTU8LgHfZ+6VrKpyCqugWsx+jyrqAvXiGKlZFQd19AYLdLn1OQysB27gi2R9m3nEX
 pQ5Vszc8mFQK870L5K0SeS1QTRWz7CZBV1WTT+CKX8glg3Rbum4yxUKYgGnMzAr4MIN6TiA1wM+UW
 OroMo1mbjVPrGaTvmEURmbon0EsfYQO7+1eOmqIMolM3eTVJ9/S4CU28gT+mH1qYqh4az9hS9U50j
 CBXSoG9XI57PpakfXFRnu2uRMkZaUU2+sFoHfGSkaBUkW8CUYd3erk2OdLgquMJ7jgbC3O2oMcf7E
 /qP3Mn9qoZNCA90L6uONrhOsefTGVROHDYHcYjH9lh6FnGaurkQrRoEPU9gzK5o37xIhyo0uP8QOl
 3dn5Y6I01xn/2H7LnSZTKVht5g5bfKDNiwBivbvFBzW0imaBkjoa9lfQtyfEbTce7/pux/asLB7/m
 sVljRSEMViG7MTMYQhy+ocku;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tqCKH-003iSw-11 for samba-technical@lists.samba.org;
 Thu, 06 Mar 2025 14:35:53 +0000
Message-ID: <27247226-c25a-49f1-ae34-e13cc7dd2a7b@samba.org>
Date: Thu, 6 Mar 2025 15:35:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.22.0,
- Samba 4.21 has been turned into the *maintenance mode* and
- Samba 4.20 into the *security fixes only mode* (there will be a last 
bugfix release at the end of the month).
- Samba 4.19 is end of life now.


Samba 4.22.1 is scheduled for Thursday, April 17 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de
