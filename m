Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6DACF371
	for <lists+samba-technical@lfdr.de>; Thu,  5 Jun 2025 17:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=UeXMQzOR5tXwCh66zY26Ol0E1sTuwj6VD0Z+1YLLlWQ=; b=XKxQ8AxlVBOWqtf+BOOhlQj6Uv
	D7+Cnzkv66pTId4DzXPRJ4GN71ZfVMjWj82NSxjvo3W1IkeDytHF4yKE1P6Na0Ljf1syhtkfw/kxi
	5j6wTg7aXOxqszLjMgehwOxmbI4ZvhGBaW7xzYFaTEvpTYVMh02PpOoD4ORIhacZ6pV9v3tfwszzF
	vqyIuA07fSe6MhdTAg65Rb5gXSGNxML1wXWKNcaTqXEP9k9+jRt0pLWkooKcvkwTUWWJrRUwwIrvb
	994ZnEGMS0AgKva8QvuDLBIHBbcKtq4wjyfTq9B5TrFyPiwj0rg5r2JoWAbCbzYh564yfshJhO22f
	AzGIzzeA==;
Received: from ip6-localhost ([::1]:35870 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uNCsl-006gF0-1s; Thu, 05 Jun 2025 15:51:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18208) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uNCsg-006gEg-QS
 for samba-technical@lists.samba.org; Thu, 05 Jun 2025 15:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=UeXMQzOR5tXwCh66zY26Ol0E1sTuwj6VD0Z+1YLLlWQ=; b=nuQdiQzFqEGojA5IWEGfjRuSG7
 lTA9D/7rlM9ZgWS9YEkO3GsnD0XtuL4k17NXNIGVBp5QCkLylwPfAcrGh1KMgoRSEwBP+WFXHu4Ql
 t6ofioI9CzSUI3vQHQWM9L/uHQtMeiyJ1EkzS6p7+8ADpnb07eCH+B6nE5UsVkKrpPMheVADlyrJ3
 8rrrPVe9RWf+ISUosypaCINNdKDDPw3Vr4e0NT+wYuXmx0g5VZd249dUfzj06fUE6g5mX4RFBCSyf
 LVwzvMaIDARmgIjH9tIu76nVJ8dih88UtrmWEQg3GcythkcCdpwOilZWWviwTTm5UF3oRyvj3PEFu
 VbfBgN/8HMpWhi9TtHDUZKAel0tZjCmmQG92t/1tTipTb6NLnj8yB+6LNK+Vt2V66ggRfcFdS0NOh
 U7U5+LksGTmPdvLBjqw3oMMSGwhSi+VyCqMznv8vU9ysPCD+pLi83OPiT1ptQRuLymyGxSkutIMfX
 e52U08OMSd7jW9zEq9cwK6z9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uNCsg-009BUJ-1i for samba-technical@lists.samba.org;
 Thu, 05 Jun 2025 15:51:50 +0000
Message-ID: <0c837363-94c9-4d45-aab7-8861e1fb9a39@samba.org>
Date: Thu, 5 Jun 2025 17:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.22] Samba 4.22.3
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.22.3 is scheduled for Thursday, July 17 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
has been updated accordingly.


Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


