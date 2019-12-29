Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADA612CAEB
	for <lists+samba-technical@lfdr.de>; Sun, 29 Dec 2019 21:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=roplorZV/nPNwWGOyiM8vjENzr8bcR81wCByjjzTKj0=; b=sOhs/ia1OAxF21yJTZ2kUFxMGv
	ZfrEV8cSuV366PaXVaPYoGo50NlW/u2q5AB5dl6DTw2hpJ6ML7ZFog4/FXrDmSOS5eJjVii1HH6xk
	L5fvGppg2MOlHLhesv/hqaCNAvNwDWrL4IDqNkhJQyewJqtCL+NKkFnNhGiXJsXMr8uPZUO4Ym5hW
	dURKidKa0aihy8+qAwATaGAxeN/fb+C749fcSAxLg4ZnVTv1Ds95IgGNXANSZrXFkkPeCy0GYmCnC
	8astayNtmVTqFuXhfFGxa0ypu6cYj2EUvK00okY3afHlkfba+tI4nAS1Y7wX5ui2/Zl/xbTo4tP0Y
	Bd40Ce+A==;
Received: from localhost ([::1]:30284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ilfUz-000NG9-6v; Sun, 29 Dec 2019 20:49:17 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:41656) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ilfUv-000NG0-9B
 for samba-technical@lists.samba.org; Sun, 29 Dec 2019 20:49:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 6A71DD59CF45E;
 Sun, 29 Dec 2019 23:49:01 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id VHD_6Dn0Fikw; Sun, 29 Dec 2019 23:49:00 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id B2A82D59CF460;
 Sun, 29 Dec 2019 23:49:00 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru B2A82D59CF460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1577652540;
 bh=roplorZV/nPNwWGOyiM8vjENzr8bcR81wCByjjzTKj0=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=wrWqWkLx/Jw8CICwt1tG/PBzzHS+6XMzdsrHiDrxudpKgT58dm4a1JRi/cR5J94KA
 JCeACj9UhL1RO/v9bUFPA1ctP/ZpQy4hA0cnVwQMaYPKhUFCk/eTSOaosKFumaqHdE
 uGx0zewLpFpQSA8n7yjrUCsDqKOZ2urLgJrnqcMF5lR6BhbHdt3J2kEDnsRLlVg7+r
 CJ/YRJSeye4WH/TV0P2zy+/f/ud4bg4LoaqitEEE2sZI5aRP6kFZblafynVqO7ZwAT
 mveDLP/NMirKwGoaGumb4IFklj89/JZpaGPECczadzflkdFm7RhadyI9Pkg2bJbty2
 bpRpiWo2N3l1w==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oKkgkIJ81zqX; Sun, 29 Dec 2019 23:49:00 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-8.ip.moscow.rt.ru
 [90.154.71.8])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 8388ED59CF45E;
 Sun, 29 Dec 2019 23:49:00 +0300 (MSK)
Subject: Re: [Release Planning 4.12] Samba 4.12.0rc1
To: samba-technical@lists.samba.org, kseeger@samba.org
References: <cb8a8065-cd6b-cfc1-8de8-c156eec9895c@samba.org>
Message-ID: <34f5bab7-32b6-198e-65d8-ccc59d67fdd1@rosalinux.ru>
Date: Sun, 29 Dec 2019 23:48:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cb8a8065-cd6b-cfc1-8de8-c156eec9895c@samba.org>
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

19.12.2019 14:35, Karolin Seeger via samba-technical =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
> Hi,
>
> Samba 4.12.0rc1 is scheduled for Tuesday, January 21 2020.
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.12
> has been updated accordingly.
>
> Please make sure that important changes end up in the release notes as
> soon as possible.
I have not found where release notes are, I wanted to say that https://gi=
tlab.com/samba-team/samba/merge_requests/961 can be described not as "Add=
 support for anonymous connections which smbspool", but something like "s=
mbspool_krb5_wrapper can now be used as default CUPS smb backend for both=
 kerberized and not kerberized printing via smb" to make the original int=
ention of that change and its practical usage clearer than titles of comm=
its.

