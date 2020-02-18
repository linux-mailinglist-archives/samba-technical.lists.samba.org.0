Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CA4162DA3
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 19:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VQyqWcaG6/o+98HavKxxKvjWEpiScrZxL1n65gRZYXA=; b=XFJiUQxNP4bOC5s/6MIN6jFnYG
	u7c7+9CabttdueSjyEw9YA8uc9PpIN2/Bp20xgjt3MSxxQsjb27PPYH4pxEbDIwI4I9AMdHg6d0LU
	w8Rle0gEAyjn5JmqW+1+DYP4PxuOjYRRoM6PgSvHOOpMqJ0Kb53t17zy5YcnP8OHsGkM3is1SayFl
	lXd4K8v8hANX15qjwmcz4LdsDM4auZ+8NVq8mizYG/VnX0Hh67U4DNwNg0IJC/zOGkYRbBQY1rkwM
	QRIyrfr7vRt9sdN8Ls+nAFEdSBcw0677I+T2bmrpzD1qp91KnBz14nD5rHeUJIHFif1BFzDF+ADmo
	+odsof9w==;
Received: from localhost ([::1]:21482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j47C9-00APyZ-Cg; Tue, 18 Feb 2020 18:02:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10732) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j47C4-00APyS-Rf
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 18:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=VQyqWcaG6/o+98HavKxxKvjWEpiScrZxL1n65gRZYXA=; b=ksUCeNjWkT9MYY6xqqmhx1iUBR
 kNrJ6fT1eoKgt66C4n9QX6eU0MsWsm54GDnsvzN6jQZTrpCMVKY6W9g7kJfuR3inApW85bPqQpEA1
 6TErLsXTAxAns60oKUdJOkZsicXATJ9uOXHH8mTtHAhaaa2VQzP9o1o3za/zL1yYOLOh/Dm7uYmqN
 RVPX3bTnsDC4JsA4IzXNj2Wx41mjXB5VJ8ksoaf2RQD9s4Mb76CqWNqEt5nviwI/2NlF2SOc+Vz8O
 d7r/ZJ11MhLjN1R7u9ZX/qDM9dLIDy8+D22MtbKb7Z+X45XUK9domd0HeHHrDVR61aRu3C4CZFDYw
 GNc2fh5IjGL3ar4T0h3dxJDLtnn59L43NYXH6mjs0j5rTQSmSrToXS40QB+SMzai/XwTulmZpUQAk
 Jl814quQ2lxuP5Jiyee0NQp+CicqJACwhJDeGrPW+hSwcHiD0YUwtmlXbN6msk+LU6gCPTRDqr99A
 tiDjSUkDXlryn4cgDyUjXY7T;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j47C3-0000ap-93; Tue, 18 Feb 2020 18:01:59 +0000
Message-ID: <e3096e1aa34f32b1e10960c3b68658065850330c.camel@samba.org>
Subject: Re: ADV190023 | LDAP channel binding support
To: Stefan Metzmacher <metze@samba.org>, Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andreas Schneider <asn@samba.org>
Date: Wed, 19 Feb 2020 07:01:53 +1300
In-Reply-To: <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
References: <CAC-fF8Tp_mPkza63VxtiXm3fdnDSfr616roVnK-PwDXqBodnhQ@mail.gmail.com>
 <6408dd32-53f3-2622-d6b9-04928793cc8b@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-02-18 at 17:47 +0100, Stefan Metzmacher wrote:
> 
> I looked at it a bit, see
> 
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=ac8fd11f1d4b9deb48d6c7942af0c83b52d69d7f
> 
> I think we need input from dochelp to answer 2 questions:
> 1. which kind of channel bindings are expected/used by windows?
>    I assume tls-server-end-point. I guess MS-ADTS would be the place
>    to define these details for ldaps.
> 2. how is the ChannelBindingsUnhashed blob constructed for
>    NTLMSSP (MS-NLMP)

There was a very, very old patch from Microsoft to ntlm_auth to do this
a long, long time ago for NTLMSSP over HTTPS (to aid Firefox's use of
ntlm_auth).  It was at the wrong layer but it will be the same protocol
I presume.

My current inbox doesn't go back that far but finding that might be a
good pointer. 

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




