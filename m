Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BED8B345D
	for <lists+samba-technical@lfdr.de>; Fri, 26 Apr 2024 11:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6Ii9FxdCUhkSL/NP0ErV+eSCcUrQRGZSNZBjNMLs3pc=; b=of/OWZCgUDj/0gmnGqbqNgL6Tm
	By2s5tih07+T6IPErrNZgFuNiOzqFvkD4KBsJXgFF/eQ/T3LixZS9qXO9uOfJS0Q9FrDkR0XZvR2r
	unp9NsvEFp+ky2wEKyF6Nb12ejJk7T/fH1I5YSzwdIf8xUpvab9raGsDyyu2EODA6q1Vxj+/xcX85
	xuABnoNHipXWcZFVRvFc6ByBm28hjoP0u06U0OlryEUNtnar0wx1GhJRJAuedVcwyUjR0MuSmUqd+
	QhBQ0g1nsXbhF8r813MuwBHFSgAaFmITus7vrYRjjtnPIpIPVY8VbALcr5eXxz9Zse5n0tNDAqKXF
	AQDOxaBg==;
Received: from ip6-localhost ([::1]:63092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s0I6Z-005nu5-Sd; Fri, 26 Apr 2024 09:42:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47893) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s0I6V-005nty-04
 for samba-technical@lists.samba.org; Fri, 26 Apr 2024 09:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714124567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ii9FxdCUhkSL/NP0ErV+eSCcUrQRGZSNZBjNMLs3pc=;
 b=JTwYE2yJnbB9DUaHYzxXlupffBYRjk/qSmKp2+aDrtVmUZOYvrSGDT+BpLox5gcUSOuB5w
 GAwpZsyrtEeUkLHYSYXCFs2znXpUmg3wCZg1WXVj9zm2x2Gx5zjrS6Cn8HLwKJcmavxk7B
 r8/WME4D/+NujPKZUtSk6F9TnItOXk8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714124567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Ii9FxdCUhkSL/NP0ErV+eSCcUrQRGZSNZBjNMLs3pc=;
 b=JTwYE2yJnbB9DUaHYzxXlupffBYRjk/qSmKp2+aDrtVmUZOYvrSGDT+BpLox5gcUSOuB5w
 GAwpZsyrtEeUkLHYSYXCFs2znXpUmg3wCZg1WXVj9zm2x2Gx5zjrS6Cn8HLwKJcmavxk7B
 r8/WME4D/+NujPKZUtSk6F9TnItOXk8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-nd8bGkfbPNO6Q_6JHXsyew-1; Fri, 26 Apr 2024 05:42:44 -0400
X-MC-Unique: nd8bGkfbPNO6Q_6JHXsyew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7825C8001B2;
 Fri, 26 Apr 2024 09:42:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 35B522033A49;
 Fri, 26 Apr 2024 09:42:42 +0000 (UTC)
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
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2146613.1714124561.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 10:42:41 +0100
Message-ID: <2146614.1714124561@warthog.procyon.org.uk>
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

Trying to do "lkp run job.yaml" doesn't work:

/root/lkp-tests/filters/need_kconfig.rb:20:in `read_kernel_kconfigs': .con=
fig doesn't exist: /pkg/linux/x86_64-rhel-8.3/gcc-13/b4834f12a4df607aaedc6=
27fa9b93f3b18f664ba/.config (Job::ParamError)
        from /root/lkp-tests/filters/need_kconfig.rb:176:in `block in expa=
nd_expression'
        from /root/lkp-tests/lib/erb.rb:51:in `eval'
        from /root/lkp-tests/lib/erb.rb:51:in `expand_expression'
        from /root/lkp-tests/lib/job.rb:646:in `evaluate_param'
        from /root/lkp-tests/lib/job.rb:694:in `block in expand_params'
        from /root/lkp-tests/lib/job.rb:79:in `block in for_each_in'
        from /root/lkp-tests/lib/job.rb:78:in `each'
        from /root/lkp-tests/lib/job.rb:78:in `for_each_in'
        from /root/lkp-tests/lib/job.rb:691:in `expand_params'
        from /root/lkp-tests/bin/run-local:138:in `<main>'

I tried to run the filebench directly, but that only wants to hammer on
/tmp/bigfileset/ and also wants a file for SHM precreating in /tmp.  I was
able to get it to work with cifs by:

touch /tmp/filebench-shm-IF6uX8
truncate -s 184975240 /tmp/filebench-shm-IF6uX8
mkdir /tmp/bigfileset
mount //myserver/test /tmp/bigfileset/ -o user=3Dshares,pass=3D...,cache=3D=
loose

/root/lkp-tests/programs/filebench/pkg/filebench-lkp/lkp/benchmarks/filebe=
nch/bin/filebench -f /lkp/benchmarks/filebench/share/filebench/workloads/f=
ilemicro_seqwriterandvargam.f

It tries to remove /tmp/bigfileset/, can't because it's mounted, and then
continues anyway.

It should be easier than this ;-)

David


