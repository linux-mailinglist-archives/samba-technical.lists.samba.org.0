Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E96B2380
	for <lists+samba-technical@lfdr.de>; Thu,  9 Mar 2023 12:58:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=DR7paBT2zYsDdeVzhWm5wPXWQZ/36kb9ycSPTg/2YyA=; b=BbiVEmcTGXfSgQ6jsLiAec7qHX
	RnlXFuPSIRyooYuEif3omMr8fXo538gi+OrDa3BSplfH25PKBsu/7koQoVKtfmoGFyzN/CTr7tFFU
	aUOzCozc9D2o/MCW1/1+CR4I9xjWtY6NWRUEF+5rc5StTL5G6qWvvnxykQomiEHU5KdlebrXLHeI4
	D3vUR4gW+e+M7WVOOKzsILRot0XU+NoqqcO8gYm7VovUtwS73vkDYMkCW+EM/ZdTXQ4TxExoj2vwW
	Z0yjYSXqhd7A3FwnBVEP+qX0IgavFMlBIVMkMur5NTw1l8EKamaqdUBUs/zVKjIzUZaUtiElBb6yw
	wZpZsq6w==;
Received: from ip6-localhost ([::1]:35554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1paEtl-000f1f-W3; Thu, 09 Mar 2023 11:57:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20922) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1paEtg-000f1W-FN
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 11:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=DR7paBT2zYsDdeVzhWm5wPXWQZ/36kb9ycSPTg/2YyA=; b=NFt/tUqEapBcy9+DUa7gV+AO6a
 ZW402mc4ZPTEHzaSqOe8gljXZdfaXKwKNG8vfThU1ELhfxMWoinXn6MOinqjm3j9OkiHKaUNjVZ9N
 EB5K7BoD3uFFnl5FqVGmG85EePoaHCkanJt5iQD6oo11gqDvhccJVJG4uZ1t/3xXvFrw4OEvwiLxw
 d2iYMe3RqF3EY7PwCw+WzDjLKJZq6gaBDkrRTNPDWrNGz9H5HkhgrzRBGEBRP+VCtYTf8bRqXlZ8C
 y4j6z0eyJzxTAN7PiFlfIVcPMduULWEkJUsBIXpDBbQJhXPMJZ452NI4gaBCPso9/21AOzMJcZX1N
 ygHtjhDhOHV2Uri52YbHRob5yilzpS0/jkt5pYFcHOgJZuR5nwPYm2FmbES6AFpAMUcsbZfg2BdJ+
 7SbfKgz3oMrUQxjuUHpkNg2HdMl6PjfqOh8L2dNqn1tDqr8KXUtgMigR+9y1Z9vv1N0ZfceoGA6EN
 yeXzAXRk/lYqWIXi+MhGC23A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1paEtf-001kBW-Vc
 for samba-technical@lists.samba.org; Thu, 09 Mar 2023 11:57:24 +0000
Message-ID: <e933a245-7d14-6d11-6639-f134e522e899@samba.org>
Date: Thu, 9 Mar 2023 12:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Release Planning 4.17] Samba 4.17.7
Content-Language: de-DE
References: <21e36051-d0bb-e971-d8ca-1cab3dff65a1@samba.org>
To: samba-technical@lists.samba.org
In-Reply-To: <21e36051-d0bb-e971-d8ca-1cab3dff65a1@samba.org>
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

Sorry, the correct date is Thursday, May 11.

Jule

Am 09.03.23 um 10:31 schrieb Jule Anger via samba-technical:
> Hi,
>
> Samba 4.17.7 is scheduled for Thursday, March 9 2023.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.17
> has been updated accordingly.
>
>
> Jule
>

-- 
Jule Anger
Release Manager Samba Team  https://samba.org
SerNet Samba Team           https://sernet.de


