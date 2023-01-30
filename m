Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FB5680B3C
	for <lists+samba-technical@lfdr.de>; Mon, 30 Jan 2023 11:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CICRFAbCzChYD1znyWS61qGZqh3HfSsIj8zLg6AqEXc=; b=srHfnumusKjuelkhW9SCagbMXt
	m/zgch7ijJX1dexjb93Ktcj75gpCnPBjKYaKedPJMfIkfike0LO15Q0xcm37fEKwOeUeLrAlLrlhz
	tRhJZB7NK1oenJ8H8zB+E6xWKGU1Vh/Ex5LH6nl528PNWDTFzOiRbS/TV56nRvv/rl9FYdH8fuxwp
	Rza+C93uvsvIXro5zAmm+PSYCZhV4RHdXpyOTMKmEwHu5jbCIq8LaFMr30GSPVNS2bYWmCCdhYMqr
	wmiNOM+p+ldpFrNNbHTXc2ZdKY/du0cCJy25IYStWVDfQsLxPlwLZg3iQriyfU/lJSeCzkU0/9vmm
	/fe+XrVg==;
Received: from ip6-localhost ([::1]:30696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMRhp-004ckA-Dg; Mon, 30 Jan 2023 10:48:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23986) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pMRhk-004ck1-Sh
 for samba-technical@lists.samba.org; Mon, 30 Jan 2023 10:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CICRFAbCzChYD1znyWS61qGZqh3HfSsIj8zLg6AqEXc=;
 b=MHldm3Q39pGhe9CUJ0c5YHL5iXrVJJpgTsdj4r/WTAIv3nLpzloq8Cue1w0LGfghXM8IZw
 GEvOKRPG2WB3w9ah88Xa+wWweUzfPytGL6fama1XJFW+ACm4wBYnf7LLYPbtvB8FwbDikJ
 sgdlwzYkqQjP5yVQkei8pweAdndBeds=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675075681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CICRFAbCzChYD1znyWS61qGZqh3HfSsIj8zLg6AqEXc=;
 b=OlvYUt6c2t1ShAFTlHjsrJdGPR5wg69nObJ/dJ0zYvczTTOUpPPt4JKfhqmUDIghjC6Sii
 F9H4loshiJ8HJgFBg+iX7XMbFUr8dtMJM37MRu+cl2qKMcZLTv8be6mKRI/wEK1v4hPwmi
 fyp1WOVTmQJW/JmNRjXTDACfXFW2bog=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-m7rZ0bd0PKa4hu7tOJYsfA-1; Mon, 30 Jan 2023 05:31:27 -0500
X-MC-Unique: m7rZ0bd0PKa4hu7tOJYsfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408462999B26;
 Mon, 30 Jan 2023 10:31:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AA28C15BAD;
 Mon, 30 Jan 2023 10:31:24 +0000 (UTC)
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
Content-ID: <3347458.1675074683.1@warthog.procyon.org.uk>
Date: Mon, 30 Jan 2023 10:31:23 +0000
Message-ID: <3347459.1675074683@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

> +		bvec_set_page(&bv, ZERO_PAGE(0), len, 0);

Maybe bvec_set_zero_page()?

David


