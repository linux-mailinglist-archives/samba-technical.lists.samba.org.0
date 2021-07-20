Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 699643CF42A
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jul 2021 07:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=gkKS9UeWYLbKCvFqhzAUWLapEZcgOceDPPmcOefgluM=; b=lKQlxnyEY20t2F24IoGlCRzMJi
	IhqmVkOIwfXCa0g6nfTge1/Cp/cc7iolqKXdI3zBkWA8PmzlNkE7T+QFWqctdEVPCm8S1fr4Nz8eY
	DwmtI9Yni+WBCcOop7y4OmKxcq3hHrRqmkT+dq2AGhVF1aUsH6oEce55iM9jTz0xOYwWiI2n4oEjQ
	NJ+5m65pbEfdBVeBhN1ssETNKaCcfWbK08hYCyRRWwIizfvo/E0jSRYHX/KHJjkYOFa3vNdIUrfw8
	EMdESAU4M+ioNTiN11oWc6HrpjveNVgSLq1X2JKOLJj34LCAJs3CJlC4hmxUwcKMsESIR5zuEgK5+
	3ldPZXiA==;
Received: from ip6-localhost ([::1]:22552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m5imr-00FEXI-CR; Tue, 20 Jul 2021 05:59:25 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34437) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5imi-00FEX9-Mb
 for samba-technical@lists.samba.org; Tue, 20 Jul 2021 05:59:19 +0000
Received: by mail-pg1-x535.google.com with SMTP id 130so499606pgg.1
 for <samba-technical@lists.samba.org>; Mon, 19 Jul 2021 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gkKS9UeWYLbKCvFqhzAUWLapEZcgOceDPPmcOefgluM=;
 b=jXfOQYqvViWqNiTgAeFqKLpN8JVf+WImPyC7V/C6+X8yjb0gONrIY4bxJKB4waNeUF
 ariRalPfCg/tzOKvAjZ6OB6Renr+gLfiEAzHCryWehTwYx8lBVu58cFKSnfavbllje5/
 ZRfIYJdWwR6WyHd0tHZ5D7uOHloIqA628c7fdw6hQAc/j/impDYTjoIfEuqZ8rU9RsLi
 H7C8VBoY96+RaBVX9FlYmxlqRzMTZD+fg8uxvTii137Fy4f1+RIfNWj5+Fqyj7g7P+cK
 CtfCZEOgHxjiyzZj87Uu5BhYFPvLABoAZYfmi5q2jCHjg+lve+3AHoearYT4O6PkXTLr
 hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gkKS9UeWYLbKCvFqhzAUWLapEZcgOceDPPmcOefgluM=;
 b=tE1+4pv4EQHXy6FQQDr0lhYu0qhvn4zckFwY0Gc9E5dI94Q4hdQ+u/WiahzPW+ye/G
 iT0uv94ntj7zvncP0C/EQ9tIEYK4/jq6yi1+SP61Gisn8e2tc0LzkunFScy8cXT/yUAj
 Dg3EqyT5Pts06jb2x42j1QIndRUbupMFYG3Nj5wqO+QvdbjKhmiIBFf3FnRpuln2HDKw
 eQaq7pxilvzGKODYkIpLTt5C0UAh0wXcrAxmtXXm9KmTbeIrtVZhCtZbmJAT1MwlfT+L
 rRrpPjSi2qGcWVBd6J9LhWfAnHHrvBab/GphefvsxZxM1oJNvhUlZ9mM8FBWn75gNnj+
 zjWA==
X-Gm-Message-State: AOAM532U67wn88ykH/OSZXATXe4H9662DjQcj8FFk2mjuDtsjV8i9Kbe
 ps0sdZStQ0PiFxGNA0UW05YhF9JBKvQEjonHWSh+cFnc
X-Google-Smtp-Source: ABdhPJwk9tPlKB1iyXBGzo22zGyuu9BTstFWhuL9J6WDY3Ts8MKTOurUSzr4egDQytz4I6ptZNE+tefvINTFrXUSEHs=
X-Received: by 2002:a63:d311:: with SMTP id b17mr28550066pgg.332.1626760754003; 
 Mon, 19 Jul 2021 22:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <2450252.vFx2qVVIhK@edfu>
 <CAJ+X7mSHG_OUyNF2EiuvEtCQYJ4vOEH67kW0+1rOsLNp4BqaaQ@mail.gmail.com>
 <CAJ+X7mTSNvN=6v0-WSz_89Gjkg5rCf-AmDcVLo=LLmOhSWkyMw@mail.gmail.com>
 <2917630.lGaqSPkdTl@edfu> <2D9E704E-CBB4-4F27-94DD-5AFF80EE9482@samba.org>
 <CAJ+X7mS8WZnsimhonxEBjrwCjj8X=3Cmq=-tc1Xuv+0htoLk9A@mail.gmail.com>
 <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
In-Reply-To: <88C43F2E-84D1-4065-969F-D3572DBCDF58@samba.org>
Date: Tue, 20 Jul 2021 15:59:02 +1000
Message-ID: <CAJ+X7mTdkF4+52wCfMC1SrmyzJ2Xq4VKKBkJ=qFPgOwiekG2Kw@mail.gmail.com>
Subject: Re: CTDB Segfault in a container-based env - Looking for pointers
To: Michael Adam <obnox@samba.org>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: John Mulligan <phlogistonjohn@asynchrono.us>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Michael,

On Fri, Jul 16, 2021 at 5:47 PM Michael Adam <obnox@samba.org> wrote:
>
>
> Yes, as John and I have demonstrated in our sambaXP presentation,
>
> https://sambaxp.org/fileadmin/user_upload/sambaxp2021-slides/Mulligan_Ada=
m_samba_operator.pdf
> https://www.youtube.com/watch?v=3DmG-Jxaf8_gw

The presentation provided me with the required background. :-)

> As Alexander explained in his mail, the =E2=80=9Cmicroservice=E2=80=9D ap=
proach is a paradigm by which each container should be as simple as possibl=
e, ideally just encapsulating a single process, and containers interacting =
with each other over network and other interfaces, possible multiple contai=
ners bundled into a pod if needed and appropriate. One fundamental idea beh=
ind this is this: if the application / service is comprised of multiple com=
ponents, and each component is isolated in a container image that is as min=
imal as possible, the whole management of the application like scaling of i=
ndividual components etc can all be done by a generic container orchestrati=
on system, in our case kubernetes. This just works best if each container i=
s minimal. Rescheduling a more complex, heavyweight container multiple serv=
er components in that same container is possibly much more disruptive and p=
roblematic.

This is the part I struggle with the most.  Even though you might
separate individual processes in containers (just because you can) and
group them as a pod, for me conceptually that pod (with multiple
containers) is providing the required service and like to think that
as a unit of abstraction.  You cannot deploy the service with only
partial pod (some of the containers), so every time you need to deploy
it's all the containers or nothing.  There might be an advantage to
separate the individual processes in containers, but I fail to see it.
If one container in a pod goes down, the whole pod is inactive because
it cannot provide the service.  In such a situation, just restarting
the failed container might not restart the service (it will depend on
the code that's running in the failed container).  From this point of
view, one needs to run a bunch of daemons as a single unit (whether
you call it a pod or I mis-refer to it as a container) to provide the
service.

>
> Since we are looking at managing samba as much as possible in a kubernete=
s/container-native way here (see the sambaXP preso), it is natural to aim a=
t as much a micro-service approach as possible. We will certainly have to d=
o some modifications to Samba / ctdb itself at some point to go the last mi=
le, and I am convinced that this will be beneficial to the software as such=
, but of course the first approach is to see how far we can get without any=
 modifications.

I would not like to call samba a microservice (may be in a scaling up
context with non-overlapping shares).  Clustered samba instance is
probably more like a microservice in the cloud native way of scaling
out (as you can spin up more instances to handle more load).  But
let's not get stuck in semantics. :-)

>
> But since you know what the real issue is, would you please enlighten us?=
 :-)

The issue is that CTDB makes assumptions about the orphan processes.
On most unix systems, an orphan process gets re-parented to init which
traditionally has pid =3D 1.  This assumption is built into the code to
avoid runaway orhan processes in CTDB.

In the container world, what happens to orphan processes?

>
> Even if you don=E2=80=99t see a real benefit of this containerized layout=
 just yet, it might still be beneficial for the code to consider some modif=
ications to make ctdb more =E2=80=9Ccontainer-ready=E2=80=9D...

Provided it makes sense. ;-)

Amitay.

