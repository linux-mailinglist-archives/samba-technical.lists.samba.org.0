Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6D32D62D9
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 18:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/SDn7XSD//JMgmHzQGwHDDf0+m5eCtVCF2/1KosZrok=; b=d9E5ESas8nLSBq5LRqmvnkplDu
	4n8xv2BalOWtoMq0Rbg2V8pkUOSiN0KlgpHjVX1NRIFN9wR67Xh12L3LcfbSS7un7h3uTm6+P7duV
	RxRhn92HnHpbGKO5UHH7hWu2S2KMNXOn6HPJDrABhDLeqi5oAzGbnlKOCz2i41aQ/d7fB2+Nolr9H
	xTby1zIhRwYjCqg4Zr6RSbJx/ETByVsB0/SNxRwz9Bo0G7RmHLf+RMPD/q0UV+IgUqiNP6799Uckw
	muXJCVgEY71q1KFIAaQTsSgGZpK0lXuY0KQNQNiMq2djxq5H5i19AJoq4tPaj28ppJub26On8wzVq
	XuMicbDw==;
Received: from ip6-localhost ([::1]:40894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knPJl-000QDn-ON; Thu, 10 Dec 2020 17:01:25 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:41183) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knPJf-000QDe-B8
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 17:01:22 +0000
Received: by mail-lf1-x132.google.com with SMTP id r24so9227435lfm.8
 for <samba-technical@lists.samba.org>; Thu, 10 Dec 2020 09:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/SDn7XSD//JMgmHzQGwHDDf0+m5eCtVCF2/1KosZrok=;
 b=UwEtZHg05RJXsnUROKqX7TTNRric9/pJvT/s/WM6xC8SOzskYFNKnvvpSs+9hggq6Y
 yt3zCtTGE7toUIvaCEKXq2pz4oK21susOZaU10PJlxN3FoK1TMzJfS/oveOVdSA12cE4
 KnGql4Eg4Gfsv380QRwnYt1hXrbuZq66cBD61vzr3E48aD4UtqeP6Te9tL7q1Ek7lWDX
 fMXtGyt8RhzpnxasncWnRbtbxhxHBuAOTns2u2JrKm4IrctN6typraiVimFTDLjcRgox
 Ifus+HJ9t0hMwbGEbsttfBsUAg7Tc7p6pqOv1dsdv6tbovyRHwA31uj6GWlelUiaac1o
 XYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/SDn7XSD//JMgmHzQGwHDDf0+m5eCtVCF2/1KosZrok=;
 b=lyzogO8ATZEfZC4cyMF8WPqwEv1fayw4dH3SOOUZSuF4QkPOcp4KvDpkz6V+ruDb5c
 Xf8TdgEgJKzZ1eczcMvm9ytFJ0Vpc8vl5jH9qwpb2pZ1+Td58O6eBc49C1aVWPAww9jP
 05giMU2EJgUckXCQZAVzlftKx8vcSFKYPd84t0iy2Fqa7lf5SbX5Hq66/qSZM3nW5r8J
 NI3hhzJoZspbDcSl52CAXbWV5xnte455OOEKAzig6MD0PQHaDaVsinKsu2B0tPSjHIMZ
 J4lcRkOKF/AFJaGNNtc6KzGuBx1GSztEvjerJVyO3SSyYgRCb1n1/ufAVLH1XNf8W/Z7
 rm1w==
X-Gm-Message-State: AOAM530XgXPcnvWxpRKL4DsU892XXcuLCM8xtSi58PKY2iO/xG7Bp/7x
 SavqLk/R75E07ZdLtXPI11wEgBFDVZvvrpQQYlA=
X-Google-Smtp-Source: ABdhPJxhfQZ2p7eNlIhaeJwm3vmR2Mc98PL2l2CJq9WZ51aotjlvLaPNWb+zDs9BnC4zTyKVBv2vAHyGGS4g9vyi5XM=
X-Received: by 2002:a19:6b19:: with SMTP id d25mr3231778lfa.282.1607619673224; 
 Thu, 10 Dec 2020 09:01:13 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR16MB26159527465394F378EB16FDE2CC0@BYAPR16MB2615.namprd16.prod.outlook.com>
In-Reply-To: <BYAPR16MB26159527465394F378EB16FDE2CC0@BYAPR16MB2615.namprd16.prod.outlook.com>
Date: Thu, 10 Dec 2020 11:01:01 -0600
Message-ID: <CAH2r5mtZo68cjRFOXPxET2D2yr+J8xbAoNto0zx06b1uRwxX4g@mail.gmail.com>
Subject: Re: Merge commits to v4.19 from 4.20 & 5.6 for cifs Backup intent
 flag fixes
To: Vidhesh Ramesh <vidhesh.ramesh@komprise.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Chris Dearden <chris.dearden@komprise.com>,
 Nahush Bhanage <nahush.bhanage@komprise.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You may want to contact the guys that package your custom distro.
Since some of those patches are marked for stable they would be
automatically backported but I don't know who provides your custom
kernel.   AFAIK these are likely to be backported already by Redhat so
if you are using CentOS 8.2 or RHEL8.2 there is a good chance that
these are already in.

On Wed, Dec 9, 2020 at 2:18 PM Vidhesh Ramesh
<vidhesh.ramesh@komprise.com> wrote:
>
> Hi Steve,
>
> We mount cifs shares on our centos machines running kernel v4.19 using ba=
ckupoperator privileges using backupid, however we do not see that the back=
up intent is used for all calls. We did find fixes for them in 4.20 & 5.6 b=
ut not in 4.19. Would it be able to merge these commits to 4.19 as well ?
>
> Here are the commits of interest.
> 1. https://github.com/torvalds/linux/commit/5e19697b56a64004e2d0ff1bb952e=
a05493c088f - v4.19.rc1
> 2. https://github.com/torvalds/linux/commit/61351d6d54e651ec4098445afa5dd=
c2092c4741a - v4.20.rc1
> 3. https://github.com/torvalds/linux/commit/4d5bdf28690a304e089ce750efc8b=
7dd718945c7 - v4.20.rc1
> 4. https://github.com/torvalds/linux/commit/0f060936e490c6279dfe773d75d52=
6d3d3d77111 - v5.6-rc1
>
> Vidhesh Ramesh



--=20
Thanks,

Steve

