Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB719F392
	for <lists+samba-technical@lfdr.de>; Mon,  6 Apr 2020 12:32:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rTjAw6hcLz7F7URna7kjqPpuYfBQ0NALkn5e4Ug+Ews=; b=IndSQGPpjia76/NhSp5acY2kqY
	4crjleXe2JuVCg3iV6EgO8I0TD199PLO04ChpJLu6EOtPP4rO/dWdjPwD6L8RWXCDZnqg5XAm31qu
	MvYNQ4dF9WY86pSwH9hXy/cwPTaL/opBD4cFkmyy8G+CW/n6cMSI/Ax+ZMPGhVa78o4OUG3jpWAKV
	mG9kNRvVdh6h0Md4G49AlU3csFA5O7pFo38PN0m7Xl0vKkJy4Q18FQ69UlQD010TMYf8SVY7xAosU
	akWlpDzK+BziWArIsBfVUHePif7610fnurifsjIIewIPjCI1eBiG8uifzDBXJf0gZeaVO9YuVCnj7
	pmO4rz3A==;
Received: from localhost ([::1]:23554 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jLP2O-003Y29-KG; Mon, 06 Apr 2020 10:31:28 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36930) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jLP2J-003Y22-4A
 for samba-technical@lists.samba.org; Mon, 06 Apr 2020 10:31:25 +0000
Received: by mail-lj1-x243.google.com with SMTP id r24so14064304ljd.4
 for <samba-technical@lists.samba.org>; Mon, 06 Apr 2020 03:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTjAw6hcLz7F7URna7kjqPpuYfBQ0NALkn5e4Ug+Ews=;
 b=JqfbB4M2vIRlMzET3GnBijmHejZkfXW4ry+6zHwQC/dY1DGD2JPk3l6Whm37KRABg8
 Eca++tc6us6AbZEtLKkG0HN8XT274xPyDQJR+CaG6lQxqaw9V0sp8nwLd+UWyEztzCJB
 jQzWtnvCMpyuG0CoxDyJN58eFlTsklYvm1e9N/GgJD20alNMdUBwQbXZvDRKlQI5FkCD
 g9bpmGElqnKrWM/jLQbwD2Q3PuiErPq6FOpHinbnZSnZY2mY41165XfMqyr9+dFKLxCJ
 E86BZJjF9eR3y9Jr37QZEuGp0X2yDRlx7IXxUDrhLh5XZOLcy9nYSMZ0n641voDYBXeF
 Fowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTjAw6hcLz7F7URna7kjqPpuYfBQ0NALkn5e4Ug+Ews=;
 b=CYrjrmRPWr2OLTsnCYxzApgMCmDNekKuk7rk5MFWr6oLaVr8Q3sWNsHEdOtJU0LmEq
 5CRrB4DJW2ybuCNv5SInOzPKX2bt2GCR+qxFaNwor3HoWrln6k8u3oBHwFmq80+K2Yj2
 00RZsH3XHnxSH1kSfDNRFrAcGIblwWdJ9anNEdl6voRtpesH/t0BbohPSUFJEb2b6IBZ
 lZ/hlDMpW6YWVpwkOGc7a6qpOS0OSTy4sMr14lSgEXvfv/rK0yuDsqaUp8ELoMawUhna
 0KGvEiwLXZkjnkVvKSP7NoimsdT9WrQBDU6FSWBcoE6UHeTeC2+TfXR9tnmxiKMKro0a
 KjOA==
X-Gm-Message-State: AGi0PuaMornAglKoVRi4GrPk8lmcqADGqiIL5xpzu2eYNRu8O4MnhqyR
 vwghZQNSvBvtwVS1LqpADvaH+PVAiXH396MklUtJ+A==
X-Google-Smtp-Source: APiQypKKStgU19ifK/tGyDSUGCg3xTSNywSi2YnjtNO9Ka+vyk6nUIlsSSS9fXxwnNXe3j7dNhMWyVtkkJrYlZAmBmc=
X-Received: by 2002:a2e:b610:: with SMTP id r16mr11962025ljn.254.1586169081970; 
 Mon, 06 Apr 2020 03:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAC-fF8Ry1imc+yxKpwi4qpZsjbzLejeRX5UB-LAvGM3=yM0A5g@mail.gmail.com>
 <1623918.IrRfrNb6Vh@magrathea>
 <4ad69f25787587db5f342ca556c76873d879dafe.camel@samba.org>
In-Reply-To: <4ad69f25787587db5f342ca556c76873d879dafe.camel@samba.org>
Date: Mon, 6 Apr 2020 12:31:10 +0200
Message-ID: <CAC-fF8TsSt9b_q4bNqSFzDU766gWZK=2-hFGod1dtyQupPL-iQ@mail.gmail.com>
Subject: Re: gitlab: mit-kdc on fedora 32 with krb5 v1.18
To: Andrew Bartlett <abartlet@samba.org>
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Andreas Schneider <asn@samba.org>, Alexander Bokovoy <ab@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 6, 2020 at 9:35 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Mon, 2020-04-06 at 08:43 +0200, Andreas Schneider via samba-
> technical wrote:
> > On Saturday, 4 April 2020 17:12:38 CEST Isaac Boukris wrote:
> > > Hi Andreas, all
> >
> > Hi Isaac,
> >
> > > Any idea how to make the mit-kdc build run on fedora 32 with krb5
> > > v1.18 in gitlab? It looks like it currently isn't.
> > >
> > > https://gitlab.com/samba-team/devel/samba/-/commits/iboukris-test
> >
> > I guess the way would be to add a new target in scripts/autobuild.py
> >
> > then duplicate the mitkrb5 entry in .gitlab-ci.yml and use the
> > fedora32 image.
> >
> > https://gitlab.com/samba-team/samba/-/merge_requests/1216/diffs?
> > commit_id=43c943a01a84d810f4784b5f2d1c5fdf52fa382b
>
> Can we please just have one OS for the mit-kdc builds please?
>
> If Fedora 32 is the best target for this development work, then please
> move all the MIT jobs over to that OS.  That will also avoid trying to
> develop for multiple MIT kerberos versions.

Ideally we need to make sure not to break it for the current MIT
versions used by distros. I realize we can't test all of them but one
build is rather limiting.

> In the medium term we need to be importing the known-to-work-with MIT
> version into one of the docker images, so we have a way to patch it
> rather than waiting for changes to come via the distributions.

My preference would be to have one build using MIT master branch (or
latest known working hash, which we increment as we go).

