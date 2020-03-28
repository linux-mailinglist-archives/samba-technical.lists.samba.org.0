Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A579A19683D
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 18:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1eGzPnYEJXy54bA7TLUg/84ZADZkzhNPFXwsM3U16hE=; b=gUD4EZpdyUls0HkBoyQ70bJG4+
	NMhVaHjTY3kJRj6dCM6SckBHe3zx7kptz02oDjM+YHq1cOpOzMpcvvYuJCGwxYVsUYzdqlnq1oXyy
	xAEv/nQG7QX0gQFmeFgUZ+meVEOcuB255uMJjvtHicTE+Ju6n6khaq5rpumgAxwAD8ld56Duv2ILa
	n9ySZYbObNCswt7rS1nInhxzXbqTQaxZOp3aQ0gmuBHgkPokPPFYWHjuF1NqtDKAcnq6r96Sgf4ML
	DjBTqDNXxCcRp09eSjibF0ylfkq9YbW7C6G6GndWnth8UimEF2oYY7y//6uveNjYTexGd4QaM5XfC
	xRJeOBhA==;
Received: from localhost ([::1]:57636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIFZ3-000ufy-TA; Sat, 28 Mar 2020 17:48:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIFYx-000ufq-DB
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 17:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1eGzPnYEJXy54bA7TLUg/84ZADZkzhNPFXwsM3U16hE=; b=d8FEhSFOZaTUTAC/HmPlskS6b4
 6Kn5besQHFdjzExd50acTFU8lCkDkj9raUg9Ns8pThCi2y/Ig6uG5r9Gwjk6RnJhwTUDAz95NlhAa
 Uf5wzCePknWMuPC81BaHlxpWkTAJD3lYm5iWeyXJGC5nrz09gFUJHSHJ3AFTUcIMSqyszbDjLTNcY
 TpQ5EfVq+zBR878K9ipccjQDlHFqwBvQZLJoFODH0yeIsZeRH7GxCFMt8nZ+j3eCrj6nRizJzpnwO
 UgjagewVPPVr/4CHREHKln+p99FAufh5GHbEliXXyIE84d0/5F/d4ec/dMQLN4NUuC79MhQx/DMnu
 zcKjr+FXD5SJtHPXPwFs0gJP93YEAbzaVxeDZ0ZIIEuuz3GMn7PSxphS3SW7SsL5Arlx7lE5N0cl5
 K1woB18Wi7pakQVLb2EqhbdOQ/FExp5NwTPPjcx8ATug/ivcGELnt9wbKTwQdbH0L4EDqzLfCUdQP
 ax7Fc4Lk70Q6mSdqTqY+v0z0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIFYs-00072j-EB; Sat, 28 Mar 2020 17:47:58 +0000
Date: Sat, 28 Mar 2020 10:47:54 -0700
To: Jeff Layton <jlayton@samba.org>
Subject: Re: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
Message-ID: <20200328174754.GB2323@jeremy-acer>
References: <20200327162950.94545-1-jlayton@samba.org>
 <20200327175458.314ac804@samba.org>
 <2482855b759f39c2c7fe2c31966d8f4184b58d97.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2482855b759f39c2c7fe2c31966d8f4184b58d97.camel@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Marco Savoca <quaternionma@gmail.com>,
 Jeff Layton via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Mar 28, 2020 at 10:31:35AM -0400, Jeff Layton via samba-technical wrote:
> On Fri, 2020-03-27 at 17:54 +0100, David Disseldorp wrote:
> > Hi Jeff,
> > 
> > On Fri, 27 Mar 2020 12:29:50 -0400, Jeff Layton via samba-technical wrote:
> > 
> > > Signed-off-by: Jeff Layton <jlayton@samba.org>
> > > ---
> > >  docs-xml/manpages/vfs_ceph.8.xml | 16 ++++++++++++++++
> > >  source3/modules/vfs_ceph.c       | 16 ++++++++++++++++
> > >  source3/wscript                  |  6 ++++++
> > >  3 files changed, 38 insertions(+)
> > > 
> > > I had a few spare cycles today and went ahead and plumbed in this
> > > support since Marco had asked about it on the ceph-users list.
> > > 
> > > This builds but is otherwise untested. If it looks reasonable, I can
> > > clean it up and test it out in the near future.
> > 
> > Thanks for the patch!
> > Give that the cmount context may be reused between shares, this would
> > be problematic if the shares are configured with differing fsnames. That
> > said, I think we have the same issue with config_file / user_id, so I
> > don't think it's a showstopper.
> > Otherwise, the change looks reasonable.
> > 
> > Cheers, David
> 
> 
> Oof, yeah...I had forgotten that cmount is global. Ideally we'd have
> some sort of pool of cmounts or create one on a per-service basis.
> 
> Is there some sort of per-share object in the vfs plugin interface off
> which you could hang a cmount?

Yes, you can hang a private pointer off the connection (per share
instance) handle.

