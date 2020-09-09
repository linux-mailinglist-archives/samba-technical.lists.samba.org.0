Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F92262DF7
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 13:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=43A5z4AqL0jIPnVteBKs7/MnEQVZsHYzHOeD/cibq9o=; b=dv/c+ZHcAR4EyaAVoIRiIrxgZ4
	TGOugrkEZ0nsEKxc29e0131FfT9iwtWWim1R1KArdHH/vbZR00JKtar7UaHeDF8s0tbGI4/ZFUBGC
	Hh7mcbDlJ/F3y3YYQuymW3pPCIT3wQPFpwWUaeR4i1mhrlG1k4qcPdS5KFeaoG1HnB4yjPC+fn6sJ
	dEAk35qL3EMXXn6GN2gx0h2JLgxWf+ixMOozjC53isiU4vk4VXcyMZny9VbwIFqZszZNRh+RPGCWP
	NTTmM1cw2dpkv+jljzTgSWfMahlwxjkRbO/VlQsS0r5da94Qe0biwnNodRcH8SpvNafwg94+K0non
	1QLb/tLw==;
Received: from localhost ([::1]:25838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFyQ8-004ldk-Us; Wed, 09 Sep 2020 11:37:49 +0000
Received: from mx2.suse.de ([195.135.220.15]:33730) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kFyQ3-004ldd-9v
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 11:37:45 +0000
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7A8CAEDE;
 Wed,  9 Sep 2020 11:37:37 +0000 (UTC)
To: hezekiah maina <hezekiahmaina3@gmail.com>, Alexander Bokovoy via
 samba-technical <samba-technical@lists.samba.org>, "abartlet@samba.org"
 <abartlet@samba.org>
Subject: Re: GSoC 2020 Samba Experience
In-Reply-To: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
References: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
Date: Wed, 09 Sep 2020 13:37:36 +0200
Message-ID: <877dt3w58f.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
From: =?utf-8?q?Aur=C3=A9lien_Aptel_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hi Hezekiah,

Congrats on the completion of your GSoC!

I agree with your comments about the doc not being straightforward for
new users and assuming knowledge of AD and Samba code base being very
large with no overview of what is doing what.

I don't know if you were aware of it but Ralph made a talk this year
trying to explain the codebase a bit. Given the time limit of the talk
and the size of the code he had to pick an area to dig into which might
not be what you were interested in but I think it's a step in the right
direction.

https://sambaxp.org/archive-data-samba/sxp20/sxp20-d2/sxp20-d2t1-8-boehme.m=
p4

I also agree with the state of packaging in Linux, too many differents
spec file conventions or competiting systems (rpm, deb, pkgbuild...) but
as you said it's not a problem with Samba.

Good luck with your future endeavors :)

Cheers,
--=20
Aur=C3=A9lien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, DE
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=BC=
nchen)

