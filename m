Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4267879F8
	for <lists+samba-technical@lfdr.de>; Thu, 24 Aug 2023 23:11:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=yPPRrcT/yUPOCzpv05mwWkcP84GBDmCav6kNDoKUBTc=; b=oMOGqTkeUAq20INthp+Lqbd6UQ
	+adR548BRgsMgk566+dUJQIaGx0159Ma9r8imhF7n1xHDGIrQpZ6ZwVjlCxh2iVSrZb86bhfu2qca
	PBD0H5ZCCxlBJ08juPNbLu+JXHb2r/wTBAb4jj+pJEsGrr12UsSKXby7ekXzGqr4+b0GnPqCFuIO/
	11ta197ltkn50BS1JJkGDqMLBfrg0bvxGw+fz8uG4fkSZh0oo8LNxysvypsGsmaki8e+/7nJQfHse
	qirsLYSQeWtIkmqLrDWCbIIncbxL+ys14Kqi+7FsyKbHWBlIMhtbUzyXxl3wox6qYYWTsuFS61Bsr
	+SAxJiMw==;
Received: from ip6-localhost ([::1]:60766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZHbU-00ENkw-8M; Thu, 24 Aug 2023 21:10:56 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:49372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZHbJ-00ENkn-2v
 for samba-technical@lists.samba.org; Thu, 24 Aug 2023 21:10:50 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9cdba1228so3422871fa.2
 for <samba-technical@lists.samba.org>; Thu, 24 Aug 2023 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692911438; x=1693516238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPPRrcT/yUPOCzpv05mwWkcP84GBDmCav6kNDoKUBTc=;
 b=PwKx9iKcU2qOozo2tEntrsuHd6aEKPxhpQJb6iDESXo4GMXy+bUQa10ako2EMoAcMi
 6BHXfwx8boVLgIk1dXyB+upAc97RGaro9XgZO65TaPx3nEMS8JWFbj3/S8r1o2Udfpy+
 FDMpMg4ILjCMrd1oR/ot1/Fq4+S3AtTCCpr+fjJyXElcKEgzLXgEQ/Pfe2937ZNw2/+o
 ZLH6FIdLLuuQeHq/iw+L314H9Bdi0uDDa4r9mpvYlmzJ4uxQzMnJyPpNa8829DuyCJtI
 WzzD9ujtNmZr7mQcBQ5Y8YHhAZtXC97fj3lMOZpuU7+KMlDytUYt2Oe9zMYPIkfmjYWz
 Y9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692911438; x=1693516238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPPRrcT/yUPOCzpv05mwWkcP84GBDmCav6kNDoKUBTc=;
 b=CWgeqSE8byoWYFdKpHarCFUJI0NdK1E4xhA0+cBi0W3VMn4mb1kmC3qTD73+zirnnq
 dGzK4VEXN1sKLePtkZDBL85QmyIU0/DF5YiaHPsbSXXqjUXPmx42roZXsLr1Lh+JPVsJ
 /TkU1HAuTsFu2H9X1qbYgf1BtemziVzVa2Wz/0QF3Aiki1S++EsEBtQ1UpKV4rlw0sYv
 dGXi4nlmZd5wWcPC9Hbf6IKeMzfOow2wlflpRvU9fQGyjjrYIJCDRRykh6DTxLC7YuTI
 VqJS31i3I+B+x+oC7d4/3qfDA+mVT7JGtxHgV27noyy0erMd2zFYzYNEsD/AoCB7uQ9s
 1bbw==
X-Gm-Message-State: AOJu0YxjmTCZ5k/yXVOUGMLu1Ivip9Oc1piIBABHPZ86BHhm5qepgnm+
 jMjGYTOFT3lSIL5Yp9H1qwXbLndD6OCyteoefpUJ1QWMVA4=
X-Google-Smtp-Source: AGHT+IEwKBBIPYpdZwKAXeZyDsldWfWdVFQ8m63BFJaxshRa3GXIOsHjUW+k6zXY/1U6JGYR9OvBJiJqb49BLLT9SjA=
X-Received: by 2002:a2e:9058:0:b0:2b9:acad:b4ab with SMTP id
 n24-20020a2e9058000000b002b9acadb4abmr12764422ljg.28.1692911437763; Thu, 24
 Aug 2023 14:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
In-Reply-To: <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
Date: Thu, 24 Aug 2023 17:10:26 -0400
Message-ID: <CAOCN9rw=Ty8qv6pqOZFvTg-25s72QjOx+AfeHqkLZ9Wv-+757w@mail.gmail.com>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Andrew Bartlett <abartlet@samba.org>
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Aug 17, 2023 at 8:08=E2=80=AFPM Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Fri, 2023-08-18 at 11:52 +1200, Douglas Bagnall wrote:
> > On 18/08/23 11:20, Andrew Bartlett via samba-technical wrote:
> > > We need to reduce our CI time, and one way to do that is to
> > > reuseobjects as much as possible, creating read-only objects once
> > > per class,not per test.
> > > This is much cleaner if with the addCleanup() and
> > > addClassCleanup()methods, so I would like to be able to do that.
> > > To do that we need Python 3.8.  The primary blocker for this is
> > > theCentOS 7 build which uses Python 3.6 from EPEL, and a newer
> > > Python isnot in that repo.
> >
> > I had a look at the Python 3.8 git history for Lib/unittest to see if
> > it would be simple to backport/recreate the ClassCleanup code into
> > our TestCase wrappers (like we used to do for various assert
> > methods), and the answer is NO. Thankfully.
> > I have no opinions about Centos 7, but I do agree that the supported
> > Python versions need to be exactly determined by CI.
> > Douglas
>
> I would note that times when we didn't line up the CI version and
> Python 'supported' version, it kept breaking.
> I note that RHEL7 ends 'maintenance' in June 2024, just after the 4.20
> release March 2024
> https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7=
-almost-here
> Those dates I think give good cause to drop CentOS 7, but other views
> still welcome.
> Andrew,

I've been publishing RHEL 8 and 9 ports of the latest releases. I
publish the needed updates for current python requirements over at
https://github.com/nkadel/samba4repo/ . RHEL 8 was missing a recent
enough python3-pyasn1, and RHEL 9 either lacked or lacked a recent
enough python3-iso86001 and python3-nose and python3-setproctitle

Note that because of the interwoven dependencies of libldb, libtevent,
etc. for sssd, I've given up on compiling those for RHEL and rely on
the Samba internal copies of those libraries. Battling it out with
sssd for ownership of those did not seem productive for Samba based
domain controllers.

Samba for RHEL 8 and 9 could, in theory, be updated to use python
3.11. I've done that sort of thing for ansible. Unfortunately, the
RHEL published python3.11 modules tend to be a bit sparse, as I
discovered the hard way with ansible and awscli. and getting pytest
working well for build-time test opoerations is... tricky.

