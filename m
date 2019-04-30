Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5382F807
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 14:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=TstEzPAivb4QWTgjILb41hJEVb9MlfnBqLodiFn/hJc=; b=0uB5M2r8V6QmwNNgNV6SHoVtFl
	jorIt6R31naGHKl5R6B3bVkJPGCz8qaqoVi0uYtTEz/KJ9+oKWV+9yJx5qsRJM+DYmwL8ZZkLoKw5
	ZHrXF7Pu/gbBQV5OSR82Xm8H+ORsXA17u3okzpoITR71oIvzbPIjtpp63DzhZEfwflu52TkaxPqVL
	QzUyogDAwpqc8fCZfGJUAS1B59uZgtCsxwqQi1IANZRqlD3Y9Eh0DG0DZEotgUA8CVVv+T9rNj3lR
	pkQ7NbWT3gukXfEpFe4hYU+pTRFSt/gMlqUKsn6pPcl+CEHOctX/G6lzH/cVF7dXKAEvTrTHBVagg
	IZIY1G6g==;
Received: from localhost ([::1]:41314 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLRV3-003pxO-N7; Tue, 30 Apr 2019 12:04:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:50818) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLRUu-003pxH-FR
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 12:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=TstEzPAivb4QWTgjILb41hJEVb9MlfnBqLodiFn/hJc=; b=u/MBlJiG2Ge7myxFs+HylnznS2
 Mpo2aWQ3N+ti4nIIoRoOmDg1niqjwBwDzjg8L2UReZPu6ENgtKmMObOltPP8R5oPbxtUGvekjQ66L
 42MIifJ2hZGh5lRR6E7sWOY91Yxmot6Ky7bvv1OfKecUpU6u8V97VXvcyhQlW2moosdo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLRUt-0002BZ-Tl; Tue, 30 Apr 2019 12:04:31 +0000
Date: Tue, 30 Apr 2019 14:04:30 +0200
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: smbd: implement SMB_FILE_NORMALIZED_NAME_INFORMATION handling
Message-ID: <20190430120430.jubmbutpnccifvaq@inti>
References: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <c1c3c497-fe35-000a-00eb-0cd653e25716@samba.org>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 01:25:34PM +0200, Stefan Metzmacher via samba-technical wrote:
>Hi,
>
>I just created https://gitlab.com/samba-team/samba/merge_requests/400
>with the patches to implement SMB_FILE_NORMALIZED_NAME_INFORMATION.
>
>Windows 10 (1803 and higher) support and use
>SMB_FILE_NORMALIZED_NAME_INFORMATION
>calls over the network. As a fallback (in case the server don't support
>it) the client traverses all path components, which is very expensive.
>
>Implementing SMB_FILE_NORMALIZED_NAME_INFORMATION is very cheap for us
>as the open already went through unix_convert() and we have the
>information the client is asking for.
>
>See also https://bugzilla.samba.org/show_bug.cgi?id=13919
>
>Please review and push:-)

thanks metze! I'll take a look.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

