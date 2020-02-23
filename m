Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F3169A5A
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 22:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=uPWWTvMxX0vavx2s0LEXkLbxRfOqa0rJqa+XgqaCgmc=; b=0Eep3N4fmCLoZg8kLyOC2d3M5p
	nTF70DFKKfMZBJQGQhSCA3WAScUE6leTuiSoSUzzhXv8HfHQVxd7DK/6zgiyae9yB86+yvAU8HrfC
	uD6uaLom63QThZ2cZnsH2nbVCUutRBrH64DjS2+Qr2cpZzND2eCjL6BHQIsp/IpmQ2ayCluV9IC6j
	PWqlvt0F7F3ain5ZWawWgyBv4iukjNxg6j7d7yjs2kZ6cjPYgYT5zy/jtO0SLV5XeN/qHPXC2QgMR
	+gBh4LPjwbjnVZFovPXzUSmOxQ+szZ2/2hz5fVlc8vETmveB2DxGNZOGvcTKgJ9nccndInea8RX/h
	MyycTKYg==;
Received: from localhost ([::1]:46856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5zGQ-00BFje-21; Sun, 23 Feb 2020 21:58:14 +0000
Received: from [212.27.42.9] (port=38524 helo=smtpfb1-g21.free.fr) 
 by hr1.samba.org with esmtp (Exim) id 1j5zGL-00BFjV-3M
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 21:58:11 +0000
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id 5F14F83411E
 for <samba-technical@lists.samba.org>; Sun, 23 Feb 2020 22:40:08 +0100 (CET)
Received: from [IPv6:2a01:e34:ec23:eb40:49c4:2e81:b624:d3f] (unknown
 [IPv6:2a01:e34:ec23:eb40:49c4:2e81:b624:d3f])
 (Authenticated sender: lionel.monchecourt)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 064FCB0053B;
 Sun, 23 Feb 2020 22:39:48 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Internal Samba DNS issue with AD
Date: Sun, 23 Feb 2020 22:39:48 +0100
Message-Id: <564E39C7-312D-4B15-B046-E0CEBC7C30A9@free.fr>
References: <8a3ef579-cbed-cd4a-90c8-8ebf0f6f5a4c@samba.org>
In-Reply-To: <8a3ef579-cbed-cd4a-90c8-8ebf0f6f5a4c@samba.org>
To: Rowland penny <rpenny@samba.org>
X-Mailer: iPhone Mail (17C54)
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
From: Lionel Monchecourt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Lionel Monchecourt <lionel.monchecourt@free.fr>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Ok understood , thanks a lot and sorry for the bad group=20

Lionel

sent from my Iphone, sorry for typo

> Le 23 f=C3=A9vr. 2020 =C3=A0 22:00, Rowland penny via samba-technical <sam=
ba-technical@lists.samba.org> a =C3=A9crit :
>=20
> =EF=BB=BFOn 23/02/2020 20:30, Lionel Monchecourt wrote:
>> I Rowland,
>> Thanks for your answer.
>> I'm not sure of my English, so should I post somewhere else or it was a j=
oke ? :P
> No, it wasn't a joke, your post is more than likely a configuration proble=
m and the 'samba-technical' list is meant for developer discussions about th=
e internals od Samba. You should post to the 'samba' mailing list.
>> I have nothing running on 127.0.0.1:53
> I never mentioned '127.0.0.1', I said 'port 53'
>> Checking :
>>=20
>> root@myhost~/test# sudo netstat -tulpn | grep LISTEN
>>=20
>> tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTE=
N      744/systemd-resolve
> systemd-resolve is running on port 53
>=20
> Try removing systemd-resolve and see if this fixes your problem, if it doe=
sn't, run the debug script again and post the output to the 'samba' mailing l=
ist and not the 'samba-technical' list.
>=20
> Rowland
>=20
>=20
>=20


