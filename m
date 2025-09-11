Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F7B53981
	for <lists+samba-technical@lfdr.de>; Thu, 11 Sep 2025 18:41:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=R0g49O2ePZuKTHbko+2wbGHRgCoDqRTUsVjaYJFlrjw=; b=KwaF8j0nOfzl0rGo2xBQGHXbVw
	CYcPiyecAsBfH3GHxM7LuoctrFRE/ZWhOmwtm/3juQyEiZghf6suNOVsJxCQXP5wK8wPCvkJ8S8pv
	7AF/ze/7QM2wZLbwN26X3zbhHPQ4FD5fTCsBqrbfOCSntMTfDmfmauURnrf6llyzBN6LHYa/QKkR0
	zj3YxDwQvsQ3Aetl9nXo6plJd59D3pj9U+ZVcVnat8v4ulUgXHtynhUzBHtPPXsX1qvzgR+sIL1Sy
	Qg0SjBtHRcsPphaQF0wk8/88t9KQpiqfzgEzQWx3SCzCNad/344Qni0kPct0MF1In4jmOEnc3cRc2
	4iUYWyGg==;
Received: from ip6-localhost ([::1]:49094 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwkMV-003ZHu-2T; Thu, 11 Sep 2025 16:41:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26399) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwkMO-003ZHl-MR
 for samba-technical@lists.samba.org; Thu, 11 Sep 2025 16:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757608881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R0g49O2ePZuKTHbko+2wbGHRgCoDqRTUsVjaYJFlrjw=;
 b=Yf5cmEg950IYm5BYUzCutjuZQwEBJ1Tqr9R5xLXgn/ZjsykgFO3zn1ZSCFuIS0qH1/+EF+
 gcQsZof7xFAzPEQCzYmx8QyKaY4dzSBgk8NcRdLLa1qSTapsAUcjsF6cLT2nYELbEzgdnQ
 MmYLOdc3ovlE9DUJYHT0mQ+AwwUbpsQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757608881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R0g49O2ePZuKTHbko+2wbGHRgCoDqRTUsVjaYJFlrjw=;
 b=Yf5cmEg950IYm5BYUzCutjuZQwEBJ1Tqr9R5xLXgn/ZjsykgFO3zn1ZSCFuIS0qH1/+EF+
 gcQsZof7xFAzPEQCzYmx8QyKaY4dzSBgk8NcRdLLa1qSTapsAUcjsF6cLT2nYELbEzgdnQ
 MmYLOdc3ovlE9DUJYHT0mQ+AwwUbpsQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-hpBmv8mXPpuLQpNsCpmnpQ-1; Thu,
 11 Sep 2025 12:25:14 -0400
X-MC-Unique: hpBmv8mXPpuLQpNsCpmnpQ-1
X-Mimecast-MFC-AGG-ID: hpBmv8mXPpuLQpNsCpmnpQ_1757607912
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B98E4180057D; Thu, 11 Sep 2025 16:25:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.6])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 89DAB18004A3; Thu, 11 Sep 2025 16:25:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
References: <2780505c-b531-7731-3c3d-910a22bf0802@huawei.com>
 <20250911030120.1076413-1-yangerkun@huawei.com>
To: yangerkun <yangerkun@huawei.com>
Subject: Re: [PATCH v3] cifs: fix pagecache leak when do writepages
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1955608.1757607906.1@warthog.procyon.org.uk>
Date: Thu, 11 Sep 2025 17:25:06 +0100
Message-ID: <1955609.1757607906@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
Cc: pc@manguebit.com, sfrench@samba.org, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de, gregkh@linuxfoundation.org,
 samba-technical@lists.samba.org, willy@infradead.org, lsahlber@redhat.com,
 dhowells@redhat.com, tom@talpey.com, yangerkun@huaweicloud.com,
 nspmangalore@gmail.com, stable@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

yangerkun <yangerkun@huawei.com> wrote:

> >     	if (folio->mapping != mapping ||
> >   	    !folio_test_dirty(folio)) {
> >   		start += folio_size(folio);
> > +		folio_put(folio);
> >   		folio_unlock(folio);
> >   		goto search_again;

I wonder if the put should be prior to the unlock.  It probably doesn't matter
as we keep control of the folio until both have happened.

David


