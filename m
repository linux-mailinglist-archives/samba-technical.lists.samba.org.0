Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083D269A98
	for <lists+samba-technical@lfdr.de>; Tue, 15 Sep 2020 02:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=b3JwcgjSdpg0RTUTd4kBiqAqFag/oC5ckMtvPf5zaMM=; b=zZkFMil+g3t6Dnpvz7kVVvRA5i
	Rj4CdIH16bxQaaVeHbtcuD9exZsjKhgNuJhpXS8CHzmUk5SieYZKjGyV2roz8RANkphsD5rlkOGYu
	w34AEYBtylP7DsckShlLJm+W8G14+ZpWoQyWRchC7ARmLWPXq9QyDEtgHZUjY6QytufNHQ0gdfM8T
	oq1vdnV16x83xC/vbqYlXLx0VBfYdV1rdodFA7HweehGvvPAvxgsl+f/PzqZVP4UGO/RTTfgPvtXV
	heUgKHN+KkNp4lg0iXyTNBNPrdUypuV3J1vMia4QCKu+XVTvc//rz1uC+Ca7RC7iyLrc/EQcfr9g8
	rrbvu3WQ==;
Received: from localhost ([::1]:50004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kHz3k-005Qiv-3e; Tue, 15 Sep 2020 00:43:00 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:55560) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kHz3d-005Qio-LV
 for samba-technical@lists.samba.org; Tue, 15 Sep 2020 00:42:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 6606CD6D57447;
 Tue, 15 Sep 2020 03:42:50 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 65aEgrxoMtte; Tue, 15 Sep 2020 03:42:49 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id D07A8D6D57451;
 Tue, 15 Sep 2020 03:42:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru D07A8D6D57451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1600130569;
 bh=b3JwcgjSdpg0RTUTd4kBiqAqFag/oC5ckMtvPf5zaMM=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=JGV+GqR1SUgAguopyatsdKrQuMLNFzi7hp7P+wj7tt7Ml/OYfQAWxIGqZfNEevDA8
 lmVVm4XeiUvYCsVLJauiYMw8inhO/vFeN5hNHjBllwcOCnHGVq38IDpo4I9r743Neo
 yP/XwEnykix4G0UQrVnyPXYqyMJDuPpcQ4VSSeW0G4gMZAnVwfGHwbft33fQHmBGLj
 z6bTvUDsQhpmoqyWRb96VIL2SZblYapLPWOumXjmXmt4YKcl36Xaqk10ft48rO4uGq
 UkYJ/8w6laFhv40JywH6Aeu4EgZ/F/NafIZioW99gXlrZyZieutMvzNeUwXJieigc+
 g/TbWwvs+BbPA==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2BjSaz6NcFrY; Tue, 15 Sep 2020 03:42:49 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-136.ip.moscow.rt.ru
 [90.154.70.136])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 58696D6D57447;
 Tue, 15 Sep 2020 03:42:49 +0300 (MSK)
To: samba-technical@lists.samba.org, sssd-devel@lists.fedorahosted.org
Subject: SELinux attributes in Samba domain
Message-ID: <da8c5360-fe43-16e5-e149-657a22cbc61a@rosalinux.ru>
Date: Tue, 15 Sep 2020 03:42:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone!

I am thinking about storing SELinux attributes of domain users in Samba A=
D domain.

The problem is that Samba AD copies Windows domain, but there is no SELin=
ux in Windows.

Currently FreeIPA can store this as a server in LDAP and sssd can get and=
 apply SELinux attributes from FreeIPA's LDAP:

$ grep -inHr ipaSELinux
src/providers/ipa/ipa_config.h:34:#define IPA_CONFIG_SELINUX_DEFAULT_USER=
_CTX "ipaSELinuxUserMapDefault"
src/providers/ipa/ipa_config.h:35:#define IPA_CONFIG_SELINUX_MAP_ORDER "i=
paSELinuxUserMapOrder"
src/providers/ipa/ipa_opts.c:271:=C2=A0=C2=A0=C2=A0 { "ipa_selinux_userma=
p_object_class", "ipaselinuxusermap", SYSDB_SELINUX_USERMAP_CLASS, NULL},
src/providers/ipa/ipa_opts.c:276:=C2=A0=C2=A0=C2=A0 { "ipa_selinux_userma=
p_selinux_user", "ipaSELinuxUser", SYSDB_SELINUX_USER, NULL},

In general it just gets a string and processes it, this email is about st=
oring that string inside the domain per user.

My question is: how can SELinux attributes be stored inside Samba?
I understand that it will not a standartized name (but maybe we can come =
up to upstreamizing something into sssd...?), but I am ready to keep with=
 something not upstream for now and to try to make SSSD to the same for s=
elinux in Samba as it does in FreeIPA.

I think I should extend Samba's scheme with custom attributes like in the=
 guide http://david-latham.blogspot.com/2012/12/extending-ad-schema-on-sa=
mba4.html
And then try to make sssd read those values.
Does it sound like a not very bad approach?

Thanks!


