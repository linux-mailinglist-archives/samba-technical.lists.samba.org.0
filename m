Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1446815B8
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jan 2023 16:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qLfIaYqKY5h8p0flnUU+ZUSKaufFe4Nci0Ya2wtNYRE=; b=0poDjQCWg9nfCpIa5eC70G78d0
	jIJ6h6FvauFUvrFpy/7uG23QIxSkbUbffaGfNCUBAfrFc0BW+O9/Ipz0Yxglq8PY8UOU4tQ43jBF3
	qWnvtrEnjDb/YxSeV1ub+ex5e7XJFQDCi9J4kTGFlS5k4oIDFMKTF5EAhWL9kC+42DGgGOv+eYzva
	BChTRlGXRn+BkD12lfRwOWIlDwmHVNYP/M0RcMAKt3Je6vavaFnks2XlAWVF8iBSmaWtsel96AS9V
	ymqL0Z8oeJBAFA7v1n4I1jVu1vPvuPovABdjQSsm6FmFUFPugO6sxLJDvZhvxc28BoSBnYVr+FFcf
	ccB8l3UA==;
Received: from ip6-localhost ([::1]:32980 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMWY7-004kkw-G5; Mon, 30 Jan 2023 15:58:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32101) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMWY2-004kkm-GL
 for samba-technical@lists.samba.org; Mon, 30 Jan 2023 15:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675094297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qLfIaYqKY5h8p0flnUU+ZUSKaufFe4Nci0Ya2wtNYRE=;
 b=AqSawpf2RDEZtYemc4zaViCJ1v5FBZ/mZ1FS2dblAmIc/V+FVqDWLNsSwJ96y6AyyWI4xc
 M4Bm0lJpVR9vLdk9mHTxvppgGxf77iWC/nADo+E7jW5hMfOlR9GVfKdy5uSFXLyy1U2iAm
 lfdGdEoAm8oOLaJhebsqfXFv+Qjx5qc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675094298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qLfIaYqKY5h8p0flnUU+ZUSKaufFe4Nci0Ya2wtNYRE=;
 b=C1pCg1P+HZL7Px10oVtyxQfu6Ya9gAFLGFPlUF3lrcfEqx/SpMgZQOLIyVFY51V/dvEoBw
 wdopHwvkoH1JyAtuw2rg5MYyKmjDI4FjjeUKjig9jLYImpYb3G9mPNjMN5BbSvrhNg2Ms6
 3YgPkF/ayydo+921oF9JTPeVtsKtgec=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-LQbhBSgfPCWz-AZqI1IBMQ-1; Mon, 30 Jan 2023 10:58:12 -0500
X-MC-Unique: LQbhBSgfPCWz-AZqI1IBMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64B4B3848C21;
 Mon, 30 Jan 2023 15:58:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29BD5492B05;
 Mon, 30 Jan 2023 15:58:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20230130092157.1759539-21-hch@lst.de>
References: <20230130092157.1759539-21-hch@lst.de>
 <20230130092157.1759539-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/23] rxrpc: use bvec_set_page to initialize a bvec
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3499862.1675094288.1@warthog.procyon.org.uk>
Date: Mon, 30 Jan 2023 15:58:08 +0000
Message-ID: <3499863.1675094288@warthog.procyon.org.uk>
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
 linux-fsdevel@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mm@kvack.org, io-uring@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, devel@lists.orangefs.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Christoph Hellwig <hch@lst.de> wrote:

> Use the bvec_set_page helper to initialize a bvec.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David Howells <dhowells@redhat.com>


