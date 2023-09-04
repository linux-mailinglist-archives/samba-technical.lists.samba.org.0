Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDED7914E9
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 11:38:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=oONvoGmuUM6InrcuAv0NA/Ly/B/t92kK5iNTqoBOcPs=; b=c68zNts1cRw8MOXtFREKExM3/T
	theeXGQTlMBRiVHT2ib+4wlEFJ3hKxveeIJwZeUuRbRJnTbhJxH9bKoi6gS1cVBuFOdhVccyH8haW
	bkFp5GspKfEYuuFIY1W8A5QvtTVafK7atAFXb/dxAXD7ht6sZmpHJpvawmQG8x+l6xMhBT1YwoPZW
	Uh7iYz0UdaFxBgjtt0O7faTSoNXEEDdenG28lZH/zJgRlvsMAvgm0r//MN1WrVvECulYgbd+ZyZDf
	YSq+dn+dKbd1/GhhDqtcWNNllSEJX//0MKrmMY2INuhNkDCohldn0yzmrTLzXunXT1uiTltnIUTUj
	uFRWCOGg==;
Received: from ip6-localhost ([::1]:40920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd62I-000Jwk-Mm; Mon, 04 Sep 2023 09:38:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13092) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd62A-000Jwb-Hi
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 09:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=oONvoGmuUM6InrcuAv0NA/Ly/B/t92kK5iNTqoBOcPs=; b=h1rOHr70XH/Pmcl5YGUsUfIm2M
 UM+TNHL2070iFybOguoQkwFIi2OhlN9kq/wH46XiWaN4gmN6ePtDP8LW/+++ZHAps/Fo3/Tf0tAGL
 QqbP9DE6yOSkrOK111gomj7//uOPkQmxcLjk0PgAsyRQbXsLbWYrJwVv5O2i2Tsl9mE/ccMKBZl6d
 ZjS72BwTqCjb5dCkcoJXm1s9IXBoPbm9R355Ji7mA9vcHmJYkvpwEz2fl+cfKYWTQVZ31x2iBfm5e
 xa+JjzdfPXXDCQf1qbhHHw5NWFGJwpsxkIcxDlpb/1g6OshD/ZbyhwuvDdZ8OhfSJzYBfFXkj7Wzh
 GIR1wapU9f84F8wSPkXoVHAL+2UGcgLY4jkRasRdlji/cprTthIMo6ygFUyiLcdFSpKueMzds/qjd
 FG7p6obWtlEsDk/NhahiUNeMS6LsRLr2nrGQ8e2alYwNIDBsxnCpyqJtQgk94ERJEOJbDr4GqYmvb
 m5UTCf7bfV2LGGcg3lzY2oHb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd629-00Bg7F-32 for samba-technical@lists.samba.org;
 Mon, 04 Sep 2023 09:38:14 +0000
Date: Mon, 4 Sep 2023 10:38:11 +0100
To: samba-technical@lists.samba.org
Subject: Re: `allow trusted domains = no` and `Unix Users`
Message-ID: <20230904103811.58a0c060@devstation.samdom.example.com>
In-Reply-To: <2306152.ElGaqSPkdT@magrathea>
References: <2306152.ElGaqSPkdT@magrathea>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 04 Sep 2023 11:07:10 +0200
Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
wrote:

> Hello,
> 
> I have a user who set `allow trusted domains = no` in his smb.conf.
> He also set `force user = localuser` on a share. However he is not
> able to connect to the local share:
> 
> [2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0),
> real(0, 0)] ../../source3/lib/util_names.c:84(is_allowed_domain)
>   is_allowed_domain: Not trusted domain 'UNIX USER'
> [2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0),
> real(0, 0),
> class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
> create_local_token: Authentication failed for user [cortexuser] from
> firewalled domain [UNIX USER]
> 
> The change was introduced by df5fe2d835169161d3930acf1e9c750dd2bc64b6
> 
> Is it by intention that local unix users fall into the "trusted
> domain" category or is this a bug?
> 
> 
> Best regards
> 
> 
> 	Andreas
> 
> 
> 

Stop me if I am wrong, but doesn't 'allow trusted domains = no' mean
that you only trust the domain that the computer is part of, so local
users will not be part of that domain.

Also, as I understand it, if you are trying to connect to the share as 
a local user that the domain knows nothing about, you will be denied access, 
but if you connect to the share as a known user and 'force user = localuser' 
is in the share, then everything would end up belonging to 'localuser' 

Rowland

