Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC4B8DF5C
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 18:20:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dEnkljSgZBBWEx29iqqKKjBka0JdK7b/IEnZNvSJ0AI=; b=de9TJfXHa7Aglj19lDV/th8xiP
	68SCw0dSOJLDyPagbP5hYTqF79gFf4VL1FzTTGu8Zoi1qK8QEONu82LniurwtrEP6G00JnAALzJMj
	JsMvpC11Inzhte3AqN60ry6ZQ9bF3fNPCUW/jKG/b41rldgEU6Vn/UoDULmnSMeajcqiZCLkEswot
	jhqVK4hgxO5Clzdb2Xs2fbmxxgRd7x4bCf1uD4mj43z+p+X7AFqEnXAXlugO+ylTYx9sijycCF/KF
	C4Ydgg2qQnU/r1KqzKuevkAp9Co28p9ekSgBASh8jWsU8vJIWwOCT7ZIepU33WOMtcGQfGyCNbMZu
	jFIBABGg==;
Received: from ip6-localhost ([::1]:31358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Mmm-004S9K-Q7; Sun, 21 Sep 2025 16:19:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36731) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Mmh-004S9C-D8
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 16:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758471568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dEnkljSgZBBWEx29iqqKKjBka0JdK7b/IEnZNvSJ0AI=;
 b=IAfQ80JmVRiWDRqp7sCw3JkjYvdkYHy3aENTQ6HvwjUhNemez3+yVv5U7d6Ts+zVZCFvrs
 MBtgUzOh8E15foiS6j5NaCBSW3tvg+++eB5vHpRSqyImlgF7GCmACCa+aEFp8STWyERngp
 h0k9EUGl6ExfjWOoecx9vWAcIeXDi6g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758471568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=dEnkljSgZBBWEx29iqqKKjBka0JdK7b/IEnZNvSJ0AI=;
 b=IAfQ80JmVRiWDRqp7sCw3JkjYvdkYHy3aENTQ6HvwjUhNemez3+yVv5U7d6Ts+zVZCFvrs
 MBtgUzOh8E15foiS6j5NaCBSW3tvg+++eB5vHpRSqyImlgF7GCmACCa+aEFp8STWyERngp
 h0k9EUGl6ExfjWOoecx9vWAcIeXDi6g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-AwuUUHwHPzOYlcS3Muy7_Q-1; Sun,
 21 Sep 2025 12:19:24 -0400
X-MC-Unique: AwuUUHwHPzOYlcS3Muy7_Q-1
X-Mimecast-MFC-AGG-ID: AwuUUHwHPzOYlcS3Muy7_Q_1758471563
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 884F81956089; Sun, 21 Sep 2025 16:19:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0C6D319560BB; Sun, 21 Sep 2025 16:19:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
To: Jeremy Allison <jra@samba.org>, Steve French <sfrench@samba.org>
Subject: How to cause a multipart SMB1 Trans2 PDU to occur
MIME-Version: 1.0
Date: Sun, 21 Sep 2025 17:19:20 +0100
Message-ID: <12788.1758471560@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Cyb4gt1wMcxChwYCI1Dj-zudWq0SSX8rB_mkwjSaPU_1758471563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12787.1758471560.1@warthog.procyon.org.uk>
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
Cc: dhowells@redhat.com, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jeremy, Steve,

Do you know if there's a way to cause Samba to generate a multipart SMB1
Transaction2 PDU?  I'm trying to test my revised reassembly code - but I think
there's a bug in the Linux cifs filesystem here with respect to signature
checking in such a case.

Note that QueryDir just splits across multiple RPCs.

David


