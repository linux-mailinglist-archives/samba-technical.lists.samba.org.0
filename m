Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA08B3370
	for <lists+samba-technical@lfdr.de>; Fri, 26 Apr 2024 10:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Q2pEeDTYgZgn4hwUL7ZGzmZnqIMR6LoTfbNN89+uR1s=; b=Ui64Wc03AELpKMWg3BzpTFrjYs
	gVkGmtconPXsiEjPo2CCsVmJemhO4CnM335XlOpzDo5MY7kv2VQaMKBSu4YLH0dN4Cv3DiGeWgXvW
	zF+IestyxSihvXoTC9ojfvNYhg+6CrodAUp1FOR4r06aSpf7jNgAQrvV/AiuhsMcMmpfJLrK9z4Ey
	0rpJT++4CeySObh8Ga1fzlHXIXXTFT7FE6BgfWS4DNKGtjke5FcbLdErcbg8od7uMJOuahpHCnCsL
	cq1nQk5BbRL9x/sHJJo951eRmxpVN0hJkuVDn353mLg8oLNKL6MGrIUJXOk+KZSM3Pbi3lhJQsej6
	2tfIFBVA==;
Received: from ip6-localhost ([::1]:58358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s0HOI-005ndW-DT; Fri, 26 Apr 2024 08:57:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25620) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s0HOD-005ndP-FG
 for samba-technical@lists.samba.org; Fri, 26 Apr 2024 08:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2pEeDTYgZgn4hwUL7ZGzmZnqIMR6LoTfbNN89+uR1s=;
 b=NgE9NuW3Q9dl9+xBugFx0FGtexSevTrtLhxV1DjCn8n1BXySfyRcQJm2btokrT6h8HdhSb
 XIoIy/wU7X7BAk/u9S/BrLfHzex44Aule7Z8Arz63Mn+QFSsHP0Ss0UJnPR2VUzvSattkv
 kBFdJc28ibbP1VJw7Yab/UqoyCxk2qs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q2pEeDTYgZgn4hwUL7ZGzmZnqIMR6LoTfbNN89+uR1s=;
 b=NgE9NuW3Q9dl9+xBugFx0FGtexSevTrtLhxV1DjCn8n1BXySfyRcQJm2btokrT6h8HdhSb
 XIoIy/wU7X7BAk/u9S/BrLfHzex44Aule7Z8Arz63Mn+QFSsHP0Ss0UJnPR2VUzvSattkv
 kBFdJc28ibbP1VJw7Yab/UqoyCxk2qs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-qRaC9TC_OIC8O5N87ajHKw-1; Fri, 26 Apr 2024 04:57:00 -0400
X-MC-Unique: qRaC9TC_OIC8O5N87ajHKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B03E8032FA;
 Fri, 26 Apr 2024 08:56:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 146B72166B31;
 Fri, 26 Apr 2024 08:56:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <2145850.1714121572@warthog.procyon.org.uk>
References: <2145850.1714121572@warthog.procyon.org.uk>
 <Zin4G2VYUiaYxsKQ@xsang-OptiPlex-9020>
 <202404161031.468b84f-oliver.sang@intel.com>
 <164954.1713356321@warthog.procyon.org.uk>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [dhowells-fs:cifs-netfs] [cifs] b4834f12a4:
 WARNING:at_fs/netfs/write_collect.c:#netfs_writeback_lookup_folio
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2145948.1714121817.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 09:56:57 +0100
Message-ID: <2145949.1714121817@warthog.procyon.org.uk>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 lkp@intel.com, linux-cifs@vger.kernel.org, Rohith
 Surabattula <rohiths.msft@gmail.com>, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

David Howells <dhowells@redhat.com> wrote:

> =3D=3D> Retrieving sources...
>   -> Source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git
>   -> Cloning linux git repo...
> Cloning into bare repository '/root/lkp-tests/programs/turbostat/pkg/lin=
ux'...

Actually, it cloned the linux git repo twice by http, once into:

	programs/turbostat/pkg/linux/

which is a bare repo, and once into:

	tmp-pkg/turbostat/src/linux/

which has all the files checked out.

If it must clone linux, can it at least clone one from the other?

David


