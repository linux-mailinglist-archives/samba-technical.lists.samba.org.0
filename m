Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80923D656
	for <lists+samba-technical@lfdr.de>; Thu,  6 Aug 2020 07:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=DQLDPXTS0Y7YEvXuq1ncX+uiIcGNeSZ/ZUEVbT20k8M=; b=ZJCruaaFO1VQz6Q+IqCOx/3TDp
	19fx32w2X7cxWlkO7mAQm9ysI2mTnHSkTwFlRbeArGNf5idPr1lrx3F6HwJHB6OG1Q868J/jSsjfa
	bo8UWI5VhyJRNtK5BDf8t+fMy9lrFYlc5oeUk1K5AXN6Ed42CBT3U3T1VNN0cd1Rjj4j11GOuVn/b
	q5kWw51a2G7zbF2F/ty8pdVz1g+3HjnocG1S1VLV6o29bapJro/x0CysO4RcCXdvhzluvrJwA6O8K
	ITwqLWdi2mESLK8utJvZfEuqScC5iwC9+AIBdw+qBWlMfDNg8IRu+QHFnUapT9GeLqfro1hOBOFLP
	PbmabIYg==;
Received: from localhost ([::1]:34216 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k3Y7p-00Ca8J-A0; Thu, 06 Aug 2020 05:07:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43770) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k3Y7f-00Ca8C-2a
 for samba-technical@lists.samba.org; Thu, 06 Aug 2020 05:07:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id m22so5771123eje.10
 for <samba-technical@lists.samba.org>; Wed, 05 Aug 2020 22:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlWEqmOUpFzLIHJSJOh7JI3BZwoUXlJI9TlrlcVhyfk=;
 b=q/2BVBdpYRqk/sQg5siQDCTxhhPjIUh9gmZvwXfWUnlwBP/cMDlVBqrM/PNsCXM6H3
 HUU42jHZ4GJMXH40bIKgN7J5er8lTcnq7ZpCC3ftPqz9f8ytS+c3xZdg+uMEaIAiFjDa
 CdXhlzuI5him8SoeGmu1Rx9KgHBxON4MbL8kp1ONPynrcMcBhHZcozm8gcQ+67MItXYG
 KGRAIkZY577sZZjIAaVtQ9PU+Gv2GFYqhzK4MUe24G3Coxk8TD+qM+2cVyFvfKpV4ONv
 v4bE0Ow1O5CwSAIOpth26adZMemNUvlgLv2itQCPMcQm/63987xRrwVF/C5K/fmRW3Nz
 wDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlWEqmOUpFzLIHJSJOh7JI3BZwoUXlJI9TlrlcVhyfk=;
 b=Lm/D0OMhGMq4b2mIcLMA1+TEdMCN94gWQRYlP+7LHqPOmePd/U8TaYlAjmWaPwMJpu
 D41lZU6BCFe4NdgorkP0X+6xrFr3l32mF5iJ9TQ6Ej0pa2hnQ1bIdlM5FxFXow6G+Pkb
 0jS9Dc0yOxExOLqGRszFZNEX0C6I+KDbabnSHHei1yH+V4wml0+3WBiQu9mU4Zn6Sv+a
 4i5pta9eTGvReGzG2O2o2TmmMMrn7iL2ZP/gVEiaeuLguDBVND/y6toBSgG4EgNOrQ0G
 K+7jAv18fsiNeYIPYOp0BVbltV0uZvOj1VuV6kzxgsDD+2AQoEWSbClFqo5Y79VTV/17
 +kTA==
X-Gm-Message-State: AOAM531H++FZjPjSd9xUGGs3mrrDhtFHNfzew4/V3uaIM3QUsMHoDi5L
 s+jXPu30EPa2KdA1xjMzBt1q2GjIuqf/qNl74vI=
X-Google-Smtp-Source: ABdhPJylUFEpl6tFvKk3bh9+DDFriCwsAYDLeHhlOzRqOgc71/UqJBkGZTB9OkqQ57uGKEnwSBWmqiKHhwsbrwN3Dd4=
X-Received: by 2002:a17:906:f8d9:: with SMTP id
 lh25mr2700228ejb.458.1596690440532; 
 Wed, 05 Aug 2020 22:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAH72RCW7gZ9sntyTzp9AHSbZG8xzLPHL5R3m7Nk7eUrUk+-QCg@mail.gmail.com>
 <9bd1427d-1377-2c93-9546-f5ebae99e2b5@samba.org>
In-Reply-To: <9bd1427d-1377-2c93-9546-f5ebae99e2b5@samba.org>
Date: Thu, 6 Aug 2020 08:07:08 +0300
Message-ID: <CAH72RCVFAX0h4iZmO6x6kNJ30Sn1uy9fZzvgnB3HfRhYD1YvmQ@mail.gmail.com>
Subject: Re: GSoC Progress update
To: Rowland penny <rpenny@samba.org>
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
From: hezekiah maina via samba-technical <samba-technical@lists.samba.org>
Reply-To: hezekiah maina <hezekiahmaina3@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the feedback.

On Wed, Aug 5, 2020, 9:55 PM Rowland penny <rpenny@samba.org> wrote:

> On 05/08/2020 09:36, hezekiah maina via samba-technical wrote:
> > Over the past two weeks I have been working on the following:
> > Packing for various based distributions.
> > I have started by first targeting Fedora 32 with more to come later.
> > Group Policy Object (GPO) management. Some of the features includes
> > creating a GPO, deleting a GPO, listing GPOs, listing containers,
> deleting
> > links to containers, downloading a GPO, backing up a GPO, Setting a GPO
> > link, restoring a GPO, Setting inheritance, getting the inheritance and
> > showing information for a GPO.
> > Flexible Single Master Operations (FSMO) roles Management. Features
> > includes seizing roles, transferring roles and listing the roles.
> >
> > The link to the repo:
> > https://gitlab.com/HezekiahM/samba-ad-dc
> >
> > The link to the Open Build Service:
> > https://build.opensuse.org/package/show/home:Hezekiah/samba-ad-dc
>
> Hi Hezekiah, after finally getting cockpit to work on Devuan, it is
> looking good, but (and isn't there always a but :) )
>
> nmp on Devuan (and hence Debian) isn't new enough (this is just for info)
>
> When I ran 'make install', there was an error, it couldn't copy the .xml
> file:
>
> cp org.cockpit-project.cockpit-samba-ad-dc.metainfo.xml
> /usr/share/metainfo/
>
> This was because in 'Makefile' there was this line:
>
> cp org.cockpit-project.$(PACKAGE_NAME).metainfo.xml
> $(DESTDIR)/usr/share/metainfo/
>
> '$(PACKAGE_NAME)' is set with this line:
>
> PACKAGE_NAME := $(shell awk '/"name":/ {gsub(/[",]/, "", $$2); print
> $$2}' package.json)
>
> and 'package.json' contains this:
>
> "name": "cockpit-samba-ad-dc",
>
> So, it is looking for
> 'org.cockpit-project.cockpit-samba-ad-dc.metainfo.xml' but the file
> supplied is actually:
>
> org.cockpit-project.samba-ad-dc.metainfo.xml
>
> Otherwise, good work so far ;-)
>
> Rowland
>
>
>
