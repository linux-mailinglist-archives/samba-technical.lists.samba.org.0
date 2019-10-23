Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56657E137E
	for <lists+samba-technical@lfdr.de>; Wed, 23 Oct 2019 09:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6+r/a3GksehCfe3xzJGGoAdqg8gGDU0xATcyaP40K14=; b=Mkn23oGtTwnoyVkTMhs8N4kK90
	FFRyVWmU/nsxUW3LAS4YQpotrrAYBV8Izqyty7kTdS8zFHBwlTKAqo2ecc5gRyBjxX68CXkmA3Wu8
	jOAHmje6A4sRCe1litTQv1a/+VZqlT2GiN2PczcZ/7AynRfWs7elnVyp8HMhpUMrE4nF6BHM2knXx
	5RHGx6GDMtYNICw7mWx+5sGVGbmyjySqoZQhOVB3yUNq4IqeSePOqDWDOPpXVnNzFhc1B6QYTildk
	GjwImySv5wEC5Oy3lfQ1CLKNtArtuUVT5nnKIb6FItUm7jzC0Z+/HcKWcywEUPuMop7yRb5YEbyBC
	c7d/HMkw==;
Received: from localhost ([::1]:36854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNBW5-001bhJ-F7; Wed, 23 Oct 2019 07:57:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNBW1-001bhC-8D
 for samba-technical@lists.samba.org; Wed, 23 Oct 2019 07:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6+r/a3GksehCfe3xzJGGoAdqg8gGDU0xATcyaP40K14=; b=3HPQGXOIy61pcOFxrnXcnXNwdy
 4TBtXzsGJ4G+KhSQlidkoar5bbH7q4mqaOBva2GOx8CMb3ORwh5P36SePx2l9s4z2ydtMCE7Zmz0F
 aDhEyfmDVWelxFx4g287Y6U7A75Psm0xURIg5m2gG/L/diFFcI+R/UQOVQ1HIsRWtXzm55C134v+/
 UsaWWaX99GJYc4t+DRpHvDgtxknz9wtndQ6PN2fYG5LCudiVbY9kaUJMHi7I81aJoKnG5XOSYsQ3N
 fQYxgMcZKiW0ScaannElkIn+uH0RiApTXJcPz/GB5wUxOp6Wh5ybI+tUqykP4UcZg17GAYp3TlV+P
 J1CVX1A5YuLQ11rNeFRIb8im5eIgkALswszau+cLXdSTaLQBU0mC60iuoWKqSxqgUlgxzYqYGm8+v
 eBNVAlHdIm8UYAHGJgIiRC4KHOkUQyz6XFIfUCYKyrqhBkqjl1d+nN9BSE3aA3IDjViBTS0vvxadY
 QptrH5ofKjKRj0KUoYcIxIu6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iNBW0-0006gw-BR; Wed, 23 Oct 2019 07:57:08 +0000
Date: Wed, 23 Oct 2019 10:57:05 +0300
To: Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: [Release Planning 4.11] Samba 4.11.2
Message-ID: <20191023075705.GA6137@onega.vda.li>
References: <3ee51a4a-c102-df01-8e52-cf8ea702194f@samba.org>
 <3255b7bf-d793-66f9-10de-c52f0c07ad28@tranquil.it>
 <CAOCN9rwt2UN1EYN586zEjtPTWVHz7TKoc_xNgcpcz7d1ivvBfQ@mail.gmail.com>
 <1862579.bBNgSl7iVu@magrathea>
 <CAOCN9rx-gSq1UphhyN_MFh2fbA7+hj0bgGYTwr5MUKUSOvbURA@mail.gmail.com>
 <CAOCN9rw2Bww+WsOPqi8FG5VG4shRk=6MoCWv2c6GM3EwOz0beg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCN9rw2Bww+WsOPqi8FG5VG4shRk=6MoCWv2c6GM3EwOz0beg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Denis Cardon <dcardon@tranquil.it>, Dario Lesca <d.lesca@solinos.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 23 loka 2019, Nico Kadel-Garcia via samba-technical wrote:
> On Wed, Oct 23, 2019 at 2:34 AM Nico Kadel-Garcia <nkadel@gmail.com> wrote:
> >
> > On Wed, Oct 23, 2019 at 1:51 AM Andreas Schneider <asn@samba.org> wrote:
> > >
> > > On Wednesday, 23 October 2019 01:53:58 CEST Nico Kadel-Garcia via samba-
> > > technical wrote:
> > > > On Tue, Oct 22, 2019 at 2:14 PM Denis Cardon via samba-technical
> > > >
> > > > <samba-technical@lists.samba.org> wrote:
> > > > > Hi Dario,
> > > > >
> > > > > Le 10/22/2019 à 12:17 PM, Dario Lesca via samba-technical a écrit :
> > > > > > Il giorno sab, 19/10/2019 alle 12.22 -0400, Nico Kadel-Garcia via
> > > > > >
> > > > > > samba-technical ha scritto:
> > > > > >> Cool! I just managed to get 4.11.1 into my published CentOS 7, 8,
> > > > > >> andFedora setup at https://github.com/nkadel/samba4repo. This setup
> > > > > >> usesHeimdal Kerberos, which eased the gnutls requirements and made
> > > > > >> CentOS7 easier.
> > > > > >
> > > > > > Thanks Nico
> > > > > > How can use your great work?
> > > > > > I must rebuild all on my system (Centos8) or I can use a binary repo?
> > > > >
> > > > > I just published RPMS and SRPMS at
> > > > > https://samba.tranquil.it/centos7/samba-4.11.1/
> > > > > https://samba.tranquil.it/centos7/samba-4.11.1-srcrpm (note : freshly
> > > > > baked from the oven, not yet thoroughly tested). You may try to rebuild
> > > > > the srcrpm on CentOS8. I've not yet had time to look at that new CentOS
> > > > > release.
> > > >
> > > > RHEl 8 does not include "quota-devel" and some dependencies such as
> > > > "libtommath", unless you build them from a setup like, say, mine over
> > > > at github. You are certainly welcome to any useful parts of that.
> > >
> > > RHEL8 **does** include quota-devel, CentOS8 *doesn't*.
> > >
> > >
> > > https://bugs.centos.org/view.php?id=16549
> >
> > No, Red Hat does not publish the package in any of their channels. I
> > just checked on my licensed RHEL 8 box, the one I use to run
> > "reposync" on to build up a full local RHEL 8 mirror for
> > "mock" compilatoin of Samba before CentOS 8 was published. This is why
> > my public tools to build Samba 4.11 have a local setup, based on the
> > published SRPM, to build the quota packages as needed on CentOS or
> > RHEL 8.
> 
> Looking at that, it came off a bit... sharp. It's not you, it's that
> Red Hat has elected to do this for a number of different devel
> packages I've tried to compile with, and the excuses for publishing
> only the SRPM and binary packaes have been.... well, let's say it
> raises questions about renewing my licenses.
Please raise a question through the support lines to add this and other
missing devel packages back. A feedback is needed.


-- 
/ Alexander Bokovoy

