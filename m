Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 435126815C4
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jan 2023 16:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fl/jnHLwbhnLse2jT7+4Lzwh9labRex05wjKl7Xvb60=; b=bO8CkN6vVl1Yq0kwDe6YzMmHgA
	5O8tx42jjW4Ma+pxYipe8B02JC3/B9J28J4YDsKg4wMBy9RAqo4wg7T7dmeiOMgK34UX4Wzj7UTyX
	L8SpBOALekGsnDWLsISn1+SMGNpst90faqEvqPOP1KDPncmoBNTozlMG/7Ruh+01cB11+EHpGqIBe
	bTt7cF4jZstOy0u/LIe+PkH7AVjv9fSrQPNcLlk4vZRFmiyn9Uq/ez5+a5gZbyOlarRb5BagR4wI1
	EWS8A089MPSH/D/NotEZ+4H2r9TOh7Rd4hnmugYxWefxFiL6YKCN2ARplzNjW6p21BHRgbrZd2YWq
	RMHb4Hag==;
Received: from ip6-localhost ([::1]:47024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMWZF-004l2A-0k; Mon, 30 Jan 2023 15:59:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52000) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMWZA-004l20-Hh
 for samba-technical@lists.samba.org; Mon, 30 Jan 2023 15:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675094369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fl/jnHLwbhnLse2jT7+4Lzwh9labRex05wjKl7Xvb60=;
 b=XGZyW3y00wOyJOvAhM7zAy6Q1KJw7LEoihAmt8lqwUZGJ4MYiXSD70TYKoX77p74T5ADRs
 hEU5oOybkqAl68yU/wqvxzxWuSF+XlkWP/3cXsy03UtF+XbFuOmp7t3EjYBL3vu7n/185Z
 mljNz9cfsWuFwh4+5VKMR1f/PyWLtPg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675094369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fl/jnHLwbhnLse2jT7+4Lzwh9labRex05wjKl7Xvb60=;
 b=ZVJCndfn4nJpMgMPwP/TVY/HrYWgY2h8s7HRiNaPVo/mX69w6DDuoCSCHq7vm2GWCUAv6n
 n797MZXW9Bw4SLZurnc6DVUfSceRrh1Gt+I0z/ABgWMOJ3k9hw7mQicz5YKQVH8hdCybAT
 SL5BFJnWMr3EgBo7TB5u3WuQVDpoB6U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-0OMBsTb3NwqemUKDMrnO3w-1; Mon, 30 Jan 2023 10:59:24 -0500
X-MC-Unique: 0OMBsTb3NwqemUKDMrnO3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1F5858F09;
 Mon, 30 Jan 2023 15:59:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 310581121314;
 Mon, 30 Jan 2023 15:59:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20230130092157.1759539-12-hch@lst.de>
References: <20230130092157.1759539-12-hch@lst.de>
 <20230130092157.1759539-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/23] afs: use bvec_set_folio to initialize a bvec
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3499903.1675094359.1@warthog.procyon.org.uk>
Date: Mon, 30 Jan 2023 15:59:19 +0000
Message-ID: <3499904.1675094359@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 linux-fsdevel@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mm@kvack.org, io-uring@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Christoph Hellwig <hch@lst.de> wrote:

> Use the bvec_set_folio helper to initialize a bvec.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Howells <dhowells@redhat.com>


