Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA687C88C0D
	for <lists+samba-technical@lfdr.de>; Wed, 26 Nov 2025 09:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fH3692M1ilX9eBWXmUlT3ZP27Nw/yOe8TaeOQNbcsV8=; b=A5K4jRVemCKfdwDMkLtlbfdTdj
	6KAzAtHRVpkHgxN4zC8NEozgvv14dPjtV2HHiURIy9euNZ2r9eHwT+dkSbyUwSSkNcOQDsiBnn23c
	syUQNaVDfcn53rS8zKk3H/KVCXeUPmmme7m2g8oghWrKZFEXKT4pMJvpvAtQ02OtxF/8W1kXOXbqZ
	4eJZnkvUUx72Cy6iHmNtuYcKW3c2suraY7mcy0KGFOnOmvbIdC5KFL9NMtJ3nfz3RoxpfljmU1VXX
	p6CHfubkbDTKGF5UdvBNognrFrHBnOGNFDGMk7qytsrxq2ajaj9wLAyNgsnu6XYdFkJZZgIryiFjd
	+RZqCFXw==;
Received: from ip6-localhost ([::1]:57192 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOBFA-00DMxQ-Mk; Wed, 26 Nov 2025 08:51:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25741) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOBF6-00DMxC-Ap
 for samba-technical@lists.samba.org; Wed, 26 Nov 2025 08:51:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764147072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fH3692M1ilX9eBWXmUlT3ZP27Nw/yOe8TaeOQNbcsV8=;
 b=QbX3YxCuf2OQwYoZjAu26F0QHu96BU5sQlwE6GuIXzfEHL3rQ/UVgVZD6pTZVwRHYHKjsT
 yAgTUpskYSOTyPphaZ7OljFwXWGqvhdkVbaSrV31hehCCtHsbVG1Ae+FH7pRTUG2cCXtcB
 8p0Es6ljjJhWnRZWR0gg4iZ4QBrbmn4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764147072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fH3692M1ilX9eBWXmUlT3ZP27Nw/yOe8TaeOQNbcsV8=;
 b=QbX3YxCuf2OQwYoZjAu26F0QHu96BU5sQlwE6GuIXzfEHL3rQ/UVgVZD6pTZVwRHYHKjsT
 yAgTUpskYSOTyPphaZ7OljFwXWGqvhdkVbaSrV31hehCCtHsbVG1Ae+FH7pRTUG2cCXtcB
 8p0Es6ljjJhWnRZWR0gg4iZ4QBrbmn4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-wKo8iuMwN7mL9Dv_gbKYVA-1; Wed,
 26 Nov 2025 03:35:17 -0500
X-MC-Unique: wKo8iuMwN7mL9Dv_gbKYVA-1
X-Mimecast-MFC-AGG-ID: wKo8iuMwN7mL9Dv_gbKYVA_1764146116
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79000180009D; Wed, 26 Nov 2025 08:35:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C519319560A2; Wed, 26 Nov 2025 08:35:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [PATCH v4 000/145] smb: smbdirect/client/server: moving to common
 functions and smbdirect.ko
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4098542.1764146111.1@warthog.procyon.org.uk>
Date: Wed, 26 Nov 2025 08:35:11 +0000
Message-ID: <4098543.1764146111@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Cc: linux-cifs@vger.kernel.org, Paulo Alcantara <pc@manguebit.org>,
 samba-technical@lists.samba.org, dhowells@redhat.com,
 Steve French <smfrench@gmail.com>, Tom Talpey <tom@talpey.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Stefan Metzmacher <metze@samba.org> wrote:

> It is based on dhowells-linux-fs/cifs-cleanup
> at commit 1bc2089694a33afb711779dfcb4bbbe10ccbe466,

Btw, I applied the acks I've got to my patches on that branch if you want to
rebase on it; if not, I'm sure Steve will cope:-).

David


