Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D02D1605
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 17:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=H1UR2zzkoftxZThszUHYJJPGdWXlgZpqoOF84bOX5p0=; b=NkzBki25RkGGPNhhw1XF/hKMpe
	EOaDFV6WT4e4eev7N7VtZLkd5qYs3SG70ejQeiDzWFEVleA2/F0z1mRTnRHYTB799mo5LHSrSzgqv
	RUtyzw4Q84huCgnuPM/IkZzg0itWJHLXuMglK/m2Wqz21KvdllBsw0/xgtfvzlajGiDgnaJCIiYcx
	BP7Yp9N4TYm4IqkUzgjH3qDZqkiKNr77sJe1MfVVRjw68iFqEuc+YwP9wcd72lAohkjeST7drY4qo
	2Mj8Bj6fXtayI7sxMGEs5VWEftsEK+zzizZq9A5zK4fkT+NvZx2ODLbYjJfygqyisF3+Xc+1Tu2Rk
	zz/dznyw==;
Received: from ip6-localhost ([::1]:43714 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmJS9-0005dA-PV; Mon, 07 Dec 2020 16:33:33 +0000
Received: from mta199a-ord.mtasv.net ([104.245.209.199]:40161) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmJS3-0005d3-1u
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 16:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=20200311092113pm;
 d=gget.it; 
 h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type; i=j@gget.it;
 bh=NlwjTPp0o3naeYTTKRmlrhjeLcg=;
 b=KnwXxgj4cIcwOaY4JgapnWNZudmiJ42eybuc+6CJpkvzPZCRnxu/AXo7VpfShaCuJ7FQo7Rjqsmy
 BVnWDDKKT/6z6moWgeGmIZpRegcRz++RVX1s0NzGxwCzrIJ0LwnRxlFmn9DpBKIeMD2s5jBUpe5W
 YEbqDeR2PCE1s2nlu8s=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=pm; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type;
 bh=NlwjTPp0o3naeYTTKRmlrhjeLcg=;
 b=0asayPygZhLWEFbKV8/NeTlAvHTkG0lNqFCiiPpNTwsAv+8C/fkPV1EGYtjKA83opsMHXDHb3ONx
 qmyz7LH7RYiDDUAGOd8MSYMLvpcQ4T6odWU8hYGFuzu/L6kgFdw5VL24ASbjtvkF0IZzyggO0vmR
 vvmSLWlTO2tkFSGF0yQ=
Received: by mta199a-ord.mtasv.net id hppcle27tk4e for
 <samba-technical@lists.samba.org>;
 Mon, 7 Dec 2020 11:23:05 -0500 (envelope-from <pm_bounces@pm-bounces.gget.it>)
X-PM-IP: 104.245.209.199
X-IADB-IP: 104.245.209.199
X-IADB-IP-REVERSE: 199.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=gget.it; s=20200311092113pm;
 c=relaxed/relaxed; i=j@gget.it; t=1607358185;
 h=cc:content-description:content-id:content-transfer-encoding:content-type:
 date:from:in-reply-to:list-archive:list-help:list-id:list-owner:list-post:
 list-subscribe:list-unsubscribe:mime-version:message-id:references:reply-to:
 resent-cc:resent-date:resent-from:resent-message-id:resent-sender:resent-to:
 sender:subject:to:feedback-id;
 bh=lgVAQ4b5L+M+sxNOSfg+HwtsUlEu4P6vhlcmBgwtbyM=;
 b=DG0FZ+bWlpi0KXYBKMDajZBmMoUViQngJ6rKUk4sQ2u0MnfjzZ6r7UXslsif7zOaW/4m9FX5Lpf
 R87E8hNI52VJWNb/FV9c38KSp7W0ZR+4xUcuLGmrQptaJ95Z5/7+CnUW/pMiXo3PaP8sk6bGKEKIk
 pyf+2kaFhDDB1X6xDHM=
Date: Mon, 07 Dec 2020 11:23:05 -0500
Subject: Samba + exFAT : how to avoid pre-allocating when copying big files?
Message-Id: <00a9f6a1-d316-40d1-a067-a39b1a60794b@mtasv.net>
To: samba-technical@lists.samba.org
X-Gm-Message-State: AOAM531L1XGrCaaDqnsnFxbBd8FxIApGWxdhX+EQfB0WaLzyvCmK8cJspcnlNCSbw6LTReH9P15+38jF1PQLxd9MQ9DwkXQ=
X-Google-Smtp-Source: ABdhPJytTQUozpeqD7EsN17AB4Ge281TgQsusfgEstMudRGbcEE/1TqlX/qh9dlDuRc4lg9p5fzCFLnve3+lG087Ydk=
X-Received: by 2002:a62:3:0:b029:160:d92:2680 with SMTP id
 3-20020a6200030000b02901600d922680mr16319574pfa.44.1607358184489;
 Mon, 07 Dec 2020 08:23:04 -0800 (PST)
X-Gmail-Original-Message-ID: <CA+BV=GXmDh-2kjEzdC3TQGiBAgE7YQDWGnBn6MFi0Q+ryzOC9w@mail.gmail.com>
Feedback-ID: s5244416-_:s5244416:a182037:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: 00a9f6a1-d316-40d1-a067-a39b1a60794b
X-PM-RCPT: |bTB8MTgyMDM3fDUyNDQ0MTZ8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZw==|
X-PM-Message-Options: v1;
 9Hcc_PIAriBnYBOfaIwCcyIPcaJJ4QcTBG0Vjf0upsLgpqRZa9tU6RIlMq6j-Xrc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Joseph via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joseph <j@gget.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,
When sending a big file (for example 2 GB) from a Windows computer to =
a
Linux computer (with Samba server), then:
* if the destination FS is ext4, NTFS, no problem
* if the destination FS is exfat, then there is a strange delay (~30
seconds) during which the Windows Explorer waits, before actually copy=
ing
the file
It seems that the Samba server first "preallocates" the 2GB, before
accepting to start the copy from Samba client.
Thus, 2GB (of probably null bytes?) are first written, and then, the
actual file is written.
How to avoid this effect that doubles the number of gigabytes written =
and
doubles the transfer time?

I have already tried:

    strict allocate =3D no

without any success in the exfat case.

Any idea?

PS:
* I've already tried exfat-fuse, but also exfat-nofuse, and also exfat=
 (non
fuse) included in Kernel 5.7, and it's the same.
* There are many forums posts with the same problem, e.g.
https://www.raspberrypi.org/forums/viewtopic.php?t=3D206866

Thanks,
Jo
