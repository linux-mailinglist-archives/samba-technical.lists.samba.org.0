Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 922EE8CBF51
	for <lists+samba-technical@lfdr.de>; Wed, 22 May 2024 12:37:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Z2eswcLWLrokwlSeNmsp1rGG7SqGmuU6iodQGIpucDc=; b=rL2eWS5g/LgfY9eFygCjEeY2x2
	FKoVJMD01W5Bm16Mo4O5irZEr3TNMEFd9cjbVnOTvBpUNhXC7V2no6r51tnbEIJIfRLthrPGkehKD
	PDQ6TD9f+u/jKWkCISjq7CkNU65PhsdeRcpcfE4OD+q3cLgFgyIcAGmIWVx1sCoTpNVy+hxXje+uw
	wIRqh+mDaSmU+uBdHCmwr5/huhHX3TnPTczxK3zIdj1FaYOl6dFGoLF6XWARQtlkzaKZ5b138S+RP
	6yO9t9L6NbUuPpMrIA4wf90OBdg5iCXovn33YSgz+llGXe4scAf2Iqto7jR77HWcCL6e2x2vzuSRi
	+WwOQOdQ==;
Received: from ip6-localhost ([::1]:27082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s9jKo-009bRO-0c; Wed, 22 May 2024 10:36:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42993) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s9jKk-009bRH-Eh
 for samba-technical@lists.samba.org; Wed, 22 May 2024 10:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716374190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2eswcLWLrokwlSeNmsp1rGG7SqGmuU6iodQGIpucDc=;
 b=Ta4A5FnUHsJrNyOSf895aUQjuFpZi3VF3/kfkdwuUMNsCqEzafL+B9sJbqVU4Z4+0YaZ5D
 pXw/MKHeSBr3kyi1yz7hDDY56YHV8W89Ze9XU7jFkxjyn20XTFd3vsY3ivz8l4cjZYkUXl
 /70U9Enz9jwHf3XmdmG4ujhqzwMMxrw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716374190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2eswcLWLrokwlSeNmsp1rGG7SqGmuU6iodQGIpucDc=;
 b=Ta4A5FnUHsJrNyOSf895aUQjuFpZi3VF3/kfkdwuUMNsCqEzafL+B9sJbqVU4Z4+0YaZ5D
 pXw/MKHeSBr3kyi1yz7hDDY56YHV8W89Ze9XU7jFkxjyn20XTFd3vsY3ivz8l4cjZYkUXl
 /70U9Enz9jwHf3XmdmG4ujhqzwMMxrw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-6Sc82J_7MT-LaWT92udlKg-1; Wed,
 22 May 2024 06:36:28 -0400
X-MC-Unique: 6Sc82J_7MT-LaWT92udlKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A9D0380008F;
 Wed, 22 May 2024 10:36:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADEDD200A35C;
 Wed, 22 May 2024 10:36:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240522185305.69e04dab@echidna>
References: <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
To: David Disseldorp <ddiss@samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <370799.1716374185.1@warthog.procyon.org.uk>
Date: Wed, 22 May 2024 11:36:25 +0100
Message-ID: <370800.1716374185@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 dhowells@redhat.com, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Disseldorp <ddiss@samba.org> wrote:
> ...
> I think the best way to proceed here would be to capture traffic for the
> same workload against a Windows SMB server. This could be don't by using
> your cifs.ko workload or extending test_ioctl_sparse_qar_malformed().

I don't have a windows server I can try.  Steve may be able to try that.

David


