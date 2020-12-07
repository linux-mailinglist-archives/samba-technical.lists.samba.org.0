Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EDC2D17FD
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 18:59:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=qYgBXhuvG6a2XxYBw2BxqsrzY1iXwvul7k1VnhxXbrw=; b=0Vbk8H2kBi6hrhPQgTBYT+PLt4
	yXYz06oMaeye7d+J/xNtZN1pINiyg4M7l21m5+JJUAUYjwVa0BgrDDRI6MDhxjhoGI43Mkunwbt+/
	sMIp0dulJvkQ5P7yHiYJEtnZO+x8LbUz4i3wmeCNFkHBvq7YRGYb+v46h8veJGC8R7X5oAtV1PWnf
	MywIDSrkvgCuLSI+vi3f1RnDmPzTL9Tv+3i5zLnOsYdflv9ZM0JThMagwlYxO1Uo5xFdtI5KioeAv
	13h3ndCp2LblcZx6XHb1RRGiSynpPPbXl/vZifLlCOdLZLAuCgvuxyrR2wHoqAZWhQj8FrB52PbUv
	nj+0+sFQ==;
Received: from ip6-localhost ([::1]:45150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmKmT-0005t7-M5; Mon, 07 Dec 2020 17:58:37 +0000
Received: from mta216a-ord.mtasv.net ([104.245.209.216]:59218) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kmKmK-0005t0-9j
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 17:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=20200311092113pm;
 d=gget.it; 
 h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type; i=j@gget.it;
 bh=bULptNdsv+ZcAv2DBb6hOK9FwgQ=;
 b=SnerATxVu/uNGpxy/PMB8gKlaDBxisZLGlmzrAcmzekuExZ17yga8mv/oiZZJibnUH3Mpb838Py9
 7H8bjInCB/xJvilmYTAzZC9JVNGIpn7HBASPMFvgLM/Ful4DoxPF/YfymVkxblW0bvsc8x0y7w1x
 gonX+z/sMDrVy274KnY=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=pm; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type;
 bh=bULptNdsv+ZcAv2DBb6hOK9FwgQ=;
 b=LWTbQ3KBEEh9lZ7cvHbLxeA6NAU2mOI/NNmQhXU2Otev9k3v7VGHcLKshkElzqPbKmaQDD2d7Ego
 qaIUTvkp641j7gNJ+Flfn3vRHQmps4yoEZg6xpS6ed6rxItAbmdRZH5kHjc4DqhaG0A535SfxQbG
 qXJdC2IAWmoFifIz6uU=
Received: by mta216a-ord.mtasv.net id hppmk81jk5kc for
 <samba-technical@lists.samba.org>;
 Mon, 7 Dec 2020 12:58:08 -0500 (envelope-from <pm_bounces@pm-bounces.gget.it>)
X-PM-IP: 104.245.209.216
X-IADB-IP: 104.245.209.216
X-IADB-IP-REVERSE: 216.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=gget.it; s=20200311092113pm;
 c=relaxed/relaxed; i=j@gget.it; t=1607363888;
 h=cc:content-description:content-id:content-transfer-encoding:content-type:
 date:from:in-reply-to:list-archive:list-help:list-id:list-owner:list-post:
 list-subscribe:list-unsubscribe:mime-version:message-id:references:reply-to:
 resent-cc:resent-date:resent-from:resent-message-id:resent-sender:resent-to:
 sender:subject:to:feedback-id;
 bh=iOfA6sa0NdueXlwv6cLcT+IcyCd+URzMhQ25OWpsmXU=;
 b=YX/eKd5fMrGIEFb/6R63MJgj0sXDsmRMvgnDzoVgrUQsFxY0ygrSGwU2XtQhYVTedgY++NrYaNR
 6beu4lAgTo74H8BLQOb8bCHjI/OCItrGuhqRJuq3JPACnI1gY1ocUjBspY2svpRn+0z8blZfIdzCC
 +ul/9qLoKK72ZbZlvb8=
Date: Mon, 07 Dec 2020 12:58:08 -0500
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-Id: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
To: samba-technical@lists.samba.org
X-Gm-Message-State: AOAM531km7e3+ZteE8JWDYHcIlreIyi9ke7Kq17bTUrmW6kDRQ58+oALtxrjgh/vrgjuIqHfvdiqMQaR5IQrG/TPdlmjM1Y=
X-Google-Smtp-Source: ABdhPJyRyuK0ugX4C7Wf0zhUsMK408U6n6Fw836UD7EoEJrEROn/3hroJ9d+sxWlUF+qpoVzOfZetf/7/lVd2b7UnGQ=
X-Received: by 2002:a17:90a:f288:: with SMTP id fs8mr4332pjb.184.1607363887646;
 Mon, 07 Dec 2020 09:58:07 -0800 (PST)
X-Gmail-Original-Message-ID: <CA+BV=GWgy3qpg4FsqxN5hUJTce_rvk4qBUKLWMQhYJ13QD7YBw@mail.gmail.com>
Feedback-ID: s5244416-_:s5244416:a182037:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: 81fae2f8-970f-44a4-bb46-fb5237715070
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

Thank you Jeremy for your answer.
About your test, it seems the syntax might be 'seek' and not 'skip' (t=
he
former skips bytes on output, the latter skips on input, i.e. /dev/nul=
l),
so I tried this:
sudo dd if=3D/dev/zero of=3Dtest2 bs=3D1k count=3D1 seek=3D1M   # seek=
 1 million of
1k blocks, i.e. 1 GB
Do you confirm it's what you were talking about?
And you're right, it takes a *long* time, meaning that the full file i=
s
written, to only write 1k at the end...

---

I wonder why would the Windows Explorer client go to EOF first? Is the=
re a
way to see (on the Samba server) the log of *all* operations sent by a
Samba client and received by the server, including file open, file see=
k,
file close, etc.? So that we could see if there is a seek to
position=3D2,000,000 when copying a 2GB file ?

More generally, do you have any idea about how we could avoid this ann=
oying
behaviour?
Nowadays, many people use Samba + a Raspberry Pi or Linux in general t=
o do
a NAS, and many people choose exFAT or NFTS for Windows compatibility
(let's say one day, they need to take the HDD out of the NAS, and plug=
 it
to a Windows computer), since exFAT is well supported on both Windows =
and
Linux (the new non-fuse drivers seem good in terms of performance).

So it would be interesting to find a solution to address this exFAT
problem.

Would there be a trick, with maybe some clever use of a configuration =
Samba
option, to avoid this issue?
Or maybe could the Samba server send infos when connecting with the Wi=
ndows
client saying that it should *not* seek to EOF to preallocate space?
For example would there be an old version that prevents this to happen
(protocol =3D SMB1 ?)

Fingers crossed that we can find a nice solution :)
