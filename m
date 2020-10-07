Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5D285AA4
	for <lists+samba-technical@lfdr.de>; Wed,  7 Oct 2020 10:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=LMqVjCwfT0IWnmi9MH0vqgrNlu6O14AnyKF7MFnooxk=; b=rNVRciW5z0b9KsldSQqERYugZF
	Xpm9L3fsUbD4J9MS/r7CS4p4uYrWx2l6qLVQiSH8EDluUQ7MWy5/C6xHN+bmDmOSVqa1CC1YtaYGC
	alKcPNwTEmmsD/JGS2eGDfLaaB0rP8xXK4hwpAUYo5F8BblWZlqPQTemIhwSldeL4vgIM54s4Lb0v
	HQw+BCs4wHfOnWSLZyj26uU5yq3rUBSYzCbCA336n/xHtgeJIcwnatK3A0cSOq4YwfPjyM9AY3MMH
	BAzG704Zh2a88Ng9dMZzGLCzZqywaGeJ9KAPmyn2jN9nptzadOQN4oasfZGmu/XxG9TmEMQKwV20z
	sYLvPH0A==;
Received: from ip6-localhost ([::1]:37308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kQ4yy-00B5vA-WF; Wed, 07 Oct 2020 08:39:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30222) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kQ4yt-00B5v3-KX
 for samba-technical@lists.samba.org; Wed, 07 Oct 2020 08:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=LMqVjCwfT0IWnmi9MH0vqgrNlu6O14AnyKF7MFnooxk=; b=gZWNblYlErQlULSEcwDTw2GT1f
 nfh7wB/RkA3Okjsf2+abThdUwY8qxJ542pcY+fH4lSeZqPrpcX+tb6M7VhpgOiXn3ba/ICwt06+6y
 AkSINqJPpFw1WW+H+GuyD305jkr8YxK7k+L3IhuqNcQEoJHf/Ftl3BcC/jUMTmpnLs5HodHHs86V5
 CGxnh/t/wSN3lwSTAv5DsnKzwCgekWrPJC69DfcsjUYVuDEFx9mppcxLVcDEAC2zgWX04Nqd8DVoW
 Bg3z8ftvActvEYDPO3Hhs2UC3NhLSrJPAnvEYnbVwYiItZk3ROI07T1JjkYpRtDdrPHKIoY7K4/gS
 dGW6GWQZwQSqfT+iNR/XVj9fsRvOUHGnpZoEJ/KIuP/kvQyM4N+9hdI4UMBYefwAqpduKBzn5xqsh
 Cmj4PEVHLwSbQ0lK03/XBCGVBi9Oqdk3zHvFyiq4Y4s9GCProTVsD/w1POTXRylLBkKqtlDT/ol8d
 XaVvbuti6vnvoc+mJzo3aDrR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kQ4ys-0001r5-Bk
 for samba-technical@lists.samba.org; Wed, 07 Oct 2020 08:39:27 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.12] Samba 4.12.9
Organization: Samba Team
Message-ID: <ae5ef835-1154-b7b9-86cc-d22958bab07e@samba.org>
Date: Wed, 7 Oct 2020 10:39:25 +0200
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

Hi,

Samba 4.12.9 is scheduled for Tuesday, December 2 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
has been updated accordingly.

Cheers,
Karolin

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

