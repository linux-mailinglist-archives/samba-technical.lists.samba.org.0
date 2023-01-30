Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4113680BD0
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jan 2023 12:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=w9A1bVyZb4er6cTd4zzjsltmhyvgIyU7DAJ3a6jVt6A=; b=1bQPGZD3V6bNMzQr4WtyuNSUM5
	brw9vyVrg3wUZWRSgQi29I24nswCA8AwMGDVUUl1CAK5mfI22yP3C17Tau/zXP4AJQFZsALJZqUcZ
	9KcUd5VCgiLwdWl2opAB3AcUTdBNtLzw2IPfPcQfEZwUzTM02luTDWWfE5seYQ2S168+LJwYG6EGN
	RohFQWpLNcUj0b2tVs1mmUy7bHjvS+2F+6fgTu7C7Bcv01ijwKL9hLrbMW6f1O8p24hBbw1ZUcCOo
	ldxqO6IFGc7m5G0gWaQ/raeP+kxFRZnVdkWmvTJEcM6kJIeTSudUY2cbT32DKLdO9HX4n4hyqNQKr
	SkOEvrBw==;
Received: from ip6-localhost ([::1]:36686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMSH0-004dvi-A3; Mon, 30 Jan 2023 11:24:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMSGv-004dvZ-Sk
 for samba-technical@lists.samba.org; Mon, 30 Jan 2023 11:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w9A1bVyZb4er6cTd4zzjsltmhyvgIyU7DAJ3a6jVt6A=;
 b=CEV6fE1NnxI1qd5I5YXmHINlJM3adbaiFD+THEEGsu20P2sS18dgpHbjzYkNlclEEYbtPb
 xiXGLMJuOz0BJYRB1Nc83JJX/Hh9xmoC6iaMN5yBqZvq93x4yQnoPN0IcOdgxgARTMOnOr
 J8SL87nL6kG5n9vVv384IzZ6NLMK3Oo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675077862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w9A1bVyZb4er6cTd4zzjsltmhyvgIyU7DAJ3a6jVt6A=;
 b=CEV6fE1NnxI1qd5I5YXmHINlJM3adbaiFD+THEEGsu20P2sS18dgpHbjzYkNlclEEYbtPb
 xiXGLMJuOz0BJYRB1Nc83JJX/Hh9xmoC6iaMN5yBqZvq93x4yQnoPN0IcOdgxgARTMOnOr
 J8SL87nL6kG5n9vVv384IzZ6NLMK3Oo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-JYIlhA5gM_SRvbpUiBK1og-1; Mon, 30 Jan 2023 06:24:18 -0500
X-MC-Unique: JYIlhA5gM_SRvbpUiBK1og-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15A29382C965;
 Mon, 30 Jan 2023 11:24:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27FB8492B05;
 Mon, 30 Jan 2023 11:24:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20230130103343.GA11663@lst.de>
References: <20230130103343.GA11663@lst.de>
 <20230130092157.1759539-21-hch@lst.de> <20230130092157.1759539-1-hch@lst.de>
 <3347459.1675074683@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/23] rxrpc: use bvec_set_page to initialize a bvec
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3351917.1675077855.1@warthog.procyon.org.uk>
Date: Mon, 30 Jan 2023 11:24:15 +0000
Message-ID: <3351918.1675077855@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, dhowells@redhat.com,
 linux-mm@kvack.org, target-devel@vger.kernel.org, io-uring@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Jan 30, 2023 at 10:31:23AM +0000, David Howells wrote:
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > +		bvec_set_page(&bv, ZERO_PAGE(0), len, 0);
> > 
> > Maybe bvec_set_zero_page()?
> 
> Why?

Seems to be something people want to do quite a lot and don't know about.
I've seen places where someone allocates a buffer and clears it just to use as
a source of zeros.  There's at least one place in cifs, for example.  I know
about it from wrangling arch code, but most people working on Linux haven't
done that.

David


