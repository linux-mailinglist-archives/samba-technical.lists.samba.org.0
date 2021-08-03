Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 437A33DE981
	for <lists+samba-technical@lfdr.de>; Tue,  3 Aug 2021 11:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oO4j8DoG/a8uve8heGeQEf8kptxRsIQqFjaq+IiV/LE=; b=XgoQaiGU2pZPUym4pTBPaU2CsT
	ffuxGhxSevjcL3JUIJDgDOinhejekXWlB0ndFBS9OcqKGNEhwvOfXP0Grqhrey+8q8+GWXuRAL9Kf
	S9521D6R6AkJX4HYxLqQ8bQ8qH9LPoueW+D3aMSW7O3E0ADuSf/AX+ns25wubtYPFELNMSjGjm+uv
	PQU96OB7MYmoDPY5zk4Rpca2C3TXPqC8Yuvn0jOXx0Y1002+DzGyGcp2RVDxv7vF501KwGKvFbbVM
	v5HbpIZ7fepfY0YrhQtB7cVwnYMjeKTrj6747eZ23gEDnqoXGIFzCl80p1bUo2i6hHTxDctgrVnlu
	+HdtMKzw==;
Received: from ip6-localhost ([::1]:48876 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mAqQZ-004An3-Pg; Tue, 03 Aug 2021 09:09:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mAqQU-004Amu-LK
 for samba-technical@lists.samba.org; Tue, 03 Aug 2021 09:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=oO4j8DoG/a8uve8heGeQEf8kptxRsIQqFjaq+IiV/LE=; b=ibHt13giaWg6gbDezXRCdlyspb
 SUV/xmnZtjBQCVwJnsZma5TBOjRQNBT1NsKvkGecH2fvwGiXuum3OFu+725c+zFU9CNBsWqGzs9GT
 S4sbkcZACEuPoTbUTLW9p2zwnYG0qVaMfDycdvAFcg0wIjEeSQBC02H5M9LwtDL260QMzcq9xZMDD
 BpjsFu6211yPZyDptWkW1KDMLvBWwc+ImwYSohftwALKILlUM4tVcMtjik0nveh3ipTxE36OWe1Au
 94vzL1VwmmMvwV5Vz1ixbMSZ6m59zUXASDCpiwL1BBRuwNESK+RZDkTpxbsZwusPU8587M7aM7Ti1
 qP1NagtYJdvvg8fB7xbnj7YgrCW5yFdqeJoqWbOD3dJODIAQ/vKr6Jp3D+UdeXhWidTTqftCq0ilQ
 5IzxXEZvVFaKdhV/Etil1a25ag9z6hfvgVysqKa+u5JMi1qx993q+xM5ZpQu2N4a3EeewNDyy9WnH
 l8OhLjtmsZ5M2QbADxDTCTLN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mAqQT-000NQC-CR; Tue, 03 Aug 2021 09:09:29 +0000
To: Isaac Boukris <iboukris@samba.org>, Andrew Bartlett <abartlet@samba.org>
Subject: Re: Autobuild paths too long again
Date: Tue, 03 Aug 2021 11:09:28 +0200
Message-ID: <4329737.EkWKPh09Hk@magrathea>
In-Reply-To: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
References: <f3d35fd592abf06db2277ad15bf22f3a9804b7ba.camel@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, August 3, 2021 6:52:09 AM CEST Andrew Bartlett wrote:
> Since (I'm pretty sure) this commit:

Hi Andrew,

> commit 7e9c97ba1cd960df2688718561c4a117b79b259b
> Author:     Isaac Boukris <iboukris@samba.org>
> AuthorDate: Thu Oct 8 14:00:44 2020 +0200
> Commit:     Andreas Schneider <asn@cryptomilk.org>
> CommitDate: Wed Jul 7 15:01:22 2021 +0000
> 
>     selftest: Add test for one-way trust wbinfo auth
> 
>     Signed-off-by: Isaac Boukris <iboukris@samba.org>
>     Reviewed-by: Andreas Schneider <asn@samba.org>
>     Reviewed-by: Andrew Bartlett <abartlet@samba.org>
> 
>     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>     Autobuild-Date(master): Wed Jul  7 15:01:22 UTC 2021 on sn-devel-
> 184
> 
> I've not been able to push.
> 
> Can someone please fix this up again.  The issue is that winbind socket
> path is too long, which gives:

But the name of the env

ad_member_oneway
ad_member_idmap_rid

is three chars shorter than ad_member_idmap_rid.

However I would suggest we check this early enough and fail earlier to be 
sure:

https://gitlab.com/samba-team/samba/-/merge_requests/2101


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



