Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D615196957
	for <lists+samba-technical@lfdr.de>; Sat, 28 Mar 2020 21:46:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=r0Dh59FRN6Mwrb5ybYHe6chJOlyBjiMXM90yzuBohBM=; b=T0iXA91ilFl6AMRzlpu3QJLEuh
	5Gxg9INzneVxYnW9rDgWX7PU+Q0CR7qRxoHYeppWt9Gg8w5vUqq9u7BPuMOVEqCwwpj/Muf93NbI0
	znwxZFXit9bXXdnzikyWAIFxUpQ7DWdK7ZYduJFuqAzLl6RbqE2psT9B5sgoxugFbS0oSpffQNsTz
	S2MB4xfZowlmhShdYpw7ZFfj91XSmdblL0IUvX3EzdzsM4l0Cx35frfRMASThC1V4jOpEk1zkvy86
	ZL2rUXukA2HGCmB7qvaOQjcI+GtijRhxou66XUQuJLRx7GjnP3Ball6ceZg8hL/Y3CClC5nq+7nHZ
	Umt999eg==;
Received: from localhost ([::1]:58476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jIIKe-000v0j-72; Sat, 28 Mar 2020 20:45:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43922) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIIKT-000v0c-8B
 for samba-technical@lists.samba.org; Sat, 28 Mar 2020 20:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=r0Dh59FRN6Mwrb5ybYHe6chJOlyBjiMXM90yzuBohBM=; b=AGDNrthdK4N33r0kqllGtssZJQ
 dH79pScZoFFiKPFK6/GrCyMViupJDoxFO5XNFGTl7x5pUbFO2RhJHS9KGOjrMoRDvPaDdv2B4hmQp
 fI+nYpxYcXtBMTPIZPBK/6g5SqlrCIbzhUU5wbL8+37i85jK1sBwGv6533hd3pN+IjrhUl7mtq6PJ
 DbA9KuSmmRhC2KJF2jtOnmSRtJ7GvrqGTylodcKcHXD58Ia5yXCz8kc3IN2fyqF6fR2hfxDVAzmbx
 /THq4XhcH085fotBefIspki2btmUG5zyF/wpHvqFGrE4hWXV4lPgVvrwh6bOTCzrkQ9OL2Bg0IJC+
 6tNgjSnDPbrMsUZJuwEyDYPPKIvkn0wqZrIPkF1fbm7NuGjMnopvrJnsneeIqxsJGDozB6wwEDaFp
 D+pF1bRLnv9QLQYuioGnFLMaTcUtpglNDlcBtUezUtmRs7lqcJIwFXK2lv4H8lynrid1MmII30ROu
 WCoGgCO4RuHL+15ChEKQnYto;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jIIKN-0007o3-O8; Sat, 28 Mar 2020 20:45:12 +0000
Message-ID: <53cee256c7ba658fa51771fec9c91296fd5eac81.camel@samba.org>
Subject: Re: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
To: Jeremy Allison <jra@samba.org>
Date: Sat, 28 Mar 2020 16:45:09 -0400
In-Reply-To: <20200328174754.GB2323@jeremy-acer>
References: <20200327162950.94545-1-jlayton@samba.org>
 <20200327175458.314ac804@samba.org>
 <2482855b759f39c2c7fe2c31966d8f4184b58d97.camel@samba.org>
 <20200328174754.GB2323@jeremy-acer>
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
Cc: Marco Savoca <quaternionma@gmail.com>,
 Jeff Layton via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2020-03-28 at 10:47 -0700, Jeremy Allison wrote:
> On Sat, Mar 28, 2020 at 10:31:35AM -0400, Jeff Layton via samba-technical wrote:
> > On Fri, 2020-03-27 at 17:54 +0100, David Disseldorp wrote:
> > > Hi Jeff,
> > > 
> > > On Fri, 27 Mar 2020 12:29:50 -0400, Jeff Layton via samba-technical wrote:
> > > 
> > > > Signed-off-by: Jeff Layton <jlayton@samba.org>
> > > > ---
> > > >  docs-xml/manpages/vfs_ceph.8.xml | 16 ++++++++++++++++
> > > >  source3/modules/vfs_ceph.c       | 16 ++++++++++++++++
> > > >  source3/wscript                  |  6 ++++++
> > > >  3 files changed, 38 insertions(+)
> > > > 
> > > > I had a few spare cycles today and went ahead and plumbed in this
> > > > support since Marco had asked about it on the ceph-users list.
> > > > 
> > > > This builds but is otherwise untested. If it looks reasonable, I can
> > > > clean it up and test it out in the near future.
> > > 
> > > Thanks for the patch!
> > > Give that the cmount context may be reused between shares, this would
> > > be problematic if the shares are configured with differing fsnames. That
> > > said, I think we have the same issue with config_file / user_id, so I
> > > don't think it's a showstopper.
> > > Otherwise, the change looks reasonable.
> > > 
> > > Cheers, David
> > 
> > Oof, yeah...I had forgotten that cmount is global. Ideally we'd have
> > some sort of pool of cmounts or create one on a per-service basis.
> > 
> > Is there some sort of per-share object in the vfs plugin interface off
> > which you could hang a cmount?
> 
> Yes, you can hang a private pointer off the connection (per share
> instance) handle.

I assume you mean the connection_struct? Which field is the private
pointer?

-- 
Jeff Layton <jlayton@samba.org>


