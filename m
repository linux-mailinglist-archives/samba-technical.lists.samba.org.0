Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB54E60D2
	for <lists+samba-technical@lfdr.de>; Thu, 24 Mar 2022 10:05:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=tEH78lMV6dxcbcJiLD0RD6OtIHEDWec7MQdAq+8JYlc=; b=x/1WlBwCD5MqsyHPGJb2inlCxg
	k9HEuN0glV5pcauovT/GtOW3xHNhL4JVv3+Db0JQkKF9nFgo7ggA/JE/lf88JELUIfa6lgJuLWp6l
	tWmPF1Dy9cT/maRsuiMEZvAQHbfUvpTanaUMQ2f9oeMUx0r/Sv7R+q5KaQLQRMrQ5l1G130KQyBId
	qEo9vB+A9/f7kKUsR7YNYO0PkCrY2kgvQB4ENpMmgW/gM84aE3xG5pnkV9YcfnT11Iv3/D/EBELWq
	njKL680guoudlUGa9w0mT0m1t71UWFwcCEtkSLoRbDAWCyv56m0TyYtISV8q5Re6YKLhrh3WrBr0n
	cariraww==;
Received: from ip6-localhost ([::1]:25690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nXJPI-004mJS-Ic; Thu, 24 Mar 2022 09:05:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nXJP7-004mJJ-OS
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 09:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=tEH78lMV6dxcbcJiLD0RD6OtIHEDWec7MQdAq+8JYlc=; b=oSaWj+GBLuGj2ZUCXQ2Vqjk9nT
 ly7Ur/PqOUdd2ga4C5sCcYqRWEKgOQFGWvkToGnEr96Xyvdp/4jNhrUkWvvKNt4m8RkWzV/NKd1f+
 e0gTAa/sshSlUEBzoURaHOHvDGNMAB3rb0FXClnHG+HHmxqGjRkYIKKTOTZ8yCjQE2/UlC/R67lWB
 H9gTpcGh5YF2sAr2Ucl4ccd7eXfY79WLvcmMvMQwksRwmFUo4cGbLVXK1aMl/KBYaEDhIrtCNlx1D
 tmJMPuG73nR/u2OyZkhFEZETxutkkgZgH59Z/dpaJgkBvSZY3gulEIP6L3b04IAj89qnG6N4y++qd
 x06KccBe+TaBkRA0jaFjpkQomw8gRFn8tCvo8AFy3f6fOLpnFum2WWue+7o75Ru92XmYV5A72lri3
 ercfuNaCO2vhayF+vnzbQmkVMxF015XQxirXD++FwUaCGW24z79dlwxwxWAoVICGL/vu7ZGXj2ura
 cgiSW2utrL74+zEdXw2w28wW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nXJP7-003D1e-2V
 for samba-technical@lists.samba.org; Thu, 24 Mar 2022 09:05:13 +0000
Message-ID: <34f8dd3498a8ca684f20291adbcfd2d7350b0283.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: samba-technical@lists.samba.org
Date: Thu, 24 Mar 2022 09:05:12 +0000
In-Reply-To: <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
 <HE1PR06MB31488952C3D608E9374C7FC6EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <007c551a46cbad5f4e8179c156ce647891f519d5.camel@samba.org>
 <HE1PR06MB31486C485C9614D48D1B0FDFEE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
 <798cdbdcc5bb1f59af4d9c7353a569dbb55036d8.camel@samba.org>
 <HE1PR06MB3148D20F5FB86CE01ED06A7BEE199@HE1PR06MB3148.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2022-03-24 at 08:32 +0000, capricorn cap via samba-technical
wrote:
> We have another outdate Debian server with samba 3.5.6 with security
> = Domain. That was configured really long time ago.
> 
> I can understand that its EOL but any clue about why I am getting
> this kind of error?

Lets see if I understand this correctly:

You have an extremely old Debian server running Samba 3.5.6 which
appears to be a member of an NT4-style domain.

Is this correct ?

If it is, what is the Domain Controller ? A Samba PDC or an AD DC ?

Please post the smb.conf from the Samba 3.5.6 machine.

Rowland



