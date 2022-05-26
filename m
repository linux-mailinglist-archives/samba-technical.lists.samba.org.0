Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1D53553D
	for <lists+samba-technical@lfdr.de>; Thu, 26 May 2022 22:57:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qeYoBwClMquOdM4mrLC20XcvsQqVIaRivM3jxGFd6y4=; b=dGah9/kwMYeStRSbRax+eszxiJ
	tnPtVbQ9ze+ovktSEFlQT5oWP3gfncJukCj7mOR3s5S/OhDvud+jh0M2yGZ+F9tdvVv10A8T0+xZi
	Y6T3F7kv+6COO08sX8Az6s4E7YcwlNFMNMc0MTOc/2fTtmz8ZSJIjQUIkHnDaNEaO+cx1LUgVFAgs
	9WT8+XF2lwozn6FPcKh2OD7s3oq6oeo4i6CK1YN4GDJEvjpFEe37yGgc2FbSQSlzn38vdzdXlvB7Q
	whgXfaP/7dAcHnEsnGUh6HZSwlUEKnm7nn3eTJmu4F+ygzUXdEgCNP8r6JrgqWUrlaAshoZqZMx1b
	T+QtGqNg==;
Received: from ip6-localhost ([::1]:49126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nuKX2-003FYV-Kw; Thu, 26 May 2022 20:56:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58851) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1nuKWy-003FYM-JF
 for samba-technical@lists.samba.org; Thu, 26 May 2022 20:56:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653598584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qeYoBwClMquOdM4mrLC20XcvsQqVIaRivM3jxGFd6y4=;
 b=YjPczSy9slGfZCxsKAH2muBvZGMgVfgj8bYE39z3S0VFga7AVgWejhYrimprP9G/QUdpHZ
 oC6VLwlWb1tB7imouGcReUjpskU78CAt0Bn/0CKL77fVChv6b/M1Wvoa46eRSgGZHHbZBU
 vxKet+rWOC9gX/dAnS9QQPfyl3/+X3Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653598585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qeYoBwClMquOdM4mrLC20XcvsQqVIaRivM3jxGFd6y4=;
 b=gLGC+spN5L68XHGmktILVe3ak3UhywjQLhqB1E/wb3EhwW5Y99AiDUTJZmIUAHdkW5vaen
 RDLowbdvZJNTEIj2JccfBmlPoCoMjrf3DJVBzozyKhIlj/s+/LQv1ZyidxlJORjZ+xEYbU
 IgxzGRSkFUqVPsUMbd50cWr74vo9Y2M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-mc-1D6SBM96eFkb1G_VMfw-1; Thu, 26 May 2022 16:40:40 -0400
X-MC-Unique: mc-1D6SBM96eFkb1G_VMfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2A5D185A7A4;
 Thu, 26 May 2022 20:40:39 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DDF1121315;
 Thu, 26 May 2022 20:40:39 +0000 (UTC)
To: Frederick Lawler <fred@cloudflare.com>
Subject: Re: [PATCH v2] cred: Propagate security_prepare_creds() error code
References: <20220525183703.466936-1-fred@cloudflare.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Thu, 26 May 2022 16:43:44 -0400
In-Reply-To: <20220525183703.466936-1-fred@cloudflare.com> (Frederick Lawler's
 message of "Wed, 25 May 2022 13:37:03 -0500")
Message-ID: <x49o7zkvxbz.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
From: Jeff Moyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Moyer <jmoyer@redhat.com>
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, amir73il@gmail.com,
 linux-cifs@vger.kernel.org, selinux@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-mm@kvack.org, linux-security-module@vger.kernel.org,
 linux-cachefs@redhat.com, keyrings@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, kernel-team@cloudflare.com, serge@hallyn.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Frederick Lawler <fred@cloudflare.com> writes:

> While experimenting with the security_prepare_creds() LSM hook, we
> noticed that our EPERM error code was not propagated up the callstack.
> Instead ENOMEM is always returned.  As a result, some tools may send a
> confusing error message to the user:
>
> $ unshare -rU
> unshare: unshare failed: Cannot allocate memory
>
> A user would think that the system didn't have enough memory, when
> instead the action was denied.
>
> This problem occurs because prepare_creds() and prepare_kernel_cred()
> return NULL when security_prepare_creds() returns an error code. Later,
> functions calling prepare_creds() and prepare_kernel_cred() return
> ENOMEM because they assume that a NULL meant there was no memory
> allocated.
>
> Fix this by propagating an error code from security_prepare_creds() up
> the callstack.
>
> Signed-off-by: Frederick Lawler <fred@cloudflare.com>

The fs/aio.c part looks ok to me.  We should probably also update the
man page for io_submit, though, to document the conditions under which
EPERM can be returned.

Acked-by: Jeff Moyer <jmoyer@redhat.com>


