Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA6A02F9C
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jan 2025 19:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=6Nd+uHN3BJA612GqIMtHDIXvkKbH/V66pvwQj0/kkCE=; b=zhKJ7mFYlxEduDFBdLhr3C7UzP
	mKr2qW+tp7Yurm8sZj6UU5mN2WxZmT8TgqAmMCzEmtERWosFamcjaDDbgsLdRqVgLSil/ef5XwVcj
	FTMGeydubYYk2YJu5podVRPudhrNnQvmNkkVl3A24XfRTh3TKbRMo+wh8vuBmxJq4/EU7ruNWpzyQ
	KIJFLHpHliiozcsJvGFNu8AI6LyplutybpyrkP1oqC45a+3t2fO7eIQX74tmGU9K9LaXiyh6iEDTi
	pSaHh90fO7lnN3dUOxOdKew0vroBd4uWBOlSPnN/kBHk/IhCmWJ94UyJ9RT331RKxzjy+ujdK/MF+
	gxDq5E/Q==;
Received: from ip6-localhost ([::1]:32942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tUrd1-007Pui-3l; Mon, 06 Jan 2025 18:15:03 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:39976) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tUrcw-007PuX-Kv
 for samba-technical@lists.samba.org; Mon, 06 Jan 2025 18:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1736187292;
 bh=6Nd+uHN3BJA612GqIMtHDIXvkKbH/V66pvwQj0/kkCE=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=h5PU+N8nM+YZkLXIwAVhFsp++FjJrdzA3CZYw7o2YWxM0pE2dKdXSpstQFb5YcBnq
 ux3R9YqZ3WFK0/oWa49RLzi6VeLrXmOJvpEqeZImiM7hdgh34RjROnLu3Ge5fusdFk
 h3ruIIP1OkNnNOKkBNbYoQL2Ieo2hGZbTL/N+ryqq4j7V4nN+hRH+NYYio/FCn9ygS
 E+5uOvLIjs3CSX75sJ46CbS+w+8DGyj6xKzUIIgdAPxZI5Hq0Yl7q0ysKZi6jI+YEr
 5fYgl2Xi4B+4HOfqF6VM3pgjfAXFhQfa34oWFyeaW3dRKV1ao0WeFRx5t1ZIylnbTs
 dgxov67au7nMA==
Received: from sapo.pt (unknown [10.134.36.75])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTPS id DC2A8B52417
 for <samba-technical@lists.samba.org>; Mon,  6 Jan 2025 18:14:52 +0000 (WET)
Received: (qmail 28227 invoked from network); 6 Jan 2025 18:14:54 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth01 (qmail-ptmail-1.0.0) with ESMTPSA;
 6 Jan 2025 18:14:54 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: "'Stefan Kania'" <stefan@kania-online.de>,
 <samba-technical@lists.samba.org>
References: <0a6801db5ec4$61f552b0$25dff810$@sapo.pt>
 <5ca363e0-f094-46e8-a747-beda0d05835a@kania-online.de>
 <001401db5ece$1dc252f0$5946f8d0$@sapo.pt>
 <7a8f7b00-28a9-4826-b725-dfa1fe40a19f@kania-online.de>
In-Reply-To: <7a8f7b00-28a9-4826-b725-dfa1fe40a19f@kania-online.de>
Subject: RE: Upcoming discontinuation of Samba 4.19.x (creation of new GPOs
 impossible with versions 4.20.x and 4.21.x)
Date: Mon, 6 Jan 2025 18:14:52 -0000
Message-ID: <004e01db6066$e2a27570$a7e76050$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AQIydtSxMsvZH5p9CpyA7UX6lXPI+gGyV1PfAaYwbKQBKuUNP7I3wUdA
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

>> Have you read the bug report?
>>=20
>> https://bugzilla.samba.org/show_bug.cgi?id=3D15738

> Yes, and I tried it at my testing environmelt with Debian 12 and Samba =

> 4.21 out of the Backports. I could add mor then one group (I  stoppt=20
> with four) and I had no problem. I use RSAT to modify the GPO.

Another user reported the problem with precisely your environment: =
Debian 12 and Samba 4.21.

We need to clarify this. Can you describe the steps you have gone =
through to "add more than one group"?

Are you adding the groups via the "Scope" tab or via the "Delegation > =
Advanced" tab?

You mention "modify" the GPO. Is this a pre-existing GPO or a new Group =
Policy Object?

Thank you.


