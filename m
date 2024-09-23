Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E790F97E662
	for <lists+samba-technical@lfdr.de>; Mon, 23 Sep 2024 09:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2lDimM0Uis4sHfBgBpHSwx2c5/VL/mJyvDIOhdl/yb8=; b=qFfLHbca9u4hbgoxLJi+EfFPYP
	6DwOUb5YJ/Zt9xO7+U3CKguTM6kcfCruxpgma+GtIGQ7NW7Dr0tO1ReFf5oGnyjVTy9xsReKB+iaw
	iu6UtIHpZZYmRFHPyyPyoHs9KQNyEpM7ngFlI/DG6kygiW40bkB3+EnjdJiYAYQ16H9ZzPTteRVkA
	4gEEo/yyiJ4xy9kbLzv5KnnwOl9/cDGideKSIL86bOD/8tIQ//kLlnXFAdOWv680S1tkNLHOBsAzd
	74heFOOr3nCgvE80xrU3KVHyJK0CFYwnCKsLaDAaSSE/IkhMTztMUsNYSFpXLaGXdqYMlke/kA7S7
	x0Ppi9QQ==;
Received: from ip6-localhost ([::1]:47720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ssdCB-000XNH-Ir; Mon, 23 Sep 2024 07:09:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56487) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssdC3-000XNA-Pc
 for samba-technical@lists.samba.org; Mon, 23 Sep 2024 07:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727075347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2lDimM0Uis4sHfBgBpHSwx2c5/VL/mJyvDIOhdl/yb8=;
 b=W/0QgyXcr6HIHJb7tHzCYXTDnar5iTJzf6l1xabOSDwtEp0if9z60TsmCVs5vRbTLGfK44
 giOOCKmC/vjnCE9LWhgEf/LrdRYjTO3IPTBHRWNpRZyrLNf9BJu7am76vruXX8zK4zcfYL
 gatHwsT4Qqf6agxItVWNRoboFmo2lMA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727075347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2lDimM0Uis4sHfBgBpHSwx2c5/VL/mJyvDIOhdl/yb8=;
 b=W/0QgyXcr6HIHJb7tHzCYXTDnar5iTJzf6l1xabOSDwtEp0if9z60TsmCVs5vRbTLGfK44
 giOOCKmC/vjnCE9LWhgEf/LrdRYjTO3IPTBHRWNpRZyrLNf9BJu7am76vruXX8zK4zcfYL
 gatHwsT4Qqf6agxItVWNRoboFmo2lMA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-BUxCkdedMSymFuojPHzqnQ-1; Mon,
 23 Sep 2024 03:09:03 -0400
X-MC-Unique: BUxCkdedMSymFuojPHzqnQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown
 [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7142C19054EE; Mon, 23 Sep 2024 07:09:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.145])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1AA241956052; Mon, 23 Sep 2024 07:08:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <202409221711.b537f7a8-oliver.sang@intel.com>
References: <202409221711.b537f7a8-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [linus:master] [cifs] 43a64bd02f: xfstests.generic.465.fail
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <743743.1727075336.1@warthog.procyon.org.uk>
Date: Mon, 23 Sep 2024 08:08:56 +0100
Message-ID: <743744.1727075336@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org, Christian
 Brauner <brauner@kernel.org>, lkp@intel.com,
 samba-technical@lists.samba.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, oe-lkp@lists.linux.dev,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

kernel test robot <oliver.sang@intel.com> wrote:

> kernel test robot noticed "xfstests.generic.465.fail" on:

It works fine for me.  Can you grab the contents of /proc/fs/netfs/stats after
it has failed?

David


