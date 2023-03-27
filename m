Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 173346CA98E
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 17:50:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hOxRuQJEbd9qtLdPdNhfrZdWS/np4AG5EgSSW8LG8u4=; b=rYMZSryn8Io7cGsF3SpInv1gAC
	ljfYS0/hgH46ubDz2DvIHLniy/7y3khdFH0/DWV18akLgtgXalPBURJhM2W2fa33Nin/eeN6reU83
	fXOgcAmxzkyOjuSW+53rAWA5u3+c66/gXLBC29HiQh8PcgYarVVyRZAAMbidCUzyyWlsbLNcjw8Ki
	e38aHrTG8QiX7psCSJLTPbTsMwvUd3lq5lrjMPsq2mfGMLqxnEb1zsI9TUAmLNZSwjTKPvhKmMBv3
	HjjJ86Pdk/9v82V6PCb0WtjwG4o4YBfQlcvEIFEJYgpArf0qDjnI4DF8rELlN3zsQ7Lw7V61xHz5o
	rK8ZpRow==;
Received: from ip6-localhost ([::1]:19908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgp6k-004kNU-49; Mon, 27 Mar 2023 15:50:06 +0000
Received: from relay3.ptmail.sapo.pt ([212.55.154.23]:38773) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pgp6e-004kK6-Sn
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 15:50:03 +0000
Received: (qmail 22211 invoked from network); 27 Mar 2023 15:23:18 -0000
Received: (qmail 445719 invoked from network); 27 Mar 2023 15:23:17 -0000
Received: from unknown (HELO Sepher3) (medalist@sapo.pt@[85.245.74.94])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth01 (qmail-ptmail-1.0.0) with ESMTPSA;
 27 Mar 2023 15:23:17 -0000
X-PTMail-RemoteIP: 85.245.74.94
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba-technical@lists.samba.org>
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
In-Reply-To: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
Subject: RE: Joining a Windows DC to a Samba AD Domain
Date: Mon, 27 Mar 2023 16:23:17 +0100
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAABM14PwpMuJDgheI8SVrAIkBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABR1/ccgIQiT6ZT6R4bY/faAQAAAAA=@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQJ8LIXchQ8Oxq+K/QolqyfgZxzrGa3JJmNg
Content-Language: pt
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> I've just came across the following two pages on our wiki:

> =
<https://wiki.samba.org/index.php/Joining_a_Windows_Server_2008_/_2008_R2=
_DC_to_a_Samba_AD>
> =
<https://wiki.samba.org/index.php/Joining_a_Windows_Server_2012_/_2012_R2=
_DC_to_a_Samba_AD>

> To avoid giving bad guidance I've added two prominent warnings at =
the=3D20
> top of the pages. Is this sensible? Is this correct? Thoughts?


The phrasing of the warnings seems misleading to me. Are we talking =3D
about joining a Windows Server to a Samba AD domain or about joining a =
=3D
Windows AD DC to a Samba AD domain? This is what the warning says:

"Joining a Windows Server to a Samba AD domain is generally not =
recommended."

I guess it should be:

"Joining a Windows AD DC to a Samba AD domain is generally not  =
recommended"

As it is, the warning is disheartening because what it literally says is =
that joining a Windows Server to a Samba AD domain is not recommended, =
which is false as far as I know.



