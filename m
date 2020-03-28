Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 591691966C0
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 15:32:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EW8RjqzzRPXAAc90oIrxTq8XAVw6qN7I+wl2Ejd6oTk=; b=q4BcXnZ26K8kLufQgvtoZIiwxp
	oKNj16ZIuXEYkq3dzhxkjPoqqf5tQZdf6gOW6oqU78126npQgwWJcY+cAxT4yubncaUK+w7Q5nf6r
	aZRZ5IoE6yusDTu7832OqFa489Zu5ioe1VCCgAQhHk4NucKilp3M6R0JhtZ1SV2PUkpimrH02oZ5Q
	yGedTJsWUfOyV706o5zEemFEPl/ZKXQSpmjU7rucJb7405AYhS67/Eznr7RoGjQkMLRzMzMBgayWc
	1A7N3m32vo/t3BgAZtiHy2RZFwASgdoQbuhWUeGJ1podjyepHj2q7YPdYqBAjkzhRVoms9b9I+jzc
	6T553f3Q==;
Received: from localhost ([::1]:56140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jICUz-000uHn-E6; Sat, 28 Mar 2020 14:31:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jICUu-000uHg-1Q
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 14:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=EW8RjqzzRPXAAc90oIrxTq8XAVw6qN7I+wl2Ejd6oTk=; b=pi/hUPq1hUdNEe8e9XfbfmJa+T
 tr+38HZ/MngbDfAPipInVpVogS7qBXvfqAeNXsissj8vBpDRFBkOfki2pkoucMHMAXf493K5c7UaW
 zsZ+CTGirJW4xxl5O8JmSS7BLB/CpGLyPRbAZpwrdM4ctNpMsKp8jigXothIxCzG6VPmQoo05KsrI
 dimkmQufF+ULvHMiQbqZ2wgn2b3oLBUaTC2pOIOBwZhx+DiEnswDzMXT2yphtlFNWI2M+ViCpWVCC
 M2vZXJEp8/iDyV2ThrkFAxBbXOeXrFz0rxQHrtwMy3ahc4zosklSmPVEQBnpUvrH5SCQUyS3AZNT5
 qZxq5ISQTI5vDLhycG9cmhHMA7Wljfmuq/BN4/bh3/TCiI57nSOxwVCDhPc2jnaXVoe+M2UzWORLs
 63VHeCb4FkUZFifisG+xyB2/eczMbos224un3c2tSQ594OMO0xAXb0CZv4bdsvnKLxyjdUHl9KQaU
 +1oA5p/3MdyrqgPHHmBHD9ii;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jICUr-0006Fr-I9; Sat, 28 Mar 2020 14:31:37 +0000
Message-ID: <2482855b759f39c2c7fe2c31966d8f4184b58d97.camel@samba.org>
Subject: Re: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
To: David Disseldorp <ddiss@samba.org>, Jeff Layton via samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 28 Mar 2020 10:31:35 -0400
In-Reply-To: <20200327175458.314ac804@samba.org>
References: <20200327162950.94545-1-jlayton@samba.org>
 <20200327175458.314ac804@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Layton <jlayton@samba.org>
Cc: Marco Savoca <quaternionma@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2020-03-27 at 17:54 +0100, David Disseldorp wrote:
> Hi Jeff,
> 
> On Fri, 27 Mar 2020 12:29:50 -0400, Jeff Layton via samba-technical wrote:
> 
> > Signed-off-by: Jeff Layton <jlayton@samba.org>
> > ---
> >  docs-xml/manpages/vfs_ceph.8.xml | 16 ++++++++++++++++
> >  source3/modules/vfs_ceph.c       | 16 ++++++++++++++++
> >  source3/wscript                  |  6 ++++++
> >  3 files changed, 38 insertions(+)
> > 
> > I had a few spare cycles today and went ahead and plumbed in this
> > support since Marco had asked about it on the ceph-users list.
> > 
> > This builds but is otherwise untested. If it looks reasonable, I can
> > clean it up and test it out in the near future.
> 
> Thanks for the patch!
> Give that the cmount context may be reused between shares, this would
> be problematic if the shares are configured with differing fsnames. That
> said, I think we have the same issue with config_file / user_id, so I
> don't think it's a showstopper.
> Otherwise, the change looks reasonable.
> 
> Cheers, David


Oof, yeah...I had forgotten that cmount is global. Ideally we'd have
some sort of pool of cmounts or create one on a per-service basis.

Is there some sort of per-share object in the vfs plugin interface off
which you could hang a cmount?
-- 
Jeff Layton <jlayton@samba.org>


