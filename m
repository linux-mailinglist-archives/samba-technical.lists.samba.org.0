Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A8D1A956A
	for <lists+samba-technical@lfdr.de>; Wed, 15 Apr 2020 10:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hBYiVbPBfUS+AcwD+sXBpDKSbw0tQLOGN9sYzZKYAmI=; b=t4oM7GfMyoCYsURavKzvRIBQz1
	bWIa5c/rkTwXSkoJlh9eKSCWnraKvsq/jef17BmSaQA6oVMB4SbiCmUHNsAA/mN+quibp4sx+O4Kc
	OujRix5wbXLO8EI5BN0bm4EQF9ZRRHxlzn/kB1EVQRrirpEAVPtNgcGmOs+Bo1otxwF3DfUR7nNtH
	QdUDDuFffwGpeKVjAuxUgL90aQy/nM7zy/4ysXNKRJEaaW4974jNWMSiiafLOCtdGdcQs4OQtZPDC
	Xi246NyMdVkYuguBa7n24h8iSpa/zMTEQ2VCjT5WsUBnW/JF/ceLVJcVW6LslJgo4+0vHGSeuvQba
	seo8tkmQ==;
Received: from localhost ([::1]:37828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOcyt-000lOe-OP; Wed, 15 Apr 2020 08:01:11 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38835
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jOLc0-000icb-4W
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 13:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586870895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hBYiVbPBfUS+AcwD+sXBpDKSbw0tQLOGN9sYzZKYAmI=;
 b=GdNK06mS9ViZkg1sLmM/1Nbbqe4fcWhYfxX/xBHJB/312FOGM/olF+ymfXUnRoDyNb8SNW
 e6gSUB33rza/51IB1yO5lGtoypXcLsTxkA6b7UNzwiKA0AbD6/Iwp30JS2MZpiP+ALit1j
 dJLGAlIcxmFg+9YzVU+zB7qYP/sos/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-PA7uLtZsM327ACx1G3T_7g-1; Tue, 14 Apr 2020 09:07:49 -0400
X-MC-Unique: PA7uLtZsM327ACx1G3T_7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96CEA8048E4;
 Tue, 14 Apr 2020 13:07:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-113-129.rdu2.redhat.com
 [10.10.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AB5418A8E;
 Tue, 14 Apr 2020 13:06:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20200413211550.8307-2-longman@redhat.com>
References: <20200413211550.8307-2-longman@redhat.com>
 <20200413211550.8307-1-longman@redhat.com>
To: Waiman Long <longman@redhat.com>, herbert@gondor.apana.org.au
Subject: Re: [PATCH 1/2] mm, treewide: Rename kzfree() to kfree_sensitive()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3807473.1586869616.1@warthog.procyon.org.uk>
Date: Tue, 14 Apr 2020 14:06:56 +0100
Message-ID: <3807474.1586869616@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Warn: EHLO/HELO not verified: Remote host 207.211.31.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
X-Mailman-Approved-At: Wed, 15 Apr 2020 08:01:06 +0000
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
Cc: linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, samba-technical@lists.samba.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Waiman Long <longman@redhat.com> wrote:

> As said by Linus:
> 
>   A symmetric naming is only helpful if it implies symmetries in use.
>   Otherwise it's actively misleading.
> 
>   In "kzalloc()", the z is meaningful and an important part of what the
>   caller wants.
> 
>   In "kzfree()", the z is actively detrimental, because maybe in the
>   future we really _might_ want to use that "memfill(0xdeadbeef)" or
>   something. The "zero" part of the interface isn't even _relevant_.
> 
> The main reason that kzfree() exists is to clear sensitive information
> that should not be leaked to other future users of the same memory
> objects.
> 
> Rename kzfree() to kfree_sensitive() to follow the example of the
> recently added kvfree_sensitive() and make the intention of the API
> more explicit. In addition, memzero_explicit() is used to clear the
> memory to make sure that it won't get optimized away by the compiler.
> 
> The renaming is done by using the command sequence:
> 
>   git grep -w --name-only kzfree |\
>   xargs sed -i 's/\bkzfree\b/kfree_sensitive/'
> 
> followed by some editing of the kfree_sensitive() kerneldoc and the
> use of memzero_explicit() instead of memset().
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Since this changes a lot of crypto stuff, does it make sense for it to go via
the crypto tree?

Acked-by: David Howells <dhowells@redhat.com>


