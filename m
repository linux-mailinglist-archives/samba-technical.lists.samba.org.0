Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4322D1A44
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 21:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=lQMOsR5U79RzHHEME2YJxhja6BEuIlflh0t62mKxer4=; b=5/8/pEeJUALpXqYEL0NohdBbPp
	UIQsuhk/huVoOhznvXAwFLi4imc0EdmWnW+v08vVI0uUMjQuZVqS2fJ+PLU6nEDZmSS+no/OA6KXY
	H8Zs3pRTjm9GvgtNzhYVTrmMvFOPAFUontjeoPSa/ZRL0q6C5OevtlmiOnQ0LXlqT6P4U4DZP9ZPP
	JhBEdqy3BxoUSaMoy8XYpu9Sr5yvPEM6zRsFIqXOVvV6iqQNa2XfgRsstmfIiOFBv6NNjeMCZjtoX
	wMJfRhT1o5Eeh9o+abmC2l9EmgZHnzsN3XM86oWhPnry6wz4u8OsSnP65hkJDSitTzqiPPDRAQ638
	3uc5IhEw==;
Received: from ip6-localhost ([::1]:52076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmMoD-0006yo-Go; Mon, 07 Dec 2020 20:08:33 +0000
Received: from mta214a-ord.mtasv.net ([104.245.209.214]:62707) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmMo3-0006xu-Qa
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 20:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=20200311092113pm;
 d=gget.it; 
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 i=j@gget.it; bh=pdvDMDBhQctc1LjGVEZ3EPW421g=;
 b=FHn/mkjDmX2h2BsfV0Jdsk58wG3m8iayroaEHr4TMAGKSYK8XM33kxwXdyqml7s6XwM4/Dh/g7+R
 zP7ZR0XTc3klIGAI1CE4fFyxg/r3T5qXL51KDQYMoUxkRqRAxIwnPdgEuVYtXIZ9O39+SMDRSsSU
 cRsYRxJStiycz4sy9cA=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=pm; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:To:Cc:References:In-Reply-To:MIME-Version:Content-Type;
 bh=pdvDMDBhQctc1LjGVEZ3EPW421g=;
 b=iq2i89DiHX5qwQZXVJmw/hlc+9taZ00AyXdfb1QOFJEfOkv+I7kVS0mTXy7I/QV+REl/Oq/DrxzA
 yZoaVQ6z65vvTdjDvLOKj0heaZISjk5Ktgm3kGS/wI/6wKqCT2RVUSU2iESxIcKq+V68Qi0+0gDC
 lqW3Zz9quSZANi9GRBg=
Received: by mta214a-ord.mtasv.net id hpq5re27tk4a for
 <samba-technical@lists.samba.org>;
 Mon, 7 Dec 2020 15:07:55 -0500 (envelope-from <pm_bounces@pm-bounces.gget.it>)
X-PM-IP: 104.245.209.214
X-IADB-IP: 104.245.209.214
X-IADB-IP-REVERSE: 214.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=gget.it; s=20200311092113pm;
 c=relaxed/relaxed; i=j@gget.it; t=1607371675;
 h=cc:content-description:content-id:content-transfer-encoding:content-type:
 date:from:in-reply-to:list-archive:list-help:list-id:list-owner:list-post:
 list-subscribe:list-unsubscribe:mime-version:message-id:references:reply-to:
 resent-cc:resent-date:resent-from:resent-message-id:resent-sender:resent-to:
 sender:subject:to:feedback-id;
 bh=TGhO1yW0m+/wXcnLenXKAk2NZUfkGdVlrnUZe6cmqF8=;
 b=g9zbkNKT4t/0Or6S3aNXEZkukZvgT0a79isNWb9MZE5ucBXSZgxHfL0LYjmyGbNlbcx1DLgDE2R
 wJhiYLFRlTtFHg+aKZGvNbKGGOZtKhpFgYCUwnJ8gP66V3Khg6d1zupqdpcP5F2pYNeis4rd5apeJ
 KhL99vnbPr3QuEXmzm8=
Date: Mon, 07 Dec 2020 15:07:55 -0500
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-Id: <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
To: Jeremy Allison <jra@samba.org>
X-Gm-Message-State: AOAM533GuaypTckDdK/6nJMCCTu5zcBO3hzZg22Ck4Tgt5x8Tm3z67DZ9AVUbl8Vt0IPnJzNnxTmjFHeEC7jXCdcSa8pjTw=
X-Google-Smtp-Source: ABdhPJym3Q0nzxrAhNy+QKMkD+K7XFcljsRpp7KTuPkeJjysajkphaRBKZThEP6zHU/04zWSsE4y5Gz66WnqS3nXMXk=
X-Received: by 2002:a63:985:: with SMTP id 127mr19525984pgj.449.1607371674590;
 Mon, 07 Dec 2020 12:07:54 -0800 (PST)
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
In-Reply-To: <20201207180509.GD1730617@jeremy-acer>
X-Gmail-Original-Message-ID: <CA+BV=GU4dBz2mF0-WaZC24TtFRUzTV7W3L-YK-t+WUzDLdbkAg@mail.gmail.com>
Feedback-ID: s5244416-_:s5244416:a182037:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: d056cc18-3ef5-4cdd-b25d-bbf86d041787
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you for your response Jeremy.
Good news: if I still write *from Windows*, but from a Python script l=
ike
this:

    import os
    with open(r'\\RASPBERRYPI\public\test\hello.txt', 'wb') as f:
        for i in range(100):
            f.write(os.urandom(10*1000*1000))  # 10 MB blocks

then the problem does not happen: each 10MB block is appended one afte=
r
another, and there is no "preallocation".
This seems totally logical, but happy to see it working: so writing fr=
om
Windows to a remote Linux+Samba+exFAT computer in itself is working fi=
ne!
(if the client is *not* Window Explorer, but another file-copying proc=
ess,
such as the Python script here)

Now the only problem is the Windows Explorer file copy which probably =
does
this EOF fileseek to be sure there's no ENOSPC error.

Is there a full verbosity logging in Samba server that would allow me =
to
see exactly which open(), write(), seek() are sent by the Windows Expl=
orer
Samba client to the Samba server? Can we log so precisely all IO calls=
? I'm
curious to see what Windows Explorer is sending exactly.

Since millions of people use exFAT in the NAS context (especially in t=
he
RaspPi world and also people who use media players / TV which don't su=
pport
ext4 but only NTFS or exFAT), it would be great to see if a fix could =
be
possible :)
I've literally seen dozens of forum posts about nearly exactly this is=
sue
(NAS-related / RaspPi / media-players-related forums, ec.).

I would be happy to analyze precisely what the Explorer does to see if=
 a
trick could solve this.

PS: perhaps just *not* doing a flush() after the "seek EOF" would be e=
nough.
Indeed I noticed that, on the Linux computer, with Python:

    with open('/mnt/exfat/test.bin', 'wb') as f:
        f.seek(1000*1000*1000)  # move 1 GB forward, no delay!
        f.write(b'END')                  # no delay!
        f.seek(0)                           # go to the beginning to
actually write the file content, no delay!
        f.write(...)                          # write the actual file
content

all the first lines happen without any delay. There is a delay if and =
only
if we flush() after the seek() or write(b'END'), but we could easily b=
ypass
this.
With this method, the 1GB is written only once on disk, and not two ti=
mes.

All the best.
