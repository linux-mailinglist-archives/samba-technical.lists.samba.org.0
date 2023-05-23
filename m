Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D648E70E1B0
	for <lists+samba-technical@lfdr.de>; Tue, 23 May 2023 18:26:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=5mcoNpXcRSaOXDsBNCjRyS67OEGsy3NcToOXqG/IOaA=; b=QwNmDuucRjv8b2v77VylmCucGq
	XZpec7IfxkVvf/bxQ37NwGcI79MwNh2qOsqhX+wX7au3f+AbAMtNIB0PTagEbrTUujzkKvNoIhe4M
	gQfT9cmn1mqrVzfKq/RIfdcQ5x02h9avp2xurb0QZy3ubItHPr4BUALiETkDqWZY14ZUfYGNGlcZY
	mdJ/CEwdsEAKrdiQ1ycvpC+GdyYmpmkr9h9Sd7lFFLyi6Hd05b5tLaQVvJ2v9mQxMGnEJznpByUvc
	xKOYtcxgFz8ppM+W8K4wcvnM60iigu3UnZFzVgUw6jUt4d2R6bRQeAHOaV9dS10syeGEJtasSt/Zl
	SGf8gP5g==;
Received: from ip6-localhost ([::1]:26012 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q1UpR-00BjKy-5d; Tue, 23 May 2023 16:25:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36796) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q1UpK-00BjJt-Nr
 for samba-technical@lists.samba.org; Tue, 23 May 2023 16:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=5mcoNpXcRSaOXDsBNCjRyS67OEGsy3NcToOXqG/IOaA=; b=BoAuYWerklnzYYawx6EtikPD1f
 khfBKewgyuLEu4UJCB+C3wl51DHwTw4q5Qgb6m2+pelzQLXV7vxINBKgsYtNzNTfRzvyQFv4hFJ1A
 5cgNHP2kVGGiCKJRJf9t65KdZOpsabydwpLBtto2PNoMo8eokOmudRBz1ARGdwCQMoteO4r/67W0a
 SozO6B3nPT27ypbbPo0KEOuoI6f9fYC5yE4BNjeGN+v5GD2bulrDDWWg6fUlcD0lC9gs+Dsj6r1kC
 Bv5+dRr0kCcfWQO1H9U22pbTHYzZn2JUznQY3QXECLfZ1rebcYqz+Eg3xtsTO3Ptmka57FOR82FME
 TCasuAazKbgWCLDXaZw9q1T17zjGsa+KXFznTFI2muvu6Az9pMCA7hzDE10hfeBGF2LYErBJ++VYd
 d+9HK6ksp0TrHHWLmP0E8EHfHWZkq4E4ReFxrzO1/zcKJ24TjrG5ZUex1A1Nf2WzJiSXDdONm58Ty
 ddzVoYgqBYXaR2SYX+o2XqGE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1q1UpJ-00BVB4-5a; Tue, 23 May 2023 16:25:33 +0000
Date: Tue, 23 May 2023 09:25:28 -0700
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Displaying streams as xattrs
Message-ID: <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, May 23, 2023 at 10:59:27AM +1000, ronnie sahlberg wrote:

>There are really nice use-cases for ADS where one can store additional
>metadata within the "file" itself.

"Nice" for virus writers, yeah. A complete swamp for everyone
else :-).

