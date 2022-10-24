Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8953D60BCF9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Oct 2022 00:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AqUvKyhyUdpNHx2Qoj88ROb/yEnfoDx5lrEK8jVPKkk=; b=XnHyzHyQII/fiVpaGwHiRhXmTc
	S5qQFI9VhzD4fynDMAXwKL+STTt58Cf3xdCW7xYQLYghKcCuoSs5avYObWWcVGkdcX4Zzxhj1B95v
	7SslZtik4+63HBb3dDMJUa3fX17ApsIvUhwuer/Bh3mDGOiL8hAylY5wOrHrOFuWq/QISuVkkeYgX
	o+nGSl7102vQn8BY2rYJHVKrQw9WKA3UvZkWGtU4xUmqq5qKKscvmn10nPgyA3b4K/IQYSI1B0i83
	ZX+9k1qDW+hw9Y5R41Z7IrxF1Zf8MVh5wKewb4vZlHXQHXIz9ZjOyM77u+7exjvSn4YC5+IYHYJds
	w6f7AtCg==;
Received: from ip6-localhost ([::1]:28790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1on5Wn-005aOR-IE; Mon, 24 Oct 2022 22:02:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1on5Wh-005aMg-I6
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 22:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666648947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=AqUvKyhyUdpNHx2Qoj88ROb/yEnfoDx5lrEK8jVPKkk=;
 b=Nc1yQMdivzq7IepPqDM//nm3Gk+h7wh30dZ6hi9Aj/iLpNOrYm0CSBUbTqdXuG17QB/foT
 /oRUCrsfHpvaDtVE/+FCS305AGegPDsLyzqhqwgasbVEm8M+X3m0xsGIv//G0zyopvbeis
 YBarrezcwzuLRnso2WPzfkjqTwmQrO0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666648947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=AqUvKyhyUdpNHx2Qoj88ROb/yEnfoDx5lrEK8jVPKkk=;
 b=Nc1yQMdivzq7IepPqDM//nm3Gk+h7wh30dZ6hi9Aj/iLpNOrYm0CSBUbTqdXuG17QB/foT
 /oRUCrsfHpvaDtVE/+FCS305AGegPDsLyzqhqwgasbVEm8M+X3m0xsGIv//G0zyopvbeis
 YBarrezcwzuLRnso2WPzfkjqTwmQrO0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-iYnBC2noPqSd9WBhME0wTw-1; Mon, 24 Oct 2022 17:46:46 -0400
X-MC-Unique: iYnBC2noPqSd9WBhME0wTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 969E5382F1A9
 for <samba-technical@lists.samba.org>; Mon, 24 Oct 2022 21:46:35 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.2.16.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B16F1415114
 for <samba-technical@lists.samba.org>; Mon, 24 Oct 2022 21:46:23 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: vfswrap_getxattrat_do_async and unshare(CLONE_FS)
Date: Mon, 24 Oct 2022 23:46:22 +0200
Message-ID: <87czag28up.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
From: Florian Weimer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Florian Weimer <fweimer@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

As far as I can tell, vfswrap_getxattrat_do_async relies on
unshare(CLONE_FS) to do fgetxattrat emulation with a thread-local fchdir
and getxattr.  There do not seem to be any other uses in the sources.

I think the more usual way to emulate the missing fgetxattrat system
call is to open the file with openat and O_PATH, and then use getxattr
on the synthetic path under /proc/self/fd.  While these paths present as
symbolic links, they actually are not, so there is no race possible.
(fgetxattr cannot operate on the open file descriptor directly.)

Why wasn't the /proc-based approach chosen for Samba?  It looks a bit
simpler to implement, and does not do strange things to the process
state behind glibc's back.

This came up in a discussion regarding a proposal to implement an
interface for per-thread current working directories in glibc:

  Per-thread file system attributes
  <https://www.openwall.com/lists/libc-coord/2022/10/24/1>

Thanks,
Florian


