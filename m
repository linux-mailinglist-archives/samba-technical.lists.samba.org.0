Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFD6E1550
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 21:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=7a8/UcAesWWP7pQ2glU3wShRz4HwysWa50HL/oJZQjg=; b=Os7rENiVipOt5lSDJT/IQVt3sg
	lw8KtC6n/hS0BnjfavTAPou3clgq/mw9GQ74c4TUImtLDJoElg8/ApIZOdxF9dej3GxbfW9lQCpkP
	uQt9/ebYjiND8UgvcM3Mo1GXH3ICJ85Xs5ekvdGDL1CRKU6oc/kvEm+A8QzwjVZH4CaZkqF+JePDU
	xN1D9VMUT3+dRFuL1rOvkWz/VjvUb8KwGqi4h+FBHtR4XjIbYeZTzznQFwx3GpYhL4q6Nsk8681SX
	qztPy+G4qhfN0mm1AvCSVurhmCYwJSsF0l9oLxT9weqiEBpthxmkxM2k8WEED6zMqdQaAJhPqD3zI
	vsJoASdw==;
Received: from ip6-localhost ([::1]:50954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn2p9-001Cva-3C; Thu, 13 Apr 2023 19:41:39 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:44885) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn2p4-001CvQ-2i
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 19:41:36 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 26so3875169lfq.11
 for <samba-technical@lists.samba.org>; Thu, 13 Apr 2023 12:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681414892; x=1684006892;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7a8/UcAesWWP7pQ2glU3wShRz4HwysWa50HL/oJZQjg=;
 b=JKamsPjmQA99c3Pl8yXyljfaSFnL9DZxl9jtDLAaY1C7/HzgplwgG0VBaZXIobMt/U
 8CEz+0xbfW95GWXDij3UyBJGpH0VIL/bta4km6VHpAhtO44YG/4sB/QApRMiXAPe9gMe
 Qq7+Uy2ornxltA9ZN3i3YfOOBMt2n3hQD3fIbnGCmzuD9b/KzP08R4bPahyPggE+Ba5s
 dphpxFRxbzFc1qn1X/BnnFwW8a6HxeO0cfq8rWClzX7Y9QOzx/07+xsKfgVfGB0hzpqW
 aggMsAH6LDyGUWbUrXRC0PsjEzUDFX/nM0vnJCI5TEMoYH1+tfv/2uKlnh4c0XZzIOn5
 aLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681414892; x=1684006892;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7a8/UcAesWWP7pQ2glU3wShRz4HwysWa50HL/oJZQjg=;
 b=DZ7zWp9E4GQfvKM6mKtk//g87U0oK1a0l/9LEZ1Y2zYp/aUSBZPNr5armXkDBTziDM
 ngnZdl9vzeqGdf6P4Q9JbKkQrX/GtsijlTjuJoSihiPOa9SehEd1D06HzU0YbdpH/MNV
 l+gOg7e+JsthjDAYupEkZE2bQF5LPa9NP5QoW/Sjt1cj/5tYY7ahb1zl2MBu/CNAL4Ft
 wHXoOpoXD5ePMpfuwNn7p6jx2p6eAcV/SfgTOcK02LUykp/SExd9GRDI12M8zwEjizpQ
 EYEvVI30kCaXDbELtmFLOhCq+4EH9aYtllkQbk/+Du5xOHEOrHTx1OGswq9AbeHXbYiH
 wGwQ==
X-Gm-Message-State: AAQBX9ePN7gJjJqPuz57me9OPUL/QcbLPA8FsGLzEPO2r4CpYWSHxBh9
 6ejBZpzTTFBt6A4zof8UnoCL/DK1u1RtgwuruJCjhtn53uc=
X-Google-Smtp-Source: AKy350ZwsaQojSXaZfdrvWB130K7Qtoyx1nytFmy2E4xX5SLGWrnxr7i+Fbc6tpAgewEGMQQBVxxzJCbGuC6mJQG9hs=
X-Received: by 2002:a19:7609:0:b0:4db:266c:4338 with SMTP id
 c9-20020a197609000000b004db266c4338mr1183701lff.1.1681414891779; Thu, 13 Apr
 2023 12:41:31 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 Apr 2023 16:41:20 -0300
Message-ID: <CAJq09z59X6btqEMnRvdSze_5nOq0XVfg9odE_765Ci-5Of4exQ@mail.gmail.com>
Subject: DFS mounting wrong path
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Luiz Angelo Daros de Luca via samba-technical
 <samba-technical@lists.samba.org>
Reply-To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have a strange situation with the kernel following DFS directories
to the wrong location.
In a share with a couple of DFS entries, sometimes the kernel follows
the wrong path. Something like this:

server: /share/dir/subdir1 -> msdfs:server\share1$
server: /share/dir/subdir2 -> msdfs:server\share2$
...
server: /share/dir/subdir11 -> msdfs:server\share11$
server: /share/dir/subdir12 -> msdfs:server\share12$

And in the client, we have:

client: //server/dir/subdir1 on /mnt/share/dir/subdir1
client: //server/dir/subdir2 on /mnt/share/dir/subdir2
...
client: //server/dir/subdir11 on /mnt/share/dir/subdir11
client: //server/dir/subdir12 on /mnt/share/dir/subdir11 <<< (should
be subdir12!)

It always happens with older kernels (5.14 from opensuse/sles 15.4),
where the first DFS is always used everywhere. However it still
randomly happens with newer kernels like 6.2.9-1-default from opensuse
tumbleweed. I can always reproduce it if I do a "ls subdir*" but it
does not happen if I first "ls subdir12" and then "ls subdir*". It
looks like a race condition, but it might be an off-by-one case as I
only observed that with the last DFS in the directory (12th in my real
case).

Has anyone seen this behavior?

Regards.

---
     Luiz Angelo Daros de Luca
            luizluca@gmail.com

