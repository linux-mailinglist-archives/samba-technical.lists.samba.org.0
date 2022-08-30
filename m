Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9025A5E76
	for <lists+samba-technical@lfdr.de>; Tue, 30 Aug 2022 10:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tsLY5F5Ozz1AdHlAsgibfQkv7JMTI/b0jjcNGuI8VEA=; b=JLQV6RZcAWi16Oam8Epn2Uz3dr
	VSeqqvNTDNBCH1s1yv7woTksL4P8Uxksbm9P1Ei4R01qbXS67fQyGsIs29joE56jpcujOd4M7bUlB
	zgYu0W336PV364Fi3KNPc258o1i9plpigRQsw2LGwZBF4LrcOhHzLyOpeHWRB9siVW2xOCLDfyaDA
	wm8c1uB8navsKrQRLN7bh/EpNbiavEvtQ3dlF4RKpkK281XniqtrRMV8YfxYqF5mPrFBmxn83106S
	VPaGlEe5rWaMHXcYo68GcznbNWEIrRODoFiLpCRCEIkW1HREU38qA0qMpUGo8JpvwmA3oNy0fQ+rV
	vcmgiogQ==;
Received: from ip6-localhost ([::1]:58754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSwtq-0030rI-R2; Tue, 30 Aug 2022 08:47:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oSwtm-0030r9-AF
 for samba-technical@lists.samba.org; Tue, 30 Aug 2022 08:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661849222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tsLY5F5Ozz1AdHlAsgibfQkv7JMTI/b0jjcNGuI8VEA=;
 b=Q+CD1ZDRk2tPvasfP0m9eBZzFtCYRS568w1FCW5chkWlP5R+t/pfwjt+yBuOsUvkczkJXK
 5zI4/CVpS/si5D/d0rIBxnSeGakv7mtDCA7394XW/jZCp+tHGJHtWLoqYM6oGe9jE3OAQ4
 OZtl9hDRoQT2rJv0oSRvY2JJt0lRWTU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661849222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tsLY5F5Ozz1AdHlAsgibfQkv7JMTI/b0jjcNGuI8VEA=;
 b=Q+CD1ZDRk2tPvasfP0m9eBZzFtCYRS568w1FCW5chkWlP5R+t/pfwjt+yBuOsUvkczkJXK
 5zI4/CVpS/si5D/d0rIBxnSeGakv7mtDCA7394XW/jZCp+tHGJHtWLoqYM6oGe9jE3OAQ4
 OZtl9hDRoQT2rJv0oSRvY2JJt0lRWTU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-4P5jwUmHM7KyShcoWHJFJQ-1; Tue, 30 Aug 2022 04:46:56 -0400
X-MC-Unique: 4P5jwUmHM7KyShcoWHJFJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 427C180418F;
 Tue, 30 Aug 2022 08:46:56 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5881E2026D64;
 Tue, 30 Aug 2022 08:46:55 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <CAH2r5muT-nX+tgk6wm=L1qjWNhc2c5GDBaQXBGbrE-hNkPr3cw@mail.gmail.com>
References: <CAH2r5muT-nX+tgk6wm=L1qjWNhc2c5GDBaQXBGbrE-hNkPr3cw@mail.gmail.com>
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH v2][SMB3 client] smb3: use filemap_write_and_wait_range
 instead of filemap_write_and_wait
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1899334.1661849214.1@warthog.procyon.org.uk>
Date: Tue, 30 Aug 2022 09:46:54 +0100
Message-ID: <1899335.1661849214@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeff Layton <jlayton@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, dhowells@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Steve French <smfrench@gmail.com> wrote:

> Subject: [PATCH] smb3: use filemap_write_and_wait_range instead of
>  filemap_write_and_wait
> 
> When doing insert range and collapse range we should be
> writing out the cached pages for the ranges affected but not
> the whole file.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Steve French <stfrench@microsoft.com>

Reviewed-by: David Howells <dhowells@redhat.com>


