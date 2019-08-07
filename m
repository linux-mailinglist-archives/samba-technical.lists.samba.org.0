Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F4384F30
	for <lists+samba-technical@lfdr.de>; Wed,  7 Aug 2019 16:53:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UC27b1dlrTBJ03Pqj8E88CFrIyOWXcoFEmFSOUHz5Bk=; b=acGZ91DZi4iRrfSO1LTInDesVr
	OdvbXDbB3CT9BwFV+HRuzDs/XIkPDPNz5WuNFvVXehJZkeTiC1lFXX+roBNCyjiXEIxZ1yzsGPPhe
	9UbLrwjEihVAk8d+vjiM4ItfMlCMWGsl0tyQsW40yk2iFkBdh7TAX9p8nMn8gWe2bEHXgmSq+k8ws
	gZWh/TLQrk6Q+e3K6Iu9rikmA1wMH31hhLGx9dtANmYKHGWPk/6XQ37H+wcPNuKGyfR+JqqjpKc26
	lR1YamTrTfyylmz4uchqeHhdBwJU56UUE7uYHNJ05pXRDh+qZCnsONtCrLjwucEkOtiRz9J6k4dJ/
	lGW/3phw==;
Received: from localhost ([::1]:64436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvNJS-0050Ce-NP; Wed, 07 Aug 2019 14:53:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24260) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvNJO-0050CX-6T
 for samba-technical@lists.samba.org; Wed, 07 Aug 2019 14:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=UC27b1dlrTBJ03Pqj8E88CFrIyOWXcoFEmFSOUHz5Bk=; b=vYkGbmswsu/NYI6wUfKNY9KY0g
 jxsT3+vGwn0GLyH53Klvz816nlZIrezCqpdDM8S7OPGJgHJGIvE4ts8s8VJhf6+nF9MhdturD12EG
 E/VuhU29Spvy3HJw3AQtB+DuNfKIVqDLx8b4Ry/eqB/WUFbN9EcLF5JCuJuJIIXvAIPQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hvNJN-0003lp-PU; Wed, 07 Aug 2019 14:53:09 +0000
To: <dmulder@suse.com>
References: <2691e0ab-7c21-c9c2-be47-58e8a869b6c8@suse.com>
 <20190807144005.GA20740@sernet.de>
In-Reply-To: <20190807144005.GA20740@sernet.de>
Subject: RE: Samba.org GUI page
Date: Wed, 7 Aug 2019 16:53:07 +0200
Message-ID: <9708614133A3483C83811C625AD1D5C7@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdVNL9Kwo6njPAL/Re2SVsg/rTS32Q==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai David,=20

I tried that today on my debian Buster server, it didnt work, but that =
looks
promising.=20
Did give it a deep look why it didnt work.. *(yet)

Any source code available so i have a good look at this.=20
Maybe i can make a debian packages of it.=20


Greetz,=20

Louis
 =20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens Bj=F6rn=20
> JACKE via samba-technical
> Verzonden: woensdag 7 augustus 2019 16:40
> Aan: David Mulder
> CC: samba-technical
> Onderwerp: Re: Samba.org GUI page
>=20
> Hi David,
> On 2019-07-31 at 17:26 +0000 David Mulder via samba-technical=20
> sent off:
> > Could somebody add my admin-tools package to=20
> https://www.samba.org/samba/GUI ? I'm not sure who manages the site.
> >=20
> > Download URL is=20
> https://download.opensuse.org/repositories/home:/dmulder:/YaST
> :/AppImage/AppImage/admin-tools-latest-x86_64.AppImage
>=20
> I can add it. Is there a web site also for this? Otherwise I=20
> might just link to
> your SambaXP talk pdf...
>=20
> Cheers
> Bj=F6rn
>=20
>=20


