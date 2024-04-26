Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF4D8B3354
	for <lists+samba-technical@lfdr.de>; Fri, 26 Apr 2024 10:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JX0C/eE8/IhmRZdY4t48yInlwmvvYIOtx58avujDOfw=; b=bMO0oXB0uLimpCuTjEptFFbtx4
	Qe8X8/6sky4GHIdjAL++Hw4e2O2cqk/RKIV4AHHqvScomihBxigJhXE/B/ekk8aayEciLsJoH8eBa
	+xbVyq4wLfgBAsickeRD4rLt/GfmyVbhqy6Kwg2K3T1gMHFrtG9z5U/IX2BADEN9ncGjY3JOK5Rl5
	CQ/GXVPV8Ur25Pp0dOM2K9nYKOPopNaP9EK60vgfgI/eeyirys9hj5ULVJ+yrH2nEvl4+0VHfH0JM
	rwNEb5qaqqjSE+g5g3BkuQ9oNKQvc9xbMHvlmVqbh0+5FHyxZy/qdC2UVnk0L46Icc4K9klDq9SRY
	6ifoZZjQ==;
Received: from ip6-localhost ([::1]:40278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s0HIT-005nQV-P9; Fri, 26 Apr 2024 08:51:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50105) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s0HIP-005nQO-FL
 for samba-technical@lists.samba.org; Fri, 26 Apr 2024 08:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX0C/eE8/IhmRZdY4t48yInlwmvvYIOtx58avujDOfw=;
 b=LH69xix6oaZNca0Yz/UFhyuqNHUZtA0BpMtp2ChGZNN5D2Epuo8PF+Ob2hyuNuwqRU70kv
 cq4yr3jHbJjgKqxLbGzoLI3IXmwEx8LTGU9SUK8gwVH9LgHNLMPPfANHA060+lGqksjChl
 u9aiiUO8H1FIK5yCp3MfOWpYqdJIsFU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX0C/eE8/IhmRZdY4t48yInlwmvvYIOtx58avujDOfw=;
 b=Qj2rbaRliiMQ1uhY5j2WFX9gCNjIz2G0jDBXQ3hi4DJ55FZTh1+QFZJTnMCeiIi6Qwvrmo
 nggGAITKQIxc0MZ6ToJsGwrHJNObci9eMxY3ITD7WoQupyZN9q4zoHYtDX8utdwIOrYSkF
 /r/hZdrnKDidVYKQKJ3kxzAzqLrduwQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318-5-xSqQlbNLWhSxB61eaJVg-1; Fri,
 26 Apr 2024 04:34:05 -0400
X-MC-Unique: 5-xSqQlbNLWhSxB61eaJVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F0C228C97CB;
 Fri, 26 Apr 2024 08:34:05 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A70B32024511;
 Fri, 26 Apr 2024 08:34:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <Zin4G2VYUiaYxsKQ@xsang-OptiPlex-9020>
References: <Zin4G2VYUiaYxsKQ@xsang-OptiPlex-9020>
 <202404161031.468b84f-oliver.sang@intel.com>
 <164954.1713356321@warthog.procyon.org.uk>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [dhowells-fs:cifs-netfs] [cifs] b4834f12a4:
 WARNING:at_fs/netfs/write_collect.c:#netfs_writeback_lookup_folio
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 09:34:02 +0100
Message-ID: <2145544.1714120442@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 lkp@intel.com, linux-cifs@vger.kernel.org, Rohith
 Surabattula <rohiths.msft@gmail.com>, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Oliver Sang <oliver.sang@intel.com> wrote:

> I can pass "sudo bin/lkp install job.yaml" on my local machine with fedor=
a 39
> now.

Note that this causes:

systemd-sysv-generator[23561]: SysV service '/etc/rc.d/init.d/network' lack=
s a native systemd unit file. =E2=99=BB=EF=B8=8F Automatically generating a=
 unit file for compatibility. Please update package to include a native sys=
temd unit file, in order to make it safe, robust and future-proof. =E2=9A=
=A0=EF=B8=8F This compatibility logic is deprecated, expect removal soon. =
=E2=9A=A0=EF=B8=8F

to appear.  What's it doing to the networking settings?  It shouldn't be
touching those.

Also, does it have to install its own cifs server?  Can it not be directed =
to
my test server that's already set up on another machine?  And does it have =
to
build a kernel?  Can it not use the one that's already running on the machi=
ne?

David


