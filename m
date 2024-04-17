Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAA38A8339
	for <lists+samba-technical@lfdr.de>; Wed, 17 Apr 2024 14:35:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=e5g+9Z9HtsHEKxe2LaOAecd54UvAXCkGQ96msWQj9N4=; b=IryOH1h4uoiouxUUIO/SVt9fUc
	iez5JXObo/iRCnyf7qnUMgW/D5d7vS0mIPn20nSV4jBJGWZT8lLT/ueVPdEksEfF+t3ehgTQhhuvY
	KNUjOS+VlPrmJ5Ftep+dvE91/kRSqF0MAi+cdeCRgdFXVdM1Ubs9djdTWuoXycIKvLbddm/eFRFLj
	qMAdj3kMGv4MhN2dqokgnWPw5pdCA+Ww2kSILeAOXdfrasgcX4jQeVa7Muv8dblmQeFAH9f+T4I7M
	ONltqbw0bk5IrJ99kkKJOInAU8I5HbnzChT6ARxuN/R73XjJ8+Zp/sphtwuCr3x/0Jhu+ydH5ngF1
	FPgb7H3g==;
Received: from ip6-localhost ([::1]:40446 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rx4Ur-004yCP-Mx; Wed, 17 Apr 2024 12:34:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29157) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rx4Un-004yCI-MV
 for samba-technical@lists.samba.org; Wed, 17 Apr 2024 12:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713357273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e5g+9Z9HtsHEKxe2LaOAecd54UvAXCkGQ96msWQj9N4=;
 b=MEl69lzC0HCbzLsj4jocSw9D5vfU473w1gbp007uf7oJ5ymk2xqpeANysVBp+xpXpajejC
 +GWN5EzOKEL1hwunG6mn9apwJthshnQw88BKxGqt6KMxs151jTqfWRZOT5YyPmT1BGDyVt
 riu9w3DUvsQzyx84NHzQaSmwZKOpIns=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713357274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e5g+9Z9HtsHEKxe2LaOAecd54UvAXCkGQ96msWQj9N4=;
 b=F7aikNKGKuveGTYjLzb3YeUpTBj2fPEmy7Zk2U6tfw+QGUMR1JfJTj4d5lmvkX6SrO4z+o
 cdUMU8ZFsyYxphQLm8nS/Islav+VbCUnAuXEePzFtwaEXGGFfVD5ipxkxXN20N6mgVAR+/
 7JJjQnxQkuCz+RqDe7PHVaJ9LfngmYs=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-HZb4tYkCOiuraGxVwvC9Yw-1; Wed,
 17 Apr 2024 08:18:48 -0400
X-MC-Unique: HZb4tYkCOiuraGxVwvC9Yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D17DE3C0253F;
 Wed, 17 Apr 2024 12:18:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 762A6112132A;
 Wed, 17 Apr 2024 12:18:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <202404161031.468b84f-oliver.sang@intel.com>
References: <202404161031.468b84f-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [dhowells-fs:cifs-netfs] [cifs] b4834f12a4:
 WARNING:at_fs/netfs/write_collect.c:#netfs_writeback_lookup_folio
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <164953.1713356321.1@warthog.procyon.org.uk>
Date: Wed, 17 Apr 2024 13:18:41 +0100
Message-ID: <164954.1713356321@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

When I try and do "sudo bin/lkp install job.yaml", I get an error because
Fedora 39 doesn't have a libarchive-tools package.

Also, I can't find a "filemicro_seqwriterandvargam.f" script, presumably
because it would get patched into existence by the failing install step above.

David


