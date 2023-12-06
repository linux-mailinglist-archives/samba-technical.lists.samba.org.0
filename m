Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDC4806FF5
	for <lists+samba-technical@lfdr.de>; Wed,  6 Dec 2023 13:39:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TZQQ6BqHEI6hRsDFbv1/FW96mENZWMKFWNl0n0AGdhw=; b=GdAJ5Z1KcWyaACzYIgH01sDqyZ
	4bcWJaprwIngLua/FjBQ9KD1V9bJfP2H5gPM9pTeaqg+NRwbWHEszzxOSHi4nvBD3QT7MCtY46qht
	r+0WkXllvk3LMw/FqtiPK/3R4FE2klEZzaEhS/X1VREF1l7q0c9NgwVLQNjgn61GyQZYPQKebigNl
	g6XeqdCfmaw7DraKJBOodF1CsxMLdVUJJRp/kcFgJhRqf9IaoXT8lTpqsNumRq10vIJ3FcF/7e2O8
	P6BnoxeX8afHipHXI0AllFBmQ5c0nCQggs13tzu++wbnRcFOKsst0D21HywB0B/Hne5tI4UJ+gMDX
	QEmVo0Mg==;
Received: from ip6-localhost ([::1]:41064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rArAr-004hjG-7x; Wed, 06 Dec 2023 12:38:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23094) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1rArAl-004hj6-Cn
 for samba-technical@lists.samba.org; Wed, 06 Dec 2023 12:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701866316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZQQ6BqHEI6hRsDFbv1/FW96mENZWMKFWNl0n0AGdhw=;
 b=jVISvmAWQCxftrAgR0WXMbr1r6rJPZTLPh+0On0WaSzV0TF+5AC94pV5915Rdo2BQzapDM
 cwKFcu1T5PfsT3CrbxqwW4cSxbPygJm+jUpFozoldVhTfjO06nz5gJlBir/BEgNtOezbB9
 vdN1SacXazgaHvpQo4j7FFmz7y/D3Gk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701866316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TZQQ6BqHEI6hRsDFbv1/FW96mENZWMKFWNl0n0AGdhw=;
 b=jVISvmAWQCxftrAgR0WXMbr1r6rJPZTLPh+0On0WaSzV0TF+5AC94pV5915Rdo2BQzapDM
 cwKFcu1T5PfsT3CrbxqwW4cSxbPygJm+jUpFozoldVhTfjO06nz5gJlBir/BEgNtOezbB9
 vdN1SacXazgaHvpQo4j7FFmz7y/D3Gk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-thj-CJ5vMACQz1wZWLOP9w-1; Wed,
 06 Dec 2023 07:38:31 -0500
X-MC-Unique: thj-CJ5vMACQz1wZWLOP9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F74F29AB3F3;
 Wed,  6 Dec 2023 12:38:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C252E3C2E;
 Wed,  6 Dec 2023 12:38:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <447324.1701860432@warthog.procyon.org.uk>
References: <447324.1701860432@warthog.procyon.org.uk>
To: fstests@vger.kernel.org, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org
Subject: Re: Issues with FIEMAP, xfstests, Samba, ksmbd and CIFS
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <449657.1701866309.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 Dec 2023 12:38:29 +0000
Message-ID: <449658.1701866309@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

David Howells <dhowells@redhat.com> wrote:

> So:
> =

>  - Should Samba and ksmbd be using FALLOC_FL_ZERO_RANGE rather than
>    PUNCH_HOLE?
> =

>  - Should Samba and ksmbd be using FIEMAP rather than SEEK_DATA/HOLE?

 - Should Samba and ksmbd report 'unwritten' extents as being allocated?

>  - Should xfstests be less exacting in its FIEMAP analysis - or should t=
his be
>    skipped for cifs?  I don't want to skip generic/009 as it checks some
>    corner cases that need testing, but it may not be possible to make th=
e
>    exact extent matching work.


