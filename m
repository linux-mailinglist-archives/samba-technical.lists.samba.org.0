Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D4326C302
	for <lists+samba-technical@lfdr.de>; Wed, 16 Sep 2020 14:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=OX5Y02kMDLPeWkstWZdF5HI9eArQ7GGxVXQiSx9vTK0=; b=O0yJ4AGkW73eZw64ROkcfvLR2C
	Q3R2HyOrarK+BlibZUU5JJKkl/DpKB21ZEs5FICSfHHx/ecK8l79PfoGDMFUse8s8fo4bv5B2JXTk
	fODAWt9K1d4mTjbQMV4nsF7RW5/qO4hib1+UtFnFmUr6y+a/1qqcGjWQ4MS+tRyq2XeWipPF7doag
	00bi846IH2zMQncoQlmMZDGMPvq7trsjdHB0GWAudPO3GPibk6Onn76JE7VNmG5f2i9pM1/VEvm8d
	7PZpoOSDIgpVWUw3fhZ091A55KFoiPxEJd98Bb2Sawax6THeowYtD5VuZ5dVio4vf9i+aC9K589Wu
	HY+Lnkaw==;
Received: from localhost ([::1]:41622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIWzr-005mKB-0G; Wed, 16 Sep 2020 12:57:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIWzi-005mJi-TG; Wed, 16 Sep 2020 12:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=OX5Y02kMDLPeWkstWZdF5HI9eArQ7GGxVXQiSx9vTK0=; b=ZNI9lH0C2aXlKB6JxG0vUtoR6I
 BDduWpo83bQmz6AC96n5PpEZi/WXpGT1bHUnrlx4k9sh7igxqYBUrJesZXGEmoaoTLvcwz6eT3/pz
 JAaJKyySJmp1lWH1ty5Ch9w+k08hP5xWLs6wuW7Ke0z21Fs7fzJEt6MgBmyS8K3d7R1WzYxJ0CtbR
 N0f8kPoFid3Nt4UR3vlRd/P6uxKKoXopULLSaRlBTo/keQEh7At++re4lRfiCQ+LUwHknBr+JFnrl
 GugnpjjGhBXc6TRwQralds0snijwOluzCq2XFB22bfK5Wy+nUCdKZleYVK+nIVp6KWYmqj40/VDlt
 clU4Ultvm7UhRYokVUwzMdBfkqg/YWxtbfh6c5z7XQdssh1XykV9Jv2Y55GTVBLSpIzfcE6KStpCD
 ORwF5HOchIeUSs5f6JcV4ZQeGDfa0NRXkCjxyplZoP/u595bivWnt48KKPlsQgJZH51avlJRKsyZ4
 gx6vW7rpl/DejA+LyQASvy2x;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIWzi-0004ps-Ij; Wed, 16 Sep 2020 12:57:06 +0000
To: samba-announce@lists.samba.org, samba-technical@lists.samba.org,
 samba@lists.samba.org
Subject: Samba impact of "ZeroLogin" CVE-2020-1472
Organization: Samba Team
Message-ID: <b5e56294-14d4-7cf6-de63-c8a03157e34a@samba.org>
Date: Wed, 16 Sep 2020 14:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The following applies to Samba used as domain controller only.

(Both as classic/NT4-style and active direcory DC.)



Samba users have reported that the exploit for "ZeroLogin" passes

against Samba.



Samba has some protection for this issue because since Samba 4.8 we have

set a default of 'server schannel = yes'.



Users who have changed this default are hereby warned that Samba

implements the AES netlogon protocol faithfully and so falls to the same

fault in the cryptosystem design.



Vendors supporting Samba 4.7 and below should patch their installations

and packages to change this default, as values of:



 - server schannel = no

 - server schannel = auto



are NOT secure and we expect can result in full domain compromise,

particularly for AD domains.



Some public exploit tests, such as

https://github.com/SecuraBV/CVE-2020-1472/blob/master/zerologon_tester.py

only confirm that a ServerAuthenticate3 call operates, but not that the

ServerPasswordSet2 call required to exploit the domain also operates.



We are well aware of administrator concern and are looking to provide

patches that provide mitigation here, to make the ServerAuthenticate3

call also fail.



We, like Microsoft, suggest that 'server schannel = yes' must be set for

secure operation. This is our equivalent to Microsoft's

FullSecureChannelProtection=1 registry key, with the difference

that it's already enabled by default in all Samba major versions

released in the last three years.


Finally, we would note that Samba's audit logging will record

ServerAuthenticate3 and ServerPasswordSet calls including the source IP,

details will be provided later on the options to enable.



There seem to be some legacy software, which still requires

"server schannel = auto". See the following bugs:

 - https://bugzilla.samba.org/show_bug.cgi?id=11892

 - https://bugzilla.samba.org/show_bug.cgi?id=13464

 - https://bugzilla.samba.org/show_bug.cgi?id=13949



We'll add additional hardening that will allow

administrators to use "server schannel = yes" globally

and define exceptions only for specified computer accounts.



Our progress can be monitored via this bug:

 - https://bugzilla.samba.org/show_bug.cgi?id=14497


-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

