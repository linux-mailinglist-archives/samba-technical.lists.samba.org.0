Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65964E6206
	for <lists+samba-technical@lfdr.de>; Sun, 27 Oct 2019 11:23:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=t0txrIYfFLKifQXROiSz7bTJO4rg+rI1m1pON2fwpwo=; b=mCBjA6nhofGQSxFE/mFlKTETXi
	weZXBfMqU2ACZFyn0JT7lyvD3rh7OCfhUI5yjdAhjzVBqfWssyhrr+WpH/DGq+CRlgCEoebIoJyjS
	dLsEsitHGtT/ZBqslY6UfbU5wcQQJEdWnLRsRnYnaoCZmdzjA3rykXrzemsEpS87xHGEVeW5gYzan
	1PGO2Yj3BlMbyoC7gx3xbT6XQdZJpAXg2NF9Zmwx1RYGdGME2tP8tygsHnVeScDuINcU/PI2d4S/E
	DQesPz/2/9FWSlNP3F9A2D2pKH0j2MO1G1j2O3kiqZpX9S7MwXLBow1ACYNAYPKi5UbBu+vw7J2Ou
	paSDhdvA==;
Received: from localhost ([::1]:18616 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOfgp-002mdP-Vi; Sun, 27 Oct 2019 10:22:28 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:52254) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iOfgk-002mdI-SX
 for samba-technical@lists.samba.org; Sun, 27 Oct 2019 10:22:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 7A847C00743E3
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 13:03:03 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9avy3e_9JjeQ for <samba-technical@lists.samba.org>;
 Sun, 27 Oct 2019 13:03:02 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 70F1ACD1501EF
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 13:03:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 70F1ACD1501EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572170582;
 bh=t0txrIYfFLKifQXROiSz7bTJO4rg+rI1m1pON2fwpwo=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=qGbhmK7rhRwEhVrP3TBgIvIQorupSFE4J4Ny3Vdea3E6yvVkaPqkkPXY0HeTgQe5M
 J4+CB68vzcopHzKyEvifEvRwLbKLwUPGYfn0GmzPc/U1gstCXDaiKp7l/2VgqkKKpT
 arIMXB/7QVuCuhFfRJHZlSjwr1JJ4JsLTm33miz1Ij1HaDZorrnVW5R94p7vF/qYGj
 XrJR1OGbA6zRzoUi2sUf97pS61Bdl747ZmZJzKOURafuyw9G2cTYZBcWOZ6DxBH1Z9
 U+7PknFocxYL9FK3M5jZkEKTxyduWX7HvRG9x0B5NbOM+FwjxMNR9wxpXWF1eUiXNs
 HQ0hFM9DganCw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1g0ALY1SW7MB for <samba-technical@lists.samba.org>;
 Sun, 27 Oct 2019 13:03:02 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id F086EC00743E3
 for <samba-technical@lists.samba.org>; Sun, 27 Oct 2019 13:03:00 +0300 (MSK)
To: samba-technical@lists.samba.org
Subject: smb1 and network discovery
Message-ID: <96cd3f47-0b0d-89a2-0fe0-a874f25f7177@rosalinux.ru>
Date: Sun, 27 Oct 2019 13:03:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

smb1 still has some very important use cases in Samba, for which there=20
is no replacement.
I would like to remember about network discovery.

smb protocols > NT1 do not allow to list smb:// network, only smb1/nt1=20
can be used to list it.
Only smb1 allows to browse smb:// network: find shares, computers and=20
printers.
It has been broken since samba 4.8 or 4.9, when samba stopped trying to=20
connect using smb1 by default and started to use smb2 as a first option=20
to try to connect.
Nowadays the only possible way to work with smb1 and to find computers=20
in the newtwork is setting 'client max protocol =3D NT1' is smb.conf, but=
=20
this breaks smb2, smb3 etc.

Modern Windows uses Web Service Discovery protocol to do this.
There is wsdd - a simple Python daemon which allows a UNIX host to be=20
discoverable via WSS: https://github.com/christgau/wsdd/
I am surprised why my package of wsdd in ROSA Linux=20
(https://abf.io/import/wsdd) and the one in AUR are the only ones across=20
all *nix systems: https://repology.org/project/wsdd/versions
Seems that really few people are interested in solving this problem.=20
wsdd makes Linux hosts discoverable from Windows and will be=20
preinstalled in future realeases of ROSA Linux.
But wsdd only makes Linux discoverable by Windows, Windows hosts, shares=20
and printers still cannot be discovered by from Linux! I saw a link to=20
https://bugzilla.samba.org/show_bug.cgi?id=3D11473 where there are patche=
s=20
to implement WSS in Samba, but there is no progress there.

Network discovery via smb1 is widely used in a typical GNU/Linux desktop:
- GVFS, browsing network in file managers (Nautilus, Thunar,=20
pcmanfm(-qt) and others)
 =C2=A0 GVFS recently made a workaround to browse smb:// with newer versi=
ons=20
of Samba:
https://gitlab.gnome.org/GNOME/gvfs/commit/6c8bc39f570ea82cf14e83ce7d1dbd=
be569d09d1
 =C2=A0 It uses "smbc_setOptionProtocols (smb_context, "NT1", "NT1");" fr=
om=20
libsmbclient 4.10.0+
 =C2=A0 It sets client max protocol =3D NT1 to list root of smb://, but t=
hen=20
smb1 may be not used for deeper listing of a specific file share.
- KDE KIO, browsing network in Dolphin file manager
 =C2=A0 I wanted to make a similar workaround of broken smb:// listing, b=
ut=20
did not finish it because it requires chnaging a lot in KIO SMB
 =C2=A0 https://phabricator.kde.org/D18878
- system-config-printer (GTK+ GUI to setup printers) can find smb-shared=20
printers, but fails to do so with newest samba versions due to=20
impossibility to list smb:// without forcing smb1 protocol

Now it is possible to workaround listing smb:// as GVFS does by forcing=20
NT1 protocol, but removal of smb1 from samba will break even this!
In most cases security is not so important, for example, if it is a=20
small office, where even authorization is not used to connect to shares=20
and printers.

So, what I would like to pay attention to: network discovery via smb is=20
broken in samba but can still be used with workarounds, removing smb1=20
will make it completely impossible.


