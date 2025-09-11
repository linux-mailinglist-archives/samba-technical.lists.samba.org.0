Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2434BB53BBB
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 20:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WFUCNCHe+0otnnl9WC8jbDApQRqhgsqIqvfkYyj6Vek=; b=LQvJCQPiQ2hPl50qux5cTq5mL/
	9k8rsavNQk0tkF6/xg9yfs4RvHTcGhVwiBBnuuf2Gt2jsenBzHmtjSbyue04RiQhqoT8shEvgkicJ
	cqA1gVg6Cbn4w+Kl+Rv/Yu6WK5aW59xbziXeOh9C4FiL3tgn0HzsZPbdKqNAa2hac53CytTHpTF2G
	h7LZx1i1KOKd8Qz/3qvjRp+SRFcVAIpcJZMFkGnhRue3YGq1FFfK7mntCMEjCZzasoIjeV+qm5VjH
	56xgirHurX/POUp5njdmp03DBU+AN725nzM5BlLA1N3eBBPda1Q200nApU/mWA6S0J4q8LIRzjhOD
	HP01eimQ==;
Received: from ip6-localhost ([::1]:64088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwmEb-003ZdS-AT; Thu, 11 Sep 2025 18:41:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1]:41274) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwmEW-003ZdL-6J
 for samba-technical@lists.samba.org; Thu, 11 Sep 2025 18:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WFUCNCHe+0otnnl9WC8jbDApQRqhgsqIqvfkYyj6Vek=; b=ADPKr9URaaRaESn89LiXR/cWpP
 Gt0M7rdMfL/ggm/57JdYMbFg2lLII6JKFnx5+nT0csgyti4Fg8la9bOEklyDagn+2MZ0Ter8tXOmw
 bsTGd7FgrF8AF5vD5HubfKn48PXVj0C6Auv85BF+5+4SPqrQSdcvYYxX3wwfoWMYjouqtHX+/xH2f
 vgGlndErUzB8bqPN3rOBWB7jYP2k3KdWqPN3778gem7xmWErGmcpVyI9aaOxcig5xwrK5QbUyW2SA
 DPZ6NkSOiG5Ji2zx8cc6vK+8FYoVSWtg/TB7WVQEyyC+QLz1d1N34pXBFrl2RcfnHrFjz0rfM8Dkh
 8HUusGYw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uwlrK-0000000Fm9W-1UIm;
 Thu, 11 Sep 2025 18:17:26 +0000
Date: Thu, 11 Sep 2025 19:17:26 +0100
To: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH v3] cifs: fix pagecache leak when do writepages
Message-ID: <aMMSNnJA6VknuVMB@casper.infradead.org>
References: <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
 <20250911030120.1076413-1-yangerkun@huawei.com>
 <1955609.1757607906@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1955609.1757607906@warthog.procyon.org.uk>
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
From: Matthew Wilcox via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew Wilcox <willy@infradead.org>
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de, gregkh@linuxfoundation.org,
 yangerkun <yangerkun@huawei.com>, samba-technical@lists.samba.org,
 yangerkun@huaweicloud.com, lsahlber@redhat.com, sfrench@samba.org,
 nspmangalore@gmail.com, stable@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 11, 2025 at 05:25:06PM +0100, David Howells wrote:
> yangerkun <yangerkun@huawei.com> wrote:
> 
> > >     	if (folio->mapping != mapping ||
> > >   	    !folio_test_dirty(folio)) {
> > >   		start += folio_size(folio);
> > > +		folio_put(folio);
> > >   		folio_unlock(folio);
> > >   		goto search_again;
> 
> I wonder if the put should be prior to the unlock.  It probably doesn't matter
> as we keep control of the folio until both have happened.

Well, folio->mapping != mapping is the condition for 'this folio has
been truncated', so this folio_put() may well be the last one.  I'd
put it after the folio_unlock() for safety.
> 

