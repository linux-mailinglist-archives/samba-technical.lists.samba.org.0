Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D17697CA4
	for <lists+samba-technical@lfdr.de>; Wed, 15 Feb 2023 14:03:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1kO8N6JLykhQ4YdfKs2d43b+gPORvqK7xPAz9ypT+Zk=; b=kkb29xEggmPE2920Rvffy8pdYD
	9tnJhKNFxMOI3aPmUuCcf4j0xH5BNCvkOL0Ktr+aAI1ctFDNIBabVduVHJyolIqZZA1QFNq6Lbj2b
	bGht3lFh2yvYXkMUCsYYN/zYv8jaRxGJM2pqI88BKX2MG2TKOuhCSpAHD+gXLXP2iX36CDMDZjryV
	kqRl89RkEUEPPhcJ2dn8c/8uR6KneAXfO/0qhPLaH/gTuNUhAr+c0Z0L2UHteqX4vfd2Bpewrc9Nb
	ak0NCpguhu6Spq26g1mPbNM0HxjgIq22Bp9y6Ky+Dr6BEAZRv6cfdZVoIndXURV7jAC2O1Eh0mgjr
	UELL605g==;
Received: from ip6-localhost ([::1]:47820 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pSHQM-00CLSw-Et; Wed, 15 Feb 2023 13:02:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43737) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pSHQH-00CLSm-GM
 for samba-technical@lists.samba.org; Wed, 15 Feb 2023 13:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kO8N6JLykhQ4YdfKs2d43b+gPORvqK7xPAz9ypT+Zk=;
 b=ChQXqeMqdW+QnogcPSvUwwiVHsWkjON+7pvbwLVNRByY7t+xWvvnoUtFoKH8vOTdoV1g64
 k7dRasoPguYkz1T9MaR1Nx5wO2wenWF4oYdV7QML8MacYAhyI5DNBgU3AkzB0XMt0BgNFn
 4MD9edPySNGvBlDbDreZEXc6ridb0FE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676466126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kO8N6JLykhQ4YdfKs2d43b+gPORvqK7xPAz9ypT+Zk=;
 b=ChQXqeMqdW+QnogcPSvUwwiVHsWkjON+7pvbwLVNRByY7t+xWvvnoUtFoKH8vOTdoV1g64
 k7dRasoPguYkz1T9MaR1Nx5wO2wenWF4oYdV7QML8MacYAhyI5DNBgU3AkzB0XMt0BgNFn
 4MD9edPySNGvBlDbDreZEXc6ridb0FE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-BxtiEXZhM5WJBsv1CLOnxg-1; Wed, 15 Feb 2023 08:02:02 -0500
X-MC-Unique: BxtiEXZhM5WJBsv1CLOnxg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842BD3C10691;
 Wed, 15 Feb 2023 13:02:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57EA9140EBF4;
 Wed, 15 Feb 2023 13:01:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20230215-topic-next-20230214-revert-v1-2-c58cd87b9086@linaro.org>
References: <20230215-topic-next-20230214-revert-v1-2-c58cd87b9086@linaro.org>
 <20230215-topic-next-20230214-revert-v1-0-c58cd87b9086@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/2] Revert "splice: Do splice read from a buffered file
 without using ITER_PIPE"
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3055588.1676466118.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Feb 2023 13:01:58 +0000
Message-ID: <3055589.1676466118@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: Steve French <sfrench@samba.org>, Shyam Prasad N <sprasad@microsoft.com>,
 linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ronnie Sahlberg <lsahlber@redhat.com>, dhowells@redhat.com, linux-mm@kvack.org,
 Tom Talpey <tom@talpey.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> next-20230213 introduced commit d9722a475711 ("splice: Do splice read fr=
om
> a buffered file without using ITER_PIPE") which broke booting on any
> Qualcomm ARM64 device I grabbed, dereferencing a null pointer in
> generic_filesplice_read+0xf8/x598. Revert it to make the devices
> bootable again.
> =

> This reverts commit d9722a47571104f7fa1eeb5ec59044d3607c6070.
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Commit d9722a47571104f7fa1eeb5ec59044d3607c6070 was part of v13 of my
patches.  This got replaced yesterday by a newer version which may or may =
not
have made it into linux-next.

This is probably a known bug fixed in the v14 by making shmem have its own
splice-read function.

Can you try this?

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log=
/?h=3Diov-extract

(Also, can you include me in the cc list as I'm the author of the patch yo=
u
reverted?)

Thanks,
David


