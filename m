Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210C307282
	for <lists+samba-technical@lfdr.de>; Thu, 28 Jan 2021 10:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RgMkcjWa0uGBfFuCFqM2k4zxInrYUIG5noFgQquMOFc=; b=ZE1abjjEQb4DF4SrItdTlcTamj
	1obEnPXP1YROL7UlrttF6iajU2hcv6bloKp0AT0GIGuzl+Wa12cORbqaY0IpzpnjdaABrk9O8c2tb
	GGQZns+RYIL/fUAFFfVEL2dDvfPX3AAdk0rjhbYMOH47RjRYn7gcAkKujIzZ1tiaSI1Ekjs5RzVGX
	Gig+lMMmMIROJVDcdB2uNc+QZRsg1Da1Iu0yY7JSzoj1HsCRHFKorSs2uOLBgLSU8kT660y4Xx8GF
	R//Q+3MnfrZ1E2gbWPHkISrq9whHA9wTv8afX/t3A1HPMi6jVEvSAIZq3W8VC9aMv3Y5NBz0UDCAx
	ivh1ydww==;
Received: from ip6-localhost ([::1]:18990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l53YX-007Ugd-RZ; Thu, 28 Jan 2021 09:25:37 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:48779) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l53YR-007UgV-BB
 for samba-technical@lists.samba.org; Thu, 28 Jan 2021 09:25:34 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRFSF46Syz9sT6;
 Thu, 28 Jan 2021 20:25:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1611825917; bh=6TEkPqSoze+ZmakL4ll+SnGmjLGpmn6P9hb42Tv3OC8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AtRCLf/XUdRGp/6gm85QKqzCu2c2wYZxmB3RKr0WRkiKQxNom1B7aoA6E+LtCWOPQ
 ZFtXaGlW3Kuzvue2dejRggUTbG8Xer32H13gAvBTWhci2jdrDhNCkyzHP8SCZAEAV/
 D12UA6BHXgfPJKG4XSEGXwiXhkTlAJGQ0XWww0tBOBLkbzicyG2YF0ee9+QI/Pv7nJ
 9RAHLT5twOifXw85wvT3F8zaZ8Vw0QMLD6y0T7JZwasK4XK7IuutN0IiVwqxaCJ4d1
 AZBxL4NlKrFjFSuj6PC0V5SMwXyDa7wd90mArK4Mf7SAVW9OTtUwCiTFuptASj2DxH
 YGVNBi0bU8Pfw==
Date: Thu, 28 Jan 2021 20:25:16 +1100
To: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Subject: Re: about active/active clustered nfs with ctdb
Message-ID: <20210128202516.40677c83@martins.ozlabs.org>
In-Reply-To: <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
References: <387bc94a.4501.1772917b1cf.Coremail.wuming_81@163.com>
 <20210127204613.5735addd@martins.ozlabs.org>
 <545e1ab2.ef9.17746b3e063.Coremail.wuming_81@163.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hmmm.  Sorry, I might have read too quickly and misunderstood.  70.iscsi
is only designed to run tgtd on nodes and export LUNs from public IP
addresses. In your example the nodes are iSCSI clients, mounting a
filesystem on the LUN and exporting it via NFS.  That is very different.

Sorry for the confusion.

In your scenario, is the filesystem on each LUN associated with a
particular public IP address?

It would be good if you could do this without modifying 10.interface.
It would be better if you could do it by adding a new event script.

peace & happiness,
martin

On Thu, 28 Jan 2021 09:55:29 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D <wumi=
ng_81@163.com>
wrote:

> martin, thanks for your reply.
> No, I did not modify 70.iscsi. Maybe I need to make full understanding of=
 it.
>=20
>=20
> after many days reading/debuging the source code of ctdb and its shell sc=
ripts, I found the key point in the script 10.interface.=20
> my modification  is:
> 1 create nfs share(mount fs, modify /etc/exports, restart nfs service ..)=
 before any public ip is added to some interface
> 2 delete the corresponding nfs share after any public ip is removed from =
some interface
>=20
>=20
> I tested many shutdown-reboot cycles (of node in a ctdb cluster), and the=
 results are the same as my expectation.
> I think I need more tests and more scenario tests.


