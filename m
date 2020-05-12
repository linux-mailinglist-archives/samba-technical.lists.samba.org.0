Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9516A1CF203
	for <lists+samba-technical@lfdr.de>; Tue, 12 May 2020 11:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/2PrrDzohgXzPAjIgvwjt1+2k+IrOfNDh2Gl1M+JYnw=; b=Vxe6f2uz3xqcjAlLF7XEuulV10
	IvR3NMAre6NhX5tGMqgaaXFRz77FeCtCWXfal8ntMRjZeYx73aEtSbVWWSjklcSprhYn6NWDZHEYx
	GCV2sICLwlgnbuJUkip3TPNON2VuqaZCYf5Xx3/isurQn1q8CuImUV4Enw3oqHuIZvTVBvt/3DJAy
	7WPT0FHExrmfPcNSOpx5GdX3j95GfJd0SIJu5FF3ctHsCbNaL45eYUqkX+DrOr0UrbnZRYo02XZpu
	tuJ/0mLXpjBm1+Rh+E3ZDGWlQD38iQ53tIDKkcDODOq8TTbxz6e1IdEOfXMieeSALwDUCOtQGvLON
	Iq0IFetg==;
Received: from localhost ([::1]:63786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jYRgK-004041-8J; Tue, 12 May 2020 09:58:36 +0000
Received: from zmf03.inasset.net ([82.193.37.22]:54090) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jYRgF-00402a-5g
 for samba-technical@lists.samba.org; Tue, 12 May 2020 09:58:33 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zmf03.inasset.net (Postfix) with ESMTP id B4F51BF6B5
 for <samba-technical@lists.samba.org>; Tue, 12 May 2020 11:43:00 +0200 (CEST)
Received: from zmf03.inasset.net ([127.0.0.1])
 by localhost (zmf03.inasset.net [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZCr1eP0QifWz for <samba-technical@lists.samba.org>;
 Tue, 12 May 2020 11:43:00 +0200 (CEST)
Received: from dakota.saitel.loc (93-34-9-216.ip47.fastwebnet.it [93.34.9.216])
 by zmf03.inasset.net (Postfix) with ESMTPSA id 7CD74BF22F
 for <samba-technical@lists.samba.org>; Tue, 12 May 2020 11:43:00 +0200 (CEST)
Message-ID: <c6c8418330b35b7397a4b55927e98ac66bd2d19b.camel@saitelitalia.com>
Subject: Problems after upgrading file server to 4.12.1
To: samba-technical <samba-technical@lists.samba.org>
Date: Tue, 12 May 2020 11:42:59 +0200
Organization: Saitel Srl
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
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
From: Daniele Dario via samba-technical <samba-technical@lists.samba.org>
Reply-To: daniele.dario@saitelitalia.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Samba team,
some days before release of 4.12.2 I upgraded our file server and our DCs to
4.12.1 from 4.11.6 and everything went fine. These days of lockdown not many of
us are in the company and as far as I could test from my linux box, auth and
network shares were working.

These days we're getting back to work and one of the guys told me that he
couldn't see the files in network shares.

He has a Windows7 box and as soon as he logs in, the shares are mapped and it's
possible to browse them from explorer but in a few, if he tries to browse them
again, he gets the error message "the process cannot access the file because it
is being used by another process".

I tried to unmap all shares, restart and some 10th of seconds after login the
error comes up.

I tried to open a cmd prompt and if I run dir on a share it works. Than also
explorer works but again after some seconds the problem rises again.

Before to revert to previous 4.11.6 that was installed, I'd like to know if this
is a problem related only to this particular box or to Win7 or if you have some
hints to help me solve the issue.

Thanks in advance,
Daniele.


