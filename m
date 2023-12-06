Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F062B806DA1
	for <lists+samba-technical@lfdr.de>; Wed,  6 Dec 2023 12:16:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7/oZHACPeEsD+mXYOiqtdmGuUQoOrWauvnLhXLrRq8s=; b=JCDc9ULoZOxnh8L+caCkDMfdlx
	bWCB8TVezruwJsX4CYZ1G695Z1JMTW+aqS0QuNJO3IJ2wVmDeoAfL/s9zn5epuZEH49VXjo5VzvMO
	6SY5FRJqDpUDEo9/h59rebO7AJ1E7Nq/Y252VYOSl6+va3TzHJxnBFtrtrbaSzWguhJx1aCffR1ZN
	4F7FndQ94CXzFJn8X4st1A4jYyo9IixLqFu5mNzqp+Lv9b1uff33RTJKMQcHcWfce6+5mnRPASTrS
	JNT3PPsV3tHL15kYsZcZkf4bTd63q8WiD0IYomiptbETz/Cl67IDAe1MnXiPvho0VuW6Y4fsEZswJ
	2EmF33VA==;
Received: from ip6-localhost ([::1]:37844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAptK-004f96-O8; Wed, 06 Dec 2023 11:16:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21567) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rAptF-004f8Z-Hz
 for samba-technical@lists.samba.org; Wed, 06 Dec 2023 11:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701861385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7/oZHACPeEsD+mXYOiqtdmGuUQoOrWauvnLhXLrRq8s=;
 b=UgRZUp7twPJobQrEWl2ijOthEAVP01KUVG5qddMJSdrUgPw85VMVf67Tz+Z7U/hvxl+Y+J
 BUeX1mOh2bHSUhl7i78Hed3F2K4csGBb4IaB7zngWtRUWvPvtrMNmm7VVsn7MARE2a9tLG
 WShYWHk+VTSwEq1KPZGj68kGfSPCeFI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701861385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=7/oZHACPeEsD+mXYOiqtdmGuUQoOrWauvnLhXLrRq8s=;
 b=UgRZUp7twPJobQrEWl2ijOthEAVP01KUVG5qddMJSdrUgPw85VMVf67Tz+Z7U/hvxl+Y+J
 BUeX1mOh2bHSUhl7i78Hed3F2K4csGBb4IaB7zngWtRUWvPvtrMNmm7VVsn7MARE2a9tLG
 WShYWHk+VTSwEq1KPZGj68kGfSPCeFI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-KyLGvAs-PLqcDVG0tjPYzQ-1; Wed,
 06 Dec 2023 06:00:34 -0500
X-MC-Unique: KyLGvAs-PLqcDVG0tjPYzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 494E529ABA20;
 Wed,  6 Dec 2023 11:00:34 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4DAE40C6E2C;
 Wed,  6 Dec 2023 11:00:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: fstests@vger.kernel.org, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org
Subject: Issues with FIEMAP, xfstests, Samba, ksmbd and CIFS
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <447323.1701860432.1@warthog.procyon.org.uk>
Date: Wed, 06 Dec 2023 11:00:32 +0000
Message-ID: <447324.1701860432@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
 "Darrick J. Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-kernel@vger.kernel.org, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, Filipe Manana <fdmanana@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I've been debugging apparent cifs failures with xfstests, in particular
generic/009, and I'm finding that the tests are failing because FIEMAP is not
returning exactly the expected extent map.

The problem is that the FSCTL_QUERY_ALLOCATED_RANGES smb RPC op can only
return a list of ranges that are allocated and does not return any other
information about those allocations or the gaps between them - and thus FIEMAP
cannot express this information to the extent that the test expects.

Further, as Steve also observed, the expectation that the individual subtests
should return exactly those ranges is flawed.  The filesystem is at liberty to
split extents, round up extents, bridge extents and automatically punch out
blocks of zeros.  xfstests/common/punch allows for some of this, but I wonder
if it needs to be more fuzzy.

I wonder if the best xfstests can be expected to check is that the data we
have written is within the allocated regions.

Which brings me on to FALLOC_FL_ZERO_RANGE - is this guaranteed to result in
an allocated region (if successful)?  Samba is translating FSCTL_SET_ZERO_DATA
to FALLOC_FL_PUNCH_HOLE, as is ksmbd, and then there is no allocated range to
report back (Samba and ksmbd use SEEK_HOLE/SEEK_DATA rather than FIEMAP -
would a ZERO_RANGE even show up with that?).

Finally, should the Linux cifs filesystem translate gaps in the result of
FSCTL_QUERY_ALLOCATED_RANGES into 'unwritten' extents rather than leaving them
as gaps in the list (to be reported as holes by xfs_io)?  This smacks a bit of
adjusting things for the sake of making the testsuite work when the testsuite
isn't quite compatible with the thing being tested.

So:

 - Should Samba and ksmbd be using FALLOC_FL_ZERO_RANGE rather than
   PUNCH_HOLE?

 - Should Samba and ksmbd be using FIEMAP rather than SEEK_DATA/HOLE?

 - Should xfstests be less exacting in its FIEMAP analysis - or should this be
   skipped for cifs?  I don't want to skip generic/009 as it checks some
   corner cases that need testing, but it may not be possible to make the
   exact extent matching work.

Thanks,
David



