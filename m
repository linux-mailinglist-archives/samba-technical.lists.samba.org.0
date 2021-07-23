Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1783D3BD7
	for <lists+samba-technical@lfdr.de>; Fri, 23 Jul 2021 16:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ghoTm0iUwEZ9WZVIhA3+dSw2xiiIKv6QBLfNHkzQ7nY=; b=rMueUn8ZqU8fOSdoyC5REX7gMv
	LyH/VHkHCGE2xhFZ2nwA4N6kzRXos9TZtf4JA6WPQEN3RkHn58SXKWsAV2QAA0da0iNTrbfDYvIe7
	J7w67KIiM51iPNs54t3LaWl7jPEq29Fjj1/hkg3dDlCyYxUGDQ1HcOOBBpX7QPpNc3gOIhuqefXU7
	g7c7pQIOKUOF2t9Prw6By5lDhPLosvEzowpIppJ9ItrS9etdMioNW8i4acT8JeSKZbKsX1YFzNLjZ
	gb3yUTnWEV5LcpWbcGL3OMe9TOUfMkXFewXIh/avmgaI5UCra5RXVQy0jmYjUDqWNlah1hwUYchqC
	OC0rrDGg==;
Received: from ip6-localhost ([::1]:47510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m6wGD-000TBS-23; Fri, 23 Jul 2021 14:34:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25258) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m6wG7-000TBJ-PK
 for samba-technical@lists.samba.org; Fri, 23 Jul 2021 14:34:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=ghoTm0iUwEZ9WZVIhA3+dSw2xiiIKv6QBLfNHkzQ7nY=; b=1WhTHOdy7eX+3BIXAigEkHDECw
 WEDYn9QPgyG08Dpq+c9USNh5tNYNE39kpzdOwasevqB/s/YTUdxlwV7qSVDFKioCIarXrRKglKIMK
 mGFtQngAM57IWDADG9DuPuhqG82vEDjHGi61eHDK/Pp9lodm0m8Amwb7KQtC0MzZN1pAaNSiA+UQw
 xJATKbGHZ0CbsyqpidqCVIr8YvYlJikNor07T1qjx06owDotxvBiJ/l1YBvhIODgwDm9SkvX3TmC9
 r0VGYlo62n/MlBPDUzccI+6rB2poH1TNXG9WxPmq9d0uQG7db88CFnnMUvZwmQuyU+o81OZH4kpnC
 qIINkAYE0ccDS1NnEXwPcmh59uyrNN7npPsf++Y9D6VdsgMs3YbwEfCnJlNyuVrj/PVcGoo4+uRSC
 OpgLhcXzFRlc6hpgIKweBxXYn+U6dceWV1gs5zXWr4jkBKxOTPv97fu6hTSK4wPiU4C6fcPVMpokM
 sicWLJU100CQqncKvttXXGBA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m6wG5-0001vO-NU; Fri, 23 Jul 2021 14:34:38 +0000
Message-ID: <1994c456624dc6a714a95b76151208abab432a73.camel@samba.org>
Subject: Re: PAC Ticket signature in Heimdal
To: metze@samba.org, abartlet@samba.org
Date: Fri, 23 Jul 2021 17:34:35 +0300
In-Reply-To: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
References: <3114701225467154473e2ad34c5ffa4b943cfc86.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze & Andrew,

On Sun, 2021-07-11 at 16:20 +0300, Isaac Boukris via samba-technical
wrote:
> 
> > > https://github.com/heimdal/heimdal/pull/767

I got it working without changing the plugin api significantly,
although it could be simplified as suggested. While it still needs
a massive cleanup, if the logic is ok then I think it shouldn't be
too hard to get ready.

Thanks



