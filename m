Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78D1072CC
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 14:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/udDQgD82MkirZ/kWXcDWVzOzMiPr5L2d2klEQMhgzI=; b=rs6HBlsF35tEFSyEDFhZjzfapD
	obFueTPYsK4SwTyvGc3nLpeSaJWKX92nDgAiKg1cjzgx9UwDcxK22pPxcX/rsgkGjiX4grjpuKjQ+
	o1+LC/iDZb0/6gz3zv3ZP/OGeV7KOfVSFKsWAn412ZmNFRCNCPTvr/u3KyfyCn630ck3koCszcF6c
	a92G2KJP95crW3YOLP2EKoGJMDQh1J1gm0wzvpECwabiWXY7t3zuaEjK3C/wQpx7tJvVzXcC/zZr1
	ydDljqN181OVbaZhLVR7e1Q6joilPqzfbrnuBakc6A7Yz9oWDe35HTMXc0PQYaJH3Imr8SJ4+83Ef
	3onlsmww==;
Received: from localhost ([::1]:61614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY8fV-0022mK-T1; Fri, 22 Nov 2019 13:08:14 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:34617) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY8fQ-0022mD-3y
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 13:08:10 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id t184so1630665vka.1
 for <samba-technical@lists.samba.org>; Fri, 22 Nov 2019 05:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5cf/mmGLkZKmgWpVEfOy47bPjMP6QJaQd9ESz5Zv+1Y=;
 b=GoBo+ojU6WEmuCGZiyKg9C1xG1aaEQM3mh7brmugxIav/bffKol1s/8S/V/HmVqTzI
 EZZsQcNU5IfStiSloEpc6ZegeyU6smiVuKWkEahkV0AC7dy11sJ0tYC6QuRBG43tzsKz
 wMoSJ3DJoa3wtYH4/DhHIoRZzBIp2OzegzvmTLz/uKXS7pYanwOvcwN7xF+SypUndunl
 da56iQSnoN31pWEEfbUj017waSUOiRMpl4XjUXfxi6f+UHwXSmE6zKHaOv1SUSfh/ATY
 QsU8w+zl6B7pj7ioXTrIxg2sanjM2EIxEf4tF6q7h5m5fnJZiBoEO+ayEWPBEdovId6s
 YYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5cf/mmGLkZKmgWpVEfOy47bPjMP6QJaQd9ESz5Zv+1Y=;
 b=Vr4pGOXF7nFL2KfQ43y/BygyiQxHteBd8+vO2dQYPaJNiGhCLUeQFh/mfw2eQGiQsL
 ptSUmDZvhH2rKh8+r6KSsPXba093Kdp92e5s1DWuLH5dAVOMFO9R4i4gBLNsqLsiI0Bt
 PQrRTmjXz96D65pC6EC48nf/o99qsWDFGjjRZnhbOu0suRNdk3O/WPtxqilp9/EdB7lR
 CMKLGUjz7SWWl9q5P52o/54Xy3QpKqjwHVIIm7z0aMcZt9lx4b4kyqgQxuP18jscsN++
 /wCSy/oWlUagp/vM+cvd/y5eHcDmENrU9weKNsNkBF8QGDX6I3MsMI3BhW+e6o3/dfh9
 DY6g==
X-Gm-Message-State: APjAAAXAVt+SCtDg01D8B0kpVdT/Ue9gK3icluUPMCCp1fRfMHqvBmuj
 5/tydszrITqR+elJ4Y5wBdAkJxN4uYa2As/IMK9Sa5tUevw=
X-Google-Smtp-Source: APXvYqwBJNCsprMm7YPhCoM9ufTjWAfmcNZ8GJjz2TzjO3bdCNnzoLV2dHHXCkXipbql5h6CxyKsgJVTTApkQruMmnA=
X-Received: by 2002:a1f:94c7:: with SMTP id w190mr9438611vkd.62.1574428086023; 
 Fri, 22 Nov 2019 05:08:06 -0800 (PST)
MIME-Version: 1.0
References: <CAGYhc9=AZmkOjHAGx7rWd=iM6h5BaVohym+oWMWqfNEfNtju3Q@mail.gmail.com>
 <20d3f005503d82862b0ba8856010ae7a8831d577.camel@samba.org>
 <CAGYhc9nN1cf3KD52mJG0ROmNYXDGXuA7c-KML33W+Qec0jOkrw@mail.gmail.com>
 <c982637749a9629cf45b2481242d809532cfe8c1.camel@samba.org>
In-Reply-To: <c982637749a9629cf45b2481242d809532cfe8c1.camel@samba.org>
Date: Fri, 22 Nov 2019 13:07:54 +0000
Message-ID: <CAGYhc9k-nVC48C3uxYKA=g031LqTpPEtJYedDi_Z9Ug5NHA-tA@mail.gmail.com>
Subject: Re: building source3 subsystems and libs
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: moore chestnut via samba-technical <samba-technical@lists.samba.org>
Reply-To: moore chestnut <moore.43132@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hello Andrew:

regarding why:
- initially because I'm finding my way around this code base and I dont
know all the options... :-)
- I want a simplified, lean client that I have can use for testing and
understanding.
- a starting point i was looking at was the rpc_open_tcp and then try build
on that with the functionality in netlogon_creds_cli.c for a ntlm pass
thru, but even that has lots of dependencies.

otherwise, as an end goal, this might be something that I want to use in an
extremely constrained embedded environment.
so having full samba build/deployment is not going to be an option.
the list of dependencies and nested dependencies is long so I want to
determine if a streamlined client is possible.

rpcclient bin itself is fully loaded with dependencies and even a test with
NETLOGON command uses lsarpc, over dcerpc over smb over tcp.
Of course there is high chance I'm misunderstanding and based on what I
think I need around dcerpc bind, epm mapper, schannel netrlogonsamlogon for
ntlm pass thru.

your thoughts appreciated.

thank you.


On Thu, 21 Nov 2019 at 23:07, Andrew Bartlett <abartlet@samba.org> wrote:

> Is there a reason why you first want to untangle our build system?
>
> I would suggest first just creating a new binary, which links against
> whatever it needs to (and we have great helper libraries for the things
> you need for the below).
>
> rpcclient has a samlogon command that does what you need, I would just
> cut that down.
>
> But why not just use winbind via ntlm_auth or libwbclient?  That has
> everything setup and ready to go, manages the connection and
> everything.
>
> Perhaps it would help to explain your use case first.
>
> Thanks!
>
> Andrew Bartlett
>
> On Thu, 2019-11-21 at 22:52 +0000, moore chestnut wrote:
> > Hello Andrew,
> >
> > thank you for reply.
> >
> > so would it be bad a idea to try hack a build together based on the
> > source files of msrpc3 and the deps?
> >
> > essentially I would like to hack a client together to do dcerpc bind,
> > epm mapper request, followed by bind and schannel setup (
> > NetrServerReqChallenge and NetRServerReqAuthenticate3) followed by
> > bind and NetrLogonSamLogonWithFlags.
> >
> > Any suggestions on best approach?
> >
> >
> >
> >
> >
> >
> >
> > On Thu, 21 Nov 2019 at 18:18, Andrew Bartlett <abartlet@samba.org>
> > wrote:
> > > On Thu, 2019-11-21 at 18:09 +0000, moore chestnut via samba-
> > > technical
> > > wrote:
> > > >   hello,
> > > >
> > > > is there any way to individually build subsystems and libraries?
> > > >
> > > > for example:
> > > >
> > > > the msrpc3 library in  source3/wscript_build
> > > > bld.SAMBA3_LIBRARY('msrpc3',
> > > >
> > > > or
> > > > bld.SAMBA3_SUBSYSTEM('samba3util',
> > > >
> > > > when I try waf or waf msrpc3 in the source3 dir, it does not
> > > work.
> > > >
> > > > currently trying on a 4.11.0 source tree.
> > > >
> > > > I have read through the https://wiki.samba.org/index.php/Waf
> > > > and tried the samples with no success.
> > > >
> > > > Does this work for source3 libs/subsystems?
> > >
> > > No, you can't really build bits of Samba in general.  Some binary
> > > targets can be specified with the --targets option, and a few of
> > > these
> > > work correctly, nothing beyond that has been tested.  So where it
> > > works
> > > it works, but nobody is really working to have this be a general
> > > feature.
> > >
> > > Andrew Bartlett
> > >
> --
> Andrew Bartlett
> https://samba.org/~abartlet/
> Authentication Developer, Samba Team         https://samba.org
> Samba Development and Support, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>
>
>
