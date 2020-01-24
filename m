Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A4D1490BD
	for <lists+samba-technical@lfdr.de>; Fri, 24 Jan 2020 23:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Q29Py9yHQd9qeqqsM7NAg+yMXAfbxy952BxJq43WEeg=; b=HQ1n63ZKk80pH5iNFazFFf9dtP
	hG9IE9XeB6J4qdB2UONoMcKI0YBv7Nny8W/cxn2MHwy/Bz7LGg34fFRdUSrxTMEToVt3nTeqRPOeO
	7uYt2VjxR8l3U2dVephqWe5+/IUfOTu7IU+BSgk2aBWk8BDWTTy2vRhOyQSRVN/JJDgmq8QU8rHRZ
	Bx8sWB+PD1dVo4FcVsa1RQ1ddBHe4ic7kj7QbdezVpPyQSJXwreoucOHDyWlNviYT4TSNazb6OtzB
	othXH6kFd4Dg3BgZDdrZ2wykXpsgEatNWa/8qZ8LE5B945OW/h82279apNsZGTnfZd8NAgKIYG+RD
	pWm7+YuA==;
Received: from localhost ([::1]:59726 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iv7Bv-004eeJ-1n; Fri, 24 Jan 2020 22:12:39 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:55584) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iv7Br-004eeC-MD
 for samba-technical@lists.samba.org; Fri, 24 Jan 2020 22:12:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 24937D290FBCF;
 Sat, 25 Jan 2020 01:12:33 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id scbTbzAmbvB2; Sat, 25 Jan 2020 01:12:32 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id BE9ECD61CB4AD;
 Sat, 25 Jan 2020 01:12:32 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru BE9ECD61CB4AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1579903952;
 bh=Q29Py9yHQd9qeqqsM7NAg+yMXAfbxy952BxJq43WEeg=;
 h=From:To:Message-ID:Date:MIME-Version;
 b=UROuJ7iY+TMY864HL46YYBw4Qb26hvWX8VBT23tIxHM3DxmIo3UfBCRlmsYe6T5+p
 NYMcYU/fOcrDOh211XWvFI5yn8LPv3s0KCYhd+lzV4FUSmC5o2YFsIvlwYEH/UbcJU
 Nov+Qcs/xwz1wUtbAu6sBtIKGo0QPgNaTAz5V1/uUWVjZ8hrHa11UHOgpUZBNGRGpq
 hbTpXRiKOEVC2Rkw7uwhmWD0X4JFLL3RGnuZX2O8ZErk/BON6je2dX+NpH819AxUfi
 KGJbTlIjitk4Qu3t6+nnxfBuwPjlfYBOsUB7NS+6zKsSxzEfE7gqiWVePLgriAOjAH
 CFjda5aP0SH0g==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id mabagQfEgzaK; Sat, 25 Jan 2020 01:12:32 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-217.ip.moscow.rt.ru
 [90.154.71.217])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 6A7ABD290FBCF;
 Sat, 25 Jan 2020 01:12:32 +0300 (MSK)
Subject: Re: [PATH 2/2] cifs-utils: Don't create symlinks for mans if mans are
 disabled
To: samba-technical@lists.samba.org, Pavel Shilovsky <pshilov@microsoft.com>
References: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
Message-ID: <baa6ba65-efe7-0d1f-f93e-b893eb8b2f26@rosalinux.ru>
Date: Sat, 25 Jan 2020 01:12:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


---
=C2=A0Makefile.am | 4 +++-
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index 09ef293..39ef1c2 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -122,7 +122,9 @@ install-exec-hook:
=C2=A0=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cif=
s mount.smb3)
=C2=A0
=C2=A0install-data-hook:
-=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount=
.smb3.8)
+if CONFIG_MAN
+=C2=A0=C2=A0 =C2=A0( cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 moun=
t.smb3.8)
+endif
=C2=A0
=C2=A0uninstall-hook:
=C2=A0=C2=A0=C2=A0 =C2=A0(cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(ROOTSBIN=
DIR)/mount.smb3)


